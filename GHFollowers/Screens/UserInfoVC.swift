//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by 1 on 12.01.2024.
//

import UIKit

protocol UserInfoVCDelegate: AnyObject {
    func getFollowersRequest(for username: String)
}

final class UserInfoVC: GFDataLoadingVC {
    
    var username: String!
    private let headerView = UIView()
    private let itemViewOne = UIView()
    private let itemViewTwo = UIView()
    private let dateLabel = GFBodyLabel(textAlignment: .center)
    weak var delegate: UserInfoVCDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        getUserInfo()
    }
    
    
    init(username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func didTapDoneButton() {
        dismiss(animated: true)
    }
    
    
    private func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(message: error.rawValue)
            }
        }
    }
    
    
    private func configureUIElements(with user: User) {
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: headerView)
        self.add(childVC: GFReposItemVC(user: user, delegate: self), to: itemViewOne)
        self.add(childVC: GFFollowersItemVC(user: user, delegate: self), to: itemViewTwo)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}

// MARK: - Set up UI
extension UserInfoVC {
    
    private func initialize() {
        configureView()
        layoutSubviews()
        configureConstraints()
    }
    
    
    private func configureView() {
        title = username
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    private func layoutSubviews() {
        view.addSubviews(headerView, itemViewOne, itemViewTwo, dateLabel)
    }
    
    
    private func configureConstraints() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        headerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(210)
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
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(itemViewTwo.snp.bottom).offset(12)
        }
    }
}

extension UserInfoVC: GFReposItemVCDelegate {
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(message: Strings.Alert.invalidGitHubLink)
            return
        }
        presentSafariController(with: url)
    }
}

extension UserInfoVC: GFFollowersItemVCDelegate {
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else { presentGFAlertOnMainThread(title: Strings.Alert.noFollowersTitle , message: Strings.Alert.noFollowersMessage, buttonTitle: Strings.Alert.noFollowersButton)
            return
        }
        delegate?.getFollowersRequest(for: user.login)
        dismiss(animated: true)
    }
}
