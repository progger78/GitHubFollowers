//
//  GFButton.swift
//  GHFollowers
//
//  Created by 1 on 09.01.2024.
//

import UIKit

final class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(color: UIColor, title: String, systemImage: UIImage) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImage: systemImage)
    }
    
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    
    func set(color: UIColor, title: String, systemImage: UIImage) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = systemImage
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}
