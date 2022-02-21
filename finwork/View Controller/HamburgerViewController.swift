//
//  HamburgerViewController.swift
//  
//
//  Created by Evan Lu on 2022/1/1.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class HamburgerViewController: UIViewController {
    
    
    

    
    @IBOutlet weak var user_photo: UIImageView!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var following: UILabel!
    
    
    @IBAction func logup(_ sender: Any) {
        if Auth.auth().currentUser != nil {
                do {
                    GIDSignIn.sharedInstance().signOut()
                    try Auth.auth().signOut()
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "SignUp")
                       vc.modalPresentationStyle = .overFullScreen
                    self.navigationController?.pushViewController(vc, animated: false)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
