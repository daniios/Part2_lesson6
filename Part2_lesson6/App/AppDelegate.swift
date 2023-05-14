//
//  AppDelegate.swift
//  Part2_lesson6
//
//  Created by Даниил Чупин on 10.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let user = User(
            username: "admin",
            password: "password",
            name: "John Doe",
            age: 30,
            email: "johndoe@example.com",
            workExperience: "Senior Software Engineer at XYZ Company",
            education: "Bachelor's Degree in Computer Science",
            skills: ["Swift",
                     "iOS Development",
                     "Python",
                     "Problem Solving"],
            address: "123 Main Street, City, Country",
            phoneNumber: "+1234567890",
            portfolio: "https://www.johndoeportfolio.com",
            certificates: ["iOS Development Certification",
                           "Python Certification"],
            interests: ["Photography",
                        "Travel",
                        "Reading",
                        "Gaming"]
        )
        let userDefaults = UserDefaults.standard
        
        if let userData = user.toData() {
            userDefaults.set(userData, forKey: "userKey")
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


}

