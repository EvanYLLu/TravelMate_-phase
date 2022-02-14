//
//  IntroduceViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/2/13.
//

import UIKit

class IntroduceViewController: UIViewController {

     
    
    @IBOutlet weak var start_btn: UIButton!
    
    
    @IBAction func start(_ sender: Any) {
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "index")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func createUser() {
        
        let userItem = user(id: "", user_imagetext: "", user_name: AddUserDataViewController.basicData.user_name, user_id: "", user_nikename: AddUserDataViewController.basicData.user_nikename, user_gender: AddUserDataViewController.basicData.user_gender, user_birthday: AddUserDataViewController.basicData.user_birthday!, user_habitat: AddUserDataViewController.basicData.user_habitat, user_license: "", user_hobbies: "", follower: "", introduce_content: "", voyeur: "")
        
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
