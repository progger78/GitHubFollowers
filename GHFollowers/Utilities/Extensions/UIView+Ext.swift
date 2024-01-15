//
//  UIView+extension.swift
//  GHFollowers
//
//  Created by 1 on 09.01.2024.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
           addSubview($0)
        })
    }
}
