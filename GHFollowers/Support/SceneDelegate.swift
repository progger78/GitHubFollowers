//
//  SceneDelegate.swift
//  GHFollowers
//
//  Created by 1 on 09.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbarController()
        window?.makeKeyAndVisible()
        
        configureNavigationBar()
    }
        
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    func creatFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesVC()
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesVC)
        
    }
    
    func createTabbarController() -> UITabBarController {
        let tabbar = UITabBarController()
        tabbar.tabBar.backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.viewControllers = [
            createSearchNC(),
            creatFavoritesNC()
        ]
        return tabbar
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }


}

