//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by 1 on 12.01.2024.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {

    var avatarImage = GFAvatarImageView(frame: .zero)
    var usernameLbel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    var nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    var locationImageView = UIImageView()
    var locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    var bioLabel = GFBodyLabel(textAlignment: .left, numberOfLines: 3)
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        configure()


    }
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        avatarImage.downloadImage(with: user.avatarUrl)
        usernameLbel.text = user.login
        nameLabel.text = user.name ?? ""
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        locationImageView.tintColor = .secondaryLabel
        locationLabel.text = user.location ?? "Location not selected"
        bioLabel.text = user.bio ?? "Bio not available"
        
        
    }
    

}


extension GFUserInfoHeaderVC {
    
    
    func initialize() {
        layoutSubviews()
        configureConstraints()
        
    }
    
    func layoutSubviews() {
        view.addSubviews(avatarImage, usernameLbel, nameLabel, locationImageView, locationLabel, bioLabel)
    }
    
    func configureConstraints() {
        let padding: CGFloat = 20
        let textPadding: CGFloat = 12
        
        avatarImage.snp.makeConstraints { make in
            make.height.width.equalTo(90)
            make.leading.top.equalToSuperview().offset(padding)
        }
        
        usernameLbel.snp.makeConstraints { make in
            make.top.equalTo(avatarImage.snp.top)
            make.leading.equalTo(avatarImage.snp.trailing).offset(textPadding)
            make.trailing.equalToSuperview().inset(padding)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLbel.snp.bottom).offset(4)
            make.leading.equalTo(avatarImage.snp.trailing).offset(textPadding)
            make.trailing.equalToSuperview().inset(padding)

        }
        locationImageView.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImage.snp.bottom)
            make.leading.equalTo(avatarImage.snp.trailing).offset(textPadding)
            make.height.width.equalTo(18)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImageView.snp.centerY)
            make.leading.equalTo(locationImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().inset(padding)

        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImage.snp.bottom).offset(padding)
            make.leading.trailing.equalToSuperview().inset(padding)
            
        }
    }
}
