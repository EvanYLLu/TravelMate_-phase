//
//  IntroduceViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/2/13.
//

import UIKit
import FirebaseFirestore

class IntroduceViewController: UIViewController {

    static let defulvalue: String = "none"
    static let defulvalue2: [String] = []
    @IBOutlet weak var start_btn: UIButton!
    
    
    @IBAction func start(_ sender: Any) {
        
        createUser()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "index")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func createUser() {
        
        let userItem = user(id: "", user_imagetext: "", user_name: AddUserDataViewController.basicData.user_name, user_id: SignInViewController.user_email, user_nikename: AddUserDataViewController.basicData.user_nikename, user_gender: AddUserDataViewController.basicData.user_gender, user_birthday: AddUserDataViewController.basicData.user_birthday!, user_habitat: AddUserDataViewController.basicData.user_habitat, user_license: AddLicenseViewController.license, user_hobbies: AddHobbiesViewController.user_hobbies, follower: IntroduceViewController.defulvalue2, introduce_content: IntroduceViewController.defulvalue, voyeur: IntroduceViewController.defulvalue2)
        
        var ref:DocumentReference? = nil
        ref = cdb.db.collection("users").addDocument(data: userItem.dictionary) {
            error in
            
            if let error = error {
                print("error of adding Document: \(error.localizedDescription)")
            } else {
                print("Document added wift ID: \(ref!.documentID)")
                cdb.lastid = ref!.documentID
                let documentReference =
                            db.collection("users").document(ref!.documentID)
                        documentReference.getDocument { document, error in
                                        
                          guard let document = document,
                                document.exists,
                                var user = try? document.data(as: user.self)
                          else {
                                    return
                          }
                        user.id = ref!.documentID
                          do {
                             try documentReference.setData(from: user)
                          } catch {
                             print("IV55",error)
                          }
                                        
                        }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("IV36",SignInViewController.user_email)
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
