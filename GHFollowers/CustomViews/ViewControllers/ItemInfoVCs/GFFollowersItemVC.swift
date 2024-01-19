//
//  GFFollowersItemVC.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//


import UIKit

protocol GFFollowersItemVCDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

final class GFFollowersItemVC: GFItemInfoVC {
    
    weak var delegate: GFFollowersItemVCDelegate?
    
    init(user: User, delegate: GFFollowersItemVCDelegate) {
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
        infoItemViewOne.set(infoItemType: .following, withCount: user.following)
        infoItemViewTwo.set(infoItemType: .followers, withCount: user.followers)
        actionButton.set(color: .systemGreen, title: Strings.ButtonTitle.getFollowers, systemImage: SFSymbols.followersIcon!)
    }
    
    
    override func didTapActionButton() {
        delegate?.didTapGetFollowers(for: user)
    }
}
