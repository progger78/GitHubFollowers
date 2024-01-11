//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import UIKit

class GFAlertVC: UIViewController {
    
    private let containerView = GFContainerView()
    private let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    private let messageLabel = GFBodyLabel(textAlignment: .center)
    private let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    private let padding: CGFloat = 20
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.buttonTitle = buttonTitle
        self.message = message
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
    }
}

extension GFAlertVC {
    
    private func initialize() {
        configureView()
        layoutSybviews()
        configureConstraints()
        setUpElements()
    }
    
    
    private func configureView() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    
    
    private func layoutSybviews() {
        view.addSubview(containerView)
        containerView.addSubviews(titleLabel, messageLabel, actionButton)
    }
    
    
    private func configureConstraints() {
        containerView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.trailing.equalToSuperview().inset(padding)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(40)
            make.leading.trailing.equalToSuperview().inset(padding)
        }
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-padding)
            make.leading.trailing.equalToSuperview().inset(padding)
            make.height.equalTo(45)
        }
    }
    
    private func setUpElements() {
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
    
}
