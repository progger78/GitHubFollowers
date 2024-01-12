//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import UIKit


class GFBodyLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, numberOfLines: Int = 0) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        
        configure()
    }
    
    private func configure() {
        textColor = .secondaryLabel
        lineBreakMode = .byWordWrapping
        font = UIFont.preferredFont(forTextStyle: .body)
        minimumScaleFactor = 0.75
        adjustsFontSizeToFitWidth = true
        
    }
    
}
