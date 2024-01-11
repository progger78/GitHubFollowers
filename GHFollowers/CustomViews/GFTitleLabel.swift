//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import UIKit

class GFTitleLabel: UILabel {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        textColor = .label
        lineBreakMode = .byTruncatingTail
        minimumScaleFactor = 0.9
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
