//
//  ErrorMessages.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import Foundation


enum GFError: String, Error {
    case invalidUsername  = "This username created an invalid request. Please try again"
    case unableToComplete = "Could complete your request. Please check your internet connection"
    case invalidResponse  = "Invalid response from the server. Please try again."
    case invalidData      = "Data recieved from the server is invalid. Please try again"
}
