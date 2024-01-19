//
//  GFFavoriteCell.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import UIKit

final class GFFavoriteCell: UITableViewCell {
    
    static let reuseID = "GFFavoriteCell"
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let userNameLabel = GFTitleLabel(textAlignment: .center, fontSize: 26)
    private var path: String?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(favorite: Follower) {
        self.path = favorite.avatarUrl
        avatarImageView.downloadImage(fromURL: favorite.avatarUrl)
        userNameLabel.text = favorite.login
    }
    
    
    private func configure() {
        addSubviews(avatarImageView, userNameLabel)
        accessoryType = .disclosureIndicator
        backgroundColor = .systemBackground
        
        let padding: CGFloat = 14
        
        avatarImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(padding)
            make.height.width.equalTo(60)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(avatarImageView.snp.trailing).offset(padding)
            make.height.equalTo(40)
        }
    }
}
