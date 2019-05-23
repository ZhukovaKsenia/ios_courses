//
//  AppDelegate.swift
//  StarWars
//
//  Created by Ksenia on 27/03/2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        guard let splitViewController = window?.rootViewController as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let masterViewController = leftNavController.topViewController as? MasterViewController,
            let detailViewController = splitViewController.viewControllers.last as? DetailViewController
            else { fatalError() }
        
        let firstFilm = masterViewController.films.first
        detailViewController.film = firstFilm
        
        masterViewController.delegate = detailViewController
        
        return true
    }
}
