//
//  AppDelegate.swift
//  finwork
//
//  Created by Evan on 2021/6/19.
//

import UIKit
import GoogleMaps
import Firebase
import FirebaseFirestore
import FirebaseCore
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    FBSDKCoreKit.ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    

    Thread.sleep(forTimeInterval: 0.02)
   GMSServices.provideAPIKey("AIzaSyCnxEsviVbzh1zF9MHUFoKZODZjUAyKOak")
    FBSDKCoreKit.Settings.appID = "509149590613387"
    FirebaseApp.configure()
    GIDSignIn.sharedInstance()?.clientID = "978340723728-2142ihi1pm6cd465p9b3rpi2iiu6fep6.apps.googleusercontent.com"
    GIDSignIn.sharedInstance()?.delegate = self
    return true
}
      /*
func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
    ApplicationDelegate.shared.application(
        app,
        open: url,
        sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
        annotation: options[UIApplication.OpenURLOptionsKey.annotation]
    )
    return GIDSignIn.sharedInstance()!.handle(url)
}*/
    func application(_ app: UIApplication,
                         open url: URL,
                         options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
            return ApplicationDelegate.shared.application(app, open: url, options: options)
        }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("Your email is \(user.profile.email ?? "No email")")
        
        SignInViewController.user_login(email: user.profile.email)
        
        //SignInViewController.user_email = user.profile.email
        //SignInViewController.chack_login()
        guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { (User, Error) in
                if let error = error {
                    print(Error)
                    return
                }
            }
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
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
