//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import UIKit
import SafariServices

extension UIViewController {
    
    
    func presentAsyncGFAlert(title: String? = nil, message: String?, buttonTitle: String? = nil) {
        let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
    
    func presentGFAlert(title: String? = nil, message: String?, buttonTitle: String? = nil) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
    func presentDefaultError() {
        let alertVC = GFAlertVC(alertTitle: "Unable to complete", message: GFError.unableToComplete.rawValue, buttonTitle: nil)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
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

