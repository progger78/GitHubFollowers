//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by 1 on 12.01.2024.
//

import UIKit

class UserInfoVC: UIViewController {

    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        NetworkManager.shared.getUserInfo(for: username) { [weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
        
        
    }
    
    @objc func didTapDoneButton() {
        dismiss(animated: true)
    }

}



extension UserInfoVC {
    
    
    func initialize() {
        configureView()
        layoutSubviews()
        configureConstraints()
        
    }
    
    
    func configureView() {
        title = username
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func layoutSubviews() {
        
    }
    
    func configureConstraints() {
        
    }
}
