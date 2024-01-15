//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import UIKit

final class GFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    
    private func configure() {
        textColor = .label
        lineBreakMode = .byTruncatingTail
        minimumScaleFactor = 0.9
        adjustsFontSizeToFitWidth = true
    }
}
