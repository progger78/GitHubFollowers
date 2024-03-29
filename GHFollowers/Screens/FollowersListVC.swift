//
//  FollowersListVC.swift
//  GHFollowers
//
//  Created by 1 on 09.01.2024.
//

import UIKit

final class FollowersListVC: GFDataLoadingVC {
    
    private enum Section { case main }
    
    private var username: String
    private var followers: [Follower] = []
    private var filteredFollowers: [Follower] = []
    private var page = 1
    private var hasMoreFollowers = true
    private var isLoadingMoreFollowers = false
    private var isSearching = false
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    
    init(username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        createSearchViewController()
        configureCollectionView()
        createSearchViewController()
        getFollowers(for: username, page: page)
        configureDataSource()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension FollowersListVC {
    
    private func configureViewController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = username
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapPlusButton))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    private func getFollowers(for username: String, page: Int ) {
        showLoadingView()
        isLoadingMoreFollowers = true
        Task {
            do { let followers = try await NetworkManager.shared.getFollowers(for: username, page: page)
                 updateUi(with: followers)
                 dismissLoadingView()
            } catch {
                if let gfEror = error as? GFError { presentAsyncGFAlert(message: gfEror.rawValue) } else { presentDefaultError() }
            }
            isLoadingMoreFollowers = false
        }
    }
    
    
    private func updateUi(with followers: [Follower]) {
        if followers.count < 100 { self.hasMoreFollowers = false }
        self.followers.append(contentsOf: followers)
        if self.followers.isEmpty {
            let message = Strings.Alert.noFollowersMessage
            DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
            return
        } 
        updateData(on: self.followers)
    }
    
    
    @objc func didTapPlusButton() {
        showLoadingView()
        Task {
            do {
                let user = try await NetworkManager.shared.getUserInfo(for: username)
                addUserToFavorites(user: user)
//                dismissLoadingView()
                
            } catch {
                guard let gfError = error as? GFError else { return }
                presentAsyncGFAlert(message: gfError.rawValue)
            }
            dismissLoadingView()
        }
    }
    
    
    private func addUserToFavorites(user: User) {
        let favorite = Follower(login: user.login, avatarUrl: user.avatarUrl)
        PersistanceManager.updateWith(favorite: favorite, actionType: .add) { [weak self] error in
            guard let self else { return }
            guard let error else {
                self.presentGFAlert(title: Strings.Alert.success, message: Strings.Alert.successAddToFavs , buttonTitle: Strings.ButtonTitle.perfect)
                return
            }
            self.presentGFAlert(message: error.rawValue)
        }
    }
}
    

// MARK: - Configure CollectionView
extension FollowersListVC {
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID)
    }
    
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseID, for: indexPath) as? GFFollowerCell else
            { return UICollectionViewCell() }
            cell.set(follower: follower)
            return cell
        })
    }
    
    
    private func updateData(on followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}

// MARK: - CollectionView delegate
extension FollowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers, !isLoadingMoreFollowers, !isSearching else { return }
            page += 1
            getFollowers(for: username, page: page)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sortedArray = isSearching ? filteredFollowers : followers
        let follower = sortedArray[indexPath.item]
        
        let vc = UserInfoVC(username: follower.login)
        vc.delegate = self
        
        let navController = UINavigationController(rootViewController: vc)
        present(navController, animated: true)
    }
}

// MARK: - SearchContoller configuration
extension FollowersListVC: UISearchResultsUpdating {
    
    func createSearchViewController() {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = Strings.TextField.usernameFilter
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        isSearching = true
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredFollowers.removeAll()
            updateData(on: followers)
            isSearching = false
            return }
        filteredFollowers = followers.filter {$0.login.lowercased().contains(filter.lowercased())}
        updateData(on: filteredFollowers)
    }
}

// MARK: -  Passing data for a particular user to show his followers
extension FollowersListVC: UserInfoVCDelegate {
    
    func getFollowersRequest(for username: String) {
        self.username = username
        title = username
        page = 1
        followers.removeAll()
        filteredFollowers.removeAll()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        getFollowers(for: username, page: page)
    }
}


