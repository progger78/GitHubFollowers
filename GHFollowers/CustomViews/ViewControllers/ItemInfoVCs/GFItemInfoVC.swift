//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import UIKit

class GFItemInfoVC: UIViewController {

    
    var infoItemViewOne = GFInfoItemView()
    var infoItemViewTwo = GFInfoItemView()
    var stackView = UIStackView()
    var actionButton = GFButton()
    weak var delegate: UserInfoVCDelegate?
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
        configureConstraints()
        configureStackView()
        configureActionButtn()
 
        
    }
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureActionButtn() {
        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
    }
    
    @objc func didTapActionButton() {}
    
    private func configureBackground() {
        view.addSubviews(stackView, actionButton)
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 18
    }
    
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubviews(infoItemViewOne, infoItemViewTwo)
    }
    

    private func configureConstraints() {
        let padding: CGFloat = 20

        stackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(50)
        }
        
        actionButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(padding)
            make.height.equalTo(45)
        }
        
    }
    
    

}
