//
//  GFContainerView.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import UIKit

final class GFContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configire()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configire() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        
        self.snp.makeConstraints { make in
            make.height.equalTo(230)
            make.width.equalTo(280)
        }
    }
}
