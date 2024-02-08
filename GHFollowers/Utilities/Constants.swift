//
//  Constants.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import UIKit

enum SFSymbols {
    static let reposIcon = UIImage(systemName:  "folder")
    static let gistsIcon = UIImage(systemName:  "text.alignleft")
    static let followingIcon = UIImage(systemName:  "heart.fill")
    static let followersIcon = UIImage(systemName:  "person.2")
    static let locationPin = UIImage(systemName:  "mappin.and.ellipse")
    static let searchImage = UIImage(systemName:  "magnifyingglass.circle")
    static let checkmark = UIImage(systemName:  "checkmark")
    static let favorites = UIImage(systemName:  "star")
}


enum Strings {
    enum TabBarTitle{
        static let searchTitle = "Поиск"
        static let favoritesTitle = "Избранные"
    }
    
    
    enum ButtonTitle {
        static let gitHubProfile = "Профиль GitHub"
        static let getFollowers = "Найти подписчиков"
        static let perfect = "Супер!"
    }
    
    
    enum Alert {
        static let standartTitle = "Что-то пошло не так..."
        static let standartMessage = "Невозможно выполнить запрос"
        
        static let noFollowersTitle = "Нет подписчиков"
        static let noFollowersMessage = "У этого пользователя нет подписчиков"
        static let noFollowersButton = "Очень печально"
        
        static let noFavoriteUsers = "У вас нет избранных пользоватлей, самое время кого-нибудь добавить😉"
        
        static let success  = "Успех🤩"
        static let successAddToFavs  = "Теперь этот пользователь в избранных!🎉"
        
        
        static let emptyUserTitle = "Нужно имя пользователя"
        static let emptyUserMessage = "Введите имя пользователя, чтоб понять кого мы ищем😃"
        
        static let unableToDelete = "Не получилось удалить"
        
        static let invalidGitHubLink = "Некорректный URL"
    }
    
    
    enum UserInfo {
        static let unselectedLocation = "Локация не выбрана"
        static let notSpecifieddBio = "Bio не доступно"
    }
    
    
    enum TextField {
        static let usernamePlaceholder = "Введите имя пользователя"
        static let usernameFilter = "Найти пользователя по имени"
    }
}


enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}


enum Images {
    static let ghLogo =  UIImage(named: "gh-logo")
    static let placeHolder =  UIImage(named: "avatar-placeholder")
    static let locationPin =  UIImage(systemName: "mappin.and.ellipse")
    static let emptyStateLogo =  UIImage(named: "empty-state-logo")
}


