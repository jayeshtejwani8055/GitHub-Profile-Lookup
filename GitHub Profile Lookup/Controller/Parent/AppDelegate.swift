//
//  AppDelegate.swift
//  GitHub Profile Lookup
//
//  Created by Jayesh Tejwani on 22/05/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        navToHome()
        return true
    }

    func navToHome() {
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        setNavigationViewController(rootVC: homeVC)
    }

    func setNavigationViewController(rootVC: UIViewController) {
        let navigation = JTNavigationViewController(rootViewController: rootVC)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }

}

