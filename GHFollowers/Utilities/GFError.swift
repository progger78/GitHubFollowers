//
//  ErrorMessages.swift
//  GHFollowers
//
//  Created by 1 on 10.01.2024.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "Неверное имя пользователя. Попробуйте ввести другое"
    case unableToComplete   = "Не получилось выполнить запрос. Проверьте интернет-соединение"
    case invalidResponse    = "Некорректный ответ от сервера. Попробуйте позже."
    case invalidData        = "Некорректные данные с сервера. Попробуйте позже"
    case unableToFavorite   = "Не получилось добавить в избранное. Попробуйте позже"
    case alreayInFavorites  = "Этот пользователь уже в избранных👌🏻"
}
