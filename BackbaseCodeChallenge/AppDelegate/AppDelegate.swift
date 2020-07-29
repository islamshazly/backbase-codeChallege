//
//  AppDelegate.swift
//  BackbaseCodeChallenge
//
//  Created by islam Elshazly on 24/07/2020.
//  Copyright © 2020 Islam Elshazly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: - App Life Cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Utility.setupAppAppearance()
        executeMainBuilder()
        
        return true
    }
    
    // MARK: - Builder
    
    func executeMainBuilder() {

        window = UIWindow()
        window?.rootViewController = CityListBuilder().buildWithNavigationController()
        window?.makeKeyAndVisible()
    }
}

