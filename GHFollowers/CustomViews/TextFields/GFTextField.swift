//
//  GFTextField.swift
//  GHFollowers
//
//  Created by 1 on 09.01.2024.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        placeholder = Strings.TextField.usernamePlaceholder
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        backgroundColor = .tertiarySystemBackground
        
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
    }
}
