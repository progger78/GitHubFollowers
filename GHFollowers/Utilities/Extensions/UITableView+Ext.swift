//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by 1 on 15.01.2024.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async{
            self.reloadData()
        }
    }
}
