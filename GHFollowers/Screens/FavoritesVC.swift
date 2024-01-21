//
//  FavoritesVC.swift
//  GHFollowers
//
//  Created by 1 on 09.01.2024.
//

import UIKit

final class FavoritesVC: UIViewController {
    
    private var favorites: [Follower] = []
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    
    private func getFavorites() {
        PersistanceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favorites):
                if favorites.isEmpty {
                    self.showEmptyStateView(with: Strings.Alert.noFavoriteUsers, in: view)
                }
                else {
                    updateTableView(with: favorites)
                }
            case .failure(let error):
                self.presentGFAlert(message: error.rawValue)
            }
        }
    }
    
    
    private func updateTableView(with favorites: [Follower]) {
        self.favorites = favorites
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.bringSubviewToFront(self.tableView)
        }
    }
    
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        title = "Your favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        
        tableView.register(GFFavoriteCell.self, forCellReuseIdentifier: GFFavoriteCell.reuseID)
    }
}

extension FavoritesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { favorites.count }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GFFavoriteCell.reuseID) as? GFFavoriteCell else {
            return UITableViewCell()
        }
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let favorite = favorites[indexPath.row]
        let vc = UserInfoVC(username: favorite.login)
        
        present(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        PersistanceManager.updateWith(favorite: favorites[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            
            guard let error = error else {
                favorites.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
                if favorites.count == 0 { DispatchQueue.main.async { 
                    UIView.animate(withDuration: 0.3) {
                        self.showEmptyStateView(with: Strings.Alert.noFavoriteUsers, in: self.view) }
                    }
                }
                return }
            self.presentGFAlert(title: Strings.Alert.unableToDelete, message: error.rawValue)
        }
    }
}
