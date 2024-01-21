//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by 1 on 11.01.2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeHolderImage = Images.placeHolder
    let cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(fromURL url: String) {
        Task { image =  await NetworkManager.shared.downloadImage(with: url) ?? placeHolderImage }
    }
}
