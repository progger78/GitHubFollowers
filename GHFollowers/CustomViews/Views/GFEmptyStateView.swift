//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by 1 on 12.01.2024.
//

import UIKit

final class GFEmptyStateView: UIView {
    
    private let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    private let logoImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    
    func configure() {
        backgroundColor = .systemBackground
        addSubviews(messageLabel, logoImageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        logoImageView.image = Images.emptyStateLogo
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-150)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(200)
            make.width.equalTo(self.snp.width).multipliedBy(1.3)
            make.height.equalTo(self.snp.width).multipliedBy(1.3)
        }
    }
}
