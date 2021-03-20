//
//  AppDelegate.swift
//  KindleApp
//
//  Created by Nikita Popov on 17.03.2021.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        if #available(iOS 13.0, *) {
//            let appearance = UINavigationBarAppearance()
//            appearance.backgroundColor = UIColor(displayP3Red: 248/255, green: 248/255, blue: 248/255, alpha: 0.5)
//            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
//            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
//            
//            UINavigationBar.appearance().tintColor = .systemBlue
//            UINavigationBar.appearance().standardAppearance = appearance
//            UINavigationBar.appearance().compactAppearance = appearance
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        } else {
//            UINavigationBar.appearance().tintColor = .systemBlue
//            UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
//            UINavigationBar.appearance().isTranslucent = false
//
//        }
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

