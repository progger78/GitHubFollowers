//
//  SearchVC.swift
//  GHFollowers
//
//  Created by 1 on 09.01.2024.
//

import UIKit
import SnapKit

final class SearchVC: UIViewController {
    
    private let logoImageView = UIImageView()
    private let userNameTextField = GFTextField()
    private let callToActionButton = GFButton(color: .systemGreen, title: Strings.ButtonTitle.getFollowers, systemImage: SFSymbols.searchImage!)
    private var isUsernNameEntered: Bool { return !userNameTextField.text!.isEmpty }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        userNameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    

    @objc func pushFollowerListVC() {
        guard isUsernNameEntered else {
            presentGFAlertOnMainThread(title: Strings.Alert.emptyUserTitle, message: Strings.Alert.emptyUserMessage)
            return }
        let username = userNameTextField.text!
        let followersListVC = FollowersListVC(username: username)
        
        userNameTextField.resignFirstResponder()
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}

// MARK: - Set up UI
extension SearchVC {
    
    private func initialize() {
        configureView()
        layoutSubviews()
        configureConstraints()
        configureCallToActionButton()
    }
    
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        createDismissKeyboardTapGesture()
        userNameTextField.delegate = self
    }
    
    
    private func configureLogoView() {
        logoImageView.image = Images.ghLogo
    }
    
    
    private func configureCallToActionButton() {
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
    }
    
    
    private func layoutSubviews() {
        configureLogoView()
        view.addSubviews(logoImageView, userNameTextField, callToActionButton)
    }
    
    
    private func configureConstraints() {
        logoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().dividedBy(1.5)
            $0.width.height.equalTo(200)
            $0.centerX.equalToSuperview()
        }
        
        userNameTextField.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.top.equalTo(logoImageView.snp_bottomMargin).offset(40)
            $0.height.equalTo(50)
        }
        
        callToActionButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(60)
            $0.height.equalTo(50)
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
