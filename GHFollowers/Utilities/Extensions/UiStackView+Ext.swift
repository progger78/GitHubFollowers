//
//  UiStackView+Ext.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import UIKit



extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach({
            addArrangedSubview($0)
        })
    }
}
