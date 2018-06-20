//
//  AppDelegate.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notificationManager = NotificationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        UINavigationBar.appearance().barTintColor = Color.teal.base
//        UINavigationBar.appearance().barStyle = UIBarStyle.black
//        UINavigationBar.appearance().tintColor = Color.white
//
//        UITabBar.appearance().barTintColor = Color.teal.base
//        UITabBar.appearance().barStyle = UIBarStyle.default
//        UITabBar.appearance().tintColor = Color.white
//
//        UITabBar.appearance().unselectedItemTintColor = Color.black.withAlphaComponent(0.30)
        
        ESTConfig.setupAppID("smart-shopping-fys", andAppToken: "312f109fe4656098fc18b1ceccba96ae")
        
        /** TODO: Make sure your beacons have Estimote Monitoring feature set enabled:
         https://community.estimote.com/hc/en-us/articles/226144728
         */
        
//        self.notificationManager.enableNotifications(deviceIdentifier: "eaff786a6a8a3a53c0136916842be606",
//                                                     enterMessage: "Hello, world! ✌️",
//                                                     exitMessage: "Goodbye! 👋")
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.hexString()
        //TODO: Submit this token to server
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

