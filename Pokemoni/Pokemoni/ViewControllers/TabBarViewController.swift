//
//  TabBarViewController.swift
//  Pokemoni
//
//  Created by Tomislav Tomic on 01.08.2021..
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
        
        let vc2 = PokeListViewController()
        vc2.tabBarItem.image = UIImage(systemName: "heart.text.square")
        
        self.viewControllers = [vc1, vc2]
        
    }
}
