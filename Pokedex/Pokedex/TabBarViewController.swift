//
//  TabBarViewController.swift
//  Pokedex
//
//  Created by Tomislav Tomic on 30.07.2021..
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let vc1 = HomeViewController()
        vc1.tabBarItem.image = UIImage(systemName: "house")
        
        let vc2 = PokeListViewController(viewModel: PokeListViewModel())
        vc2.tabBarItem.image = UIImage(systemName: "heart.text.square")
        
        let vc3 = FavoriteVC()
        vc3.tabBarItem.image = UIImage(systemName: "star.fill")
        
        self.viewControllers = [vc1, vc2, vc3]
        
    }
}
