//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Tomislav Tomic on 30.07.2021..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        let nc = UINavigationController(rootViewController: TabBarViewController())
        nc.isNavigationBarHidden = true
        window?.rootViewController = nc
        
        return true
    }
}
