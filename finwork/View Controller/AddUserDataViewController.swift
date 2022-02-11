//
//  AddUserDataViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/1/18.
//

import UIKit
import FirebaseFirestore

class AddUserDataViewController: UIViewController {

    @IBOutlet weak var insert_name: UITextField!
    
    
    
    @IBOutlet weak var insert_nickname: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var habitat: UITextField!
   
    let habitatPick = UIPickerView()
    var genderType: String = ""

    let township = ["雲林縣","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣","苗栗縣","彰化縣","南投縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣","金門縣","連江縣","臺北市"]
    
    
    
    @IBAction func didChangeSegmentIndex(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex  == 0 {
            genderType = "male"
            
        }else if sender.selectedSegmentIndex == 1 {
            genderType = "female"
            
        }
    }
    @IBAction func send(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "adduser2")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
        /**
        let user_name: String = insert_name.text!
        let user_nikename: String = insert_nickname.text!
        let user_gender: String = genderType
        let user_birthday: Date = birthday.date
        let user_habitat: String = habitat.text!
        
        let userItem = user(id: "", user_imagetext: "", user_name: user_name, user_id: "", user_nikename: user_nikename, user_gender: user_gender, user_birthday: user_birthday, user_habitat: user_habitat, user_license: "", user_hobbies: "", follower: "", introduce_content: "", voyeur: "")
        
        var ref:DocumentReference? = nil
        ref = cdb.db.collection("user").addDocument(data: userItem.dictionary) {
            error in
            
            if let error = error {
                print("error of adding Document: \(error.localizedDescription)")
            } else {
                print("Document added wift ID: \(ref!.documentID)")
                cdb.lastid = ref!.documentID
                let documentReference =
                            db.collection("user").document(ref!.documentID)
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
                             print(error)
                          }
                                        
                        }
            }
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        habitatPick.delegate = self
        habitatPick.dataSource = self
        habitat.inputView = habitatPick
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
extension AddUserDataViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return township.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return township[row]
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        habitat.text = township[row]
        habitat.resignFirstResponder()
    }
}
