//
//  GFReposItemVC.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import UIKit


class GFReposItemVC: GFItemInfoVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        infoItemViewOne.set(infoItemType: .repos, withCount: user.publicRepos)
        infoItemViewTwo.set(infoItemType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func didTapActionButton() {
        delegate?.didTapGitHubProfile(for: user)
    }
}
