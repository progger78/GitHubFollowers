//
//  GFFollowerCell.swift
//  GHFollowers
//
//  Created by 1 on 11.01.2024.
//

import UIKit

final class GFFollowerCell: UICollectionViewCell {
    
    static let reuseID = "GFFollowerCell"
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let userNameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    private let padding: CGFloat = 8
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower) {
        userNameLabel.text = follower.login
        avatarImageView.downloadImage(fromURL: follower.avatarUrl)
    }
    
    
    private func configure() {
        addSubviews(avatarImageView, userNameLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView).inset(padding)
            make.height.equalTo(avatarImageView.snp.width)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.top.equalTo(avatarImageView.snp.bottom).offset(padding)
            make.height.equalTo(20)
        }
    }
}
