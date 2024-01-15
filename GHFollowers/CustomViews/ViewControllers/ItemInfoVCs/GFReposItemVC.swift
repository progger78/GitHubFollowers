//
//  GFReposItemVC.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import UIKit

protocol GFReposItemVCDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
}

final class GFReposItemVC: GFItemInfoVC {
    
    weak var delegate: GFReposItemVCDelegate?
    
    
    init(user: User, delegate: GFReposItemVCDelegate) {
        self.delegate = delegate
        super.init(user: user)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        infoItemViewOne.set(infoItemType: .repos, withCount: user.publicRepos)
        infoItemViewTwo.set(infoItemType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: Strings.ButtonTitle.gitHubProfile)
    }
    
    
    override func didTapActionButton() {
        delegate?.didTapGitHubProfile(for: user)
    }
}
