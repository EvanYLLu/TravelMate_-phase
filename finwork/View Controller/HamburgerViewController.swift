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
import FirebaseStorage

class HamburgerViewController: UIViewController {
    
    
    //let itemViewModel : user = AddUserViewModels.userItems as! user

    
    @IBOutlet weak var user_photo: UIImageView!
    @IBOutlet weak var user_name: UILabel!
    @IBOutlet weak var following: UILabel!
    
    @IBAction func user_pofile(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "userpofile")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
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
    
    func getUser(withViewModel viewModel: user) -> (Void) {
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let ref = storageRef.child(viewModel.user_imagetext!)
        user_photo.sd_setImage(with: ref)
        
        user_name.text = viewModel.user_nikename
        following.text = viewModel.follower.count as! String + "位粉絲"
     }
    
    override func viewDidLayoutSubviews() {
        user_photo.layer.cornerRadius = user_photo.frame.size.height/2
                user_photo.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        db.collection("users").whereField("user_id", isEqualTo: SignInViewController.user_email)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("TLV136","\(document.documentID) => \(document.data())")
                        
                        self.user_name.text = document.data()[ "user_nikename"] as? String
                        let follower: [String] = document.data()[ "follower"] as! [String]
                        self.following.text = "\(follower.count)位粉絲"
                        
                        let storage = Storage.storage()
                        let storageRef = storage.reference()
                        let ref = storageRef.child(document.data()[ "user_imagetext"] as! String)
                        self.user_photo.sd_setImage(with: ref)
                        
        
        //getUser(withViewModel: itemViewModel)
        
        // Do any additional setup after loading the view.
    }
                }
                
            }
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
