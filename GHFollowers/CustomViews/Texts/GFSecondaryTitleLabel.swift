//
//  GFSecondaryTitleLabel.swift
//  GHFollowers
//
//  Created by 1 on 12.01.2024.
//

import UIKit

final class GFSecondaryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    
    private func configure() {
        textColor = .secondaryLabel
        lineBreakMode = .byTruncatingTail
        minimumScaleFactor = 0.9
        adjustsFontSizeToFitWidth = true
    }
}
