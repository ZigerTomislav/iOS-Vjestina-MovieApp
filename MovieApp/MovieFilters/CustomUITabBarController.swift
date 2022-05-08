//
//  UITabBarController.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 07.05.2022..
//

import Foundation
import UIKit
class CustomUITabBarController : UITabBarController {
    
    let vc1 = MovieListViewController()
    let house = UIImage(systemName: "house")
    let heart = UIImage(systemName: "heart")
    
    
    let vc2 = FavoritesViewController()
//        vc1.tabBarItem = UITabBarItem(title: "Home", image: house, selectedImage: .add)
//        vc2.tabBarItem = UITabBarItem(title: "Favorites", image: heart, selectedImage: .add)
    
//    self.setViewControllers([vc2], animated: false)
    
}
