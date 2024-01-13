//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by 1 on 12.01.2024.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class UserInfoVC: UIViewController {
    
    
    var username: String!
    var headerView = UIView()
    var itemViewOne = UIView()
    var itemViewTwo = UIView()
    var dateLabel = GFBodyLabel(textAlignment: .center)
    weak var delegate: FollowersListVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        getUserInfo()
        
        
    }
    
    @objc func didTapDoneButton() {
        dismiss(animated: true)
    }
    
    
    private func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(with: user)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    private func configureUIElements(with user: User) {
        
        let repoItemVC = GFReposItemVC(user: user)
        repoItemVC.delegate = self
        
        let followersItemVC = GFFollowersItemVC(user: user)
        followersItemVC.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followersItemVC, to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToDisplayDate())"
    }
    
}



extension UserInfoVC {
    
    
    func initialize() {
        configureView()
        layoutSubviews()
        configureConstraints()
        
    }
    
    
    func configureView() {
        title = username
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func layoutSubviews() {
        view.addSubviews(headerView, itemViewOne, itemViewTwo, dateLabel)
    }
    
    
    func configureConstraints() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        headerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(180)
        }
        
        itemViewOne.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(padding)
            make.leading.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(itemHeight)
        }
        
        itemViewTwo.snp.makeConstraints { make in
            make.top.equalTo(itemViewOne.snp.bottom).offset(padding)
            make.leading.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(itemHeight)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.centerX.equalToSuperview()
            make.top.equalTo(itemViewTwo.snp.bottom).offset(12)
        }
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}


extension UserInfoVC: UserInfoVCDelegate {
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Somthing went wron", message: "The url attached to this user is invalid", buttonTitle: "Got it")
            return
        }
        presentSafariController(with: url)
    }
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else { presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers and it's sad", buttonTitle: "Really sad")
            return
        }
        delegate?.getFollowersRequest(for: user.login)
        dismiss(animated: true)
    }
    
    
    
}
