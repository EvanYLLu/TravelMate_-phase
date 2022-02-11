//
//  SignInViewController.swift
//  finwork
//
//  Created by Evan on 2021/7/20.
//

import UIKit
//import FirebaseUI

class SignInViewController: UIViewController//, FUIAuthDelegate
{
    @IBAction func facebookSignIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "adduser1")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func googleSignIn(_ sender: Any) {
    }
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
