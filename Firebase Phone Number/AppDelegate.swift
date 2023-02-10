//
//  AppDelegate.swift
//  Firebase Phone Number
//
//  Created by Pratik Gavit on 10/02/23.
//

import UIKit
import FirebaseCore
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        if #available(iOS 13, *) {
                } else {
                    setupRoot()
                }
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

    func setupRoot() {
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLogin")
        if isLoggedIn {

            let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HeadlinesViewController")
            let navVC = UINavigationController(rootViewController: newVC)
            window?.rootViewController = navVC
        }
        else{
            let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
            let navVC = UINavigationController(rootViewController: newVC)
            window?.rootViewController = navVC
        }
        
        window?.makeKeyAndVisible()
        }
}

