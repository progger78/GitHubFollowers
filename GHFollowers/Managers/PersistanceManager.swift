//
//  PersistanceManager.swift
//  GHFollowers
//
//  Created by 1 on 13.01.2024.
//

import Foundation

enum PersistanceActionType { case add, remove }

enum PersistanceManager {
    
    static private let defaults = UserDefaults.standard
    enum Keys { static let favorites = "Favorites" }
    
    
    static func retrieveFavorites(completed: @escaping(Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    
    static func save(followers: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(followers)
            defaults.setValue(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    
    static func updateWith(favorite: Follower, actionType: PersistanceActionType, completed: @escaping(GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreayInFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                completed(save(followers: favorites))
            case .failure(let error):
                completed(error)
            }
        }
    }
}
