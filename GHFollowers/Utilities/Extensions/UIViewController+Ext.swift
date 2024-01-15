//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String?, message: String?, buttonTitle: String?) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
        
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    
    func presentSafariController(with url: URL) {
        let safariController = SFSafariViewController(url: url)
        safariController.preferredControlTintColor = .systemGreen
        present(safariController, animated: true)
    }
}
