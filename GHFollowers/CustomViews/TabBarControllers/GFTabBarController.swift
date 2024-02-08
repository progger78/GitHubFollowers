//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by 1 on 14.01.2024.
//

import UIKit

final class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()

    }
    
    
    private func configureTabBar() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [ createSearchNC(), createFavoritesNC()]
        
    }
    
    
    private func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = Strings.TabBarTitle.searchTitle
        searchVC.tabBarItem = UITabBarItem(title: "Поиск", image: SFSymbols.searchImage, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    private func createFavoritesNC() -> UINavigationController {
        let favoritesVC = FavoritesVC()
        favoritesVC.title = Strings.TabBarTitle.searchTitle
        favoritesVC.tabBarItem = UITabBarItem(title: "Избранные", image: SFSymbols.favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesVC)
        
    }
    
    
}






