//
//  UIHelper.swift
//  GHFollowers
//
//  Created by 1 on 11.01.2024.
//

import UIKit


struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 20
        let minimumItemSpacing: CGFloat = 10
        let availabelSpace = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availabelSpace / 3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
    
}
