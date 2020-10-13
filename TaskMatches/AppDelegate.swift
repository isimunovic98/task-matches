//
//  AppDelegate.swift
//  TaskMatches
//
//  Created by Ivan Simunovic on 13/10/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.\
        
        let firstScene = InputScreenViewController()
        firstScene.title = "MATCHES"
        let navigationController = UINavigationController(rootViewController: firstScene)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true

    }

}

