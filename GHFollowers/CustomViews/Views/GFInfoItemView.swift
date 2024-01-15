//
//  GFInfoItemView.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import UIKit

enum InfoItemType: String {
    case repos = "Public Repos"
    case gists = "Public Gists"
    case following = "Following"
    case followers = "Followers"
}

class GFInfoItemView: UIView {
    
    let iconImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        addSubviews(iconImageView, titleLabel, countLabel)
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.tintColor = .label
    }
    
    
    private func configureConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.height.width.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(4)
            make.trailing.equalToSuperview()
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.height.equalTo(18)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
    }
    
    
    func set(infoItemType: InfoItemType, withCount count: Int) {
        let rawValue = infoItemType.rawValue
        switch infoItemType {
        case .repos:
            iconImageView.image = SFSymbols.reposIcon
            titleLabel.text = rawValue
        case .gists:
            iconImageView.image = SFSymbols.gistsIcon
            titleLabel.text = rawValue
        case .following:
            iconImageView.image = SFSymbols.followingIcon
            titleLabel.text = rawValue
        case .followers:
            iconImageView.image = SFSymbols.followersIcon
            titleLabel.text = rawValue
        }
        countLabel.text = String(count)
    }
}
