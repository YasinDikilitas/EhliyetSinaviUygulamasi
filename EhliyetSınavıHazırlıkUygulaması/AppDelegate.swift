//
//  AppDelegate.swift
//  EhliyetSınavıHazırlıkUygulaması
//
//  Created by Yasin Dikilitas on 7.08.2021.
//

import UIKit
import Parse
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let configuration = ParseClientConfiguration { ParseMutableClientConfiguration  in
                    
            ParseMutableClientConfiguration.applicationId = "FxSh4BAq1ZO9UAbLCbn6gCjB8PUszd0kfIj21Xrw"
            ParseMutableClientConfiguration.clientKey = "YgtDJWsyKaMBRTjOmhc7hiAGnUuMXeqRaQbzVPdR"
            ParseMutableClientConfiguration.server = "https://parseapi.back4app.com/"
            
            
        }
        
        Parse.initialize(with: configuration)
        
        let installation = PFInstallation.current()
        installation!.saveInBackground()
        
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

