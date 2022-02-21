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


class SignInViewController: UIViewController//, FUIAuthDelegate
{
    static var user_email: String = ""
    
    //let db = Firestore.firestore()
    //let citiesRef = db.collection("users")

    
    static func chack_login() {
        
        if GIDSignIn.sharedInstance()?.currentUser != nil {
            
            //GIDSignIn.sharedInstance().signIn()


        } else {
            //
            GIDSignIn.sharedInstance().signIn()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
               vc.modalPresentationStyle = .overFullScreen
            
        }

        
    }
    
    @IBAction func facebookSignIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
        
    @IBAction func google_signIn(_ sender: Any) {
        print("SI45")
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
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
               vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        //登錄用的
        
                 

        
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
