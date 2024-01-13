//
//  GFFollowersItemVC.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import Foundation


import UIKit


class GFFollowersItemVC: GFItemInfoVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        infoItemViewOne.set(infoItemType: .following, withCount: user.following)
        infoItemViewTwo.set(infoItemType: .followers, withCount: user.followers)
        actionButton.set(backgroundColor: .systemGreen, title: "Get followers")
    }
    
    override func didTapActionButton() {
        delegate?.didTapGetFollowers(for: user)
    }
}
