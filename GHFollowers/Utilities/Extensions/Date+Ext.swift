//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
