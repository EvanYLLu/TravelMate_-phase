//
//  SignInViewController.swift
//  finwork
//
//  Created by Evan on 2021/7/20.
//

import UIKit
import FirebaseUI
//import FirebaseCore
import Firebase
import FirebaseFirestore
import GoogleSignIn
import FBSDKLoginKit

class SignInViewController: UIViewController//, FUIAuthDelegate
{
    static var user_email: String = ""
    
    //let db = Firestore.firestore()
    //let citiesRef = db.collection("users")

    @IBOutlet weak var facebook_login: FBLoginButton! = {
        let button = FBLoginButton()
        button.permissions = ["email,pudlic_profile"]
        return button
    }()
    static func chack_login() {
        
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            
            //GIDSignIn.sharedInstance().signIn()


        } else {
            
            
            
            
            //
            GIDSignIn.sharedInstance().signIn()
            print("Successfully logged user in",GIDSignIn.sharedInstance().currentUser.profile.email)
            /**
            GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
                            guard error == nil else { return }
                            guard let user = user else { return }

                            let emailAddress = user.profile?.email

                            let fullName = user.profile?.name
                            let givenName = user.profile?.givenName
                            let familyName = user.profile?.familyName

                            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
                        }
             
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
               vc.modalPresentationStyle = .overFullScreen
             */
        }

        
    }
    
    @IBAction func facebookSignIn(_ sender: Any) {
        /**
        if let token = AccessToken.current,
                !token.isExpired {
                // User is logged in, do work such as go to next view controller.
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
                       vc.modalPresentationStyle = .overFullScreen
                    self.navigationController?.pushViewController(vc, animated: false)
                }*/
        }
        
        
    
        
    @IBAction func google_signIn(_ sender: Any) {
        print("SI45")
        GIDSignIn.sharedInstance().signIn()
        //print("Successfully logged user in",GIDSignIn.sharedInstance().currentUser.profile.email)
        //user_login(email: GIDSignIn.sharedInstance().currentUser.profile.email)
        /*
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            
            GIDSignIn.sharedInstance().signIn()


        } else {
            //
            GIDSignIn.sharedInstance().signIn()
           
            
            db.collection("users").getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    let citiesRef = db.collection("users")
                    let query = citiesRef.whereField("user_id", isEqualTo: SignInViewController.user_email)
                    print("query",query)
                    //if query != ""{
                    
                   // }
                }
                
                //print("Successfully logged user in",GIDSignIn.sharedInstance().currentUser.profile.email)
            
          
        }
    }
         */
    }
    
                //let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
                   //vc.modalPresentationStyle = .overFullScreen
                //self.navigationController?.pushViewController(vc, animated: false)
            
        
    
    @IBAction func appleIDSignIn(_ sender: Any) {
    }
    /*

    @IBAction func loginButton(_ sender: Any) {
        if let authUI = FUIAuth.defaultAuthUI(){
            authUI.providers = [FUIOAuth.appleAuthProvider()]
            authUI.delegate = self
            
            let authViewController = authUI.authViewController()
            self.present(authViewController, animated: true)
        }
        
        func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
            if let user = authDataResult?.user{
                print("You've signed in as \(user.uid). Your email is \(user.email ?? "")")
            }
        }
           
    
    } */
    
    static func user_login(email: String) {
        let db = Firestore.firestore()
        db.collection("users").whereField("user_id", isEqualTo: email).getDocuments{
            (querySnapshot, error) in
            if let error = error {
                
                
                /**
                
                 */
            } else {
                let document = querySnapshot!.documents.first
                if document == nil {
                    print("沒找到")
                    //gosign()
                } else {
                    print("有找到",document)
                    //gomain()
                    
                }
                
                
                
                /**
                
                 */
                return
            }
        }
    }
    
    func gomain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "index")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func gosign() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
                           vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        //登錄用的
        
        //facebooklogin.center = view.center
        //view.addSubview(facebooklogin)
                 
        facebook_login.permissions = ["public_profile", "email"]
        facebook_login.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SignInViewController:LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        guard let token = result?.token?.tokenString else {
            print("User failed to log in wift facebook")
            return
        }
        let facebookRequest = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                         parameters: ["fields": "email, name"],
                                                         tokenString: token,
                                                         version: nil,
                                                         httpMethod: .get)
        facebookRequest.start(completionHandler: { _, result, error in
            guard let result = result as? [String: Any], error == nil else {
                print("Failed to make facebook graph request")
                return
            }
            print(result)
            let credential = FacebookAuthProvider.credential(withAccessToken: token)
                    Firebase.Auth.auth().signIn(with: credential, completion: { [weak self]authResult, error in
                        guard let strongSelf = self else {
                            return
                        }
                        

                        guard authResult != nil, error == nil else {
                            if let error = error {
                                
                                print("Facebook credential login failed, MFA may be needed - \(error)")
                            }
                            
                            return
                        }
                        print("Successfully logged user in")
                        //let user: [String: Any] = result
                        print(result["email"])
                        SignInViewController.user_login(email: result["email"] as! String)
                        
                    })

        })
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        //
    }
    
    
}
