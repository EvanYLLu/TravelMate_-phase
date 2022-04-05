//
//  JoinListViewController.swift
//  finwork
//
//  Created by admin on 2021/12/1.
//

import UIKit
import FirebaseFirestore
import Photos
import FirebaseStorage

var imgurl: URL = URL(string: "http://nshipster.com/")!//預設url


class JoinListTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    
    
    var place_name: String?
    //TextField
    //
    var keyboardHeight: CGFloat = 0 // keep 住鍵盤的高度，在每次 ChangeFrame 的時侯記錄
    
    
    @IBOutlet weak var titel_field: UITextView!
    
    
    @IBOutlet weak var strat_time_datepicker: UIDatePicker!
    @IBOutlet weak var finish_time_datepicker: UIDatePicker!
    
    
    @IBOutlet weak var select_location: UIButton!
    
    @IBOutlet weak var people_num_field: UITextField!
    
    @IBOutlet weak var location_field: UITextField!
    
    @IBOutlet weak var meeting_place_field: UITextField!
    
    @IBOutlet weak var cost_field: UITextField!
    
    @IBOutlet weak var tag_field: UITextField!
    @IBOutlet weak var detail_content_field: UITextView!
    @IBOutlet weak var image_picker: UIImageView!
    
    //
    
    
    
    
    
    
    
    @IBAction func send_location_btn(_ sender: Any) {
    }
    
    
    @IBAction func pickImage(_ sender: Any) {
        print("JL47")
        chackPermissions()
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
                     self.present(imagePicker, animated:  true, completion:  nil)
        print("rrrr")
        
    }
    
    /**
     
     
     
             
     */
    func chackPermissions() {
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
                                 PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in
                                     ()
                                 })
                             }

                             if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
                             } else {
                                 PHPhotoLibrary.requestAuthorization(requestAuthroizationHandler)
                             }
    }
    func requestAuthroizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            print("We have access to photos")
        }else{
            print("We need access to photos")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("JL78")
        var urlPath: URL? = nil
            if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                urlPath = url
                let image = info[.originalImage] as? UIImage
                self.image_picker.image = image
                print("JL82++++++++++",url)
                
            }
        picker.dismiss(animated: true, completion: nil)
        imgurl = urlPath!
        
        }
    
    func uploadToCloud(fileURL : URL) {
        let storage = Storage.storage()
        
        let data = Data()
        
        let storageRef = storage.reference()
        
        let localFule = fileURL
        
        let photoRef = storageRef.child(fileURL.path)
        
        let uploadTask = photoRef.putFile(from: localFule, metadata: nil) { (metadata, err) in
            guard let metadata = metadata else {
                print(err?.localizedDescription)
                return
            }
            print("Photo Upload")
            
        }
        
        
    }
    
    @objc func changeName(name: String) {
        print("JL134")

        select_location.setTitle(name, for: .normal)
        }

    
    func reload() {
        self.select_location.reloadInputViews()
    }
    
    @IBAction func preview(_ sender: Any) {
        
        let url: URL = imgurl
        
        uploadToCloud(fileURL: url)
        let imagetext: String = url.path
        
        let title: String = titel_field.text
        let start_time: Date = strat_time_datepicker.date
        let finish_time: Date = finish_time_datepicker.date
        let place: String! = SelectLocationViewController.city_name
        let people_num: String? = people_num_field.text
        let detail_localtion: String? = location_field.text
        let meeting_place: String? = meeting_place_field.text
        let cost: String? = cost_field.text
        let tag: String? = tag_field.text
        let detail_content: String! = detail_content_field.text
        let user_id: String! = AddUserViewModels.id
        
        let newtravel = travel(imagetext: imagetext, title: title, start_time: start_time, finish_time: finish_time, place: place, people_num: people_num!, detail_localtion: detail_localtion!, meeting_place: meeting_place!, cost: cost!, tag: tag!, detail_content: detail_content!, time_sptamp: Date(),user_id: user_id!)
        
        var ref:DocumentReference? = nil
        ref = cdb.db.collection("travel").addDocument(data: newtravel.dictionary) {
            error in
            
            if let error = error {
                print("error of adding Document: \(error.localizedDescription)")
            } else {
                print("Document added wift ID: \(ref!.documentID)")
                cdb.lastid = ref!.documentID
                let documentReference =
                            db.collection("travel").document(ref!.documentID)
                        documentReference.getDocument { document, error in
                                        
                          guard let document = document,
                                document.exists,
                                var recure = try? document.data(as: recure.self)
                          else {
                                    return
                          }
                        recure.id = ref!.documentID
                          do {
                             try documentReference.setData(from: recure)
                          } catch {
                             print(error)
                          }
                                        
                        }
            }
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "index")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //var ref: DatabaseReference!
    
    //這裡不能用
                    /*

    class LayerContainerView: UIView {
        
        
        

        override public class var layerClass: Swift.AnyClass {
            return CAShapeLayer.self
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            guard let bottomLine = self.layer as? CAShapeLayer else { return }
            bottomLine.frame = CGRect(x: location_field.bounds.minX, y: location_field.bounds.maxY - 1, width: location_field.frame.size.width, height: 1.0)
            bottomLine.backgroundColor = UIColor.black.cgColor
        }
    }*/
/*
    func field_bottom_line() {
        //location_field.frame.size.width = 240// 固定欄寬
        
        
        
        let bottomLine = CAShapeLayer()
       
        //bottomLine.backgroundColor = UIColor.black.cgColor
        location_field.borderStyle = UITextField.BorderStyle.none
        self.location_field.layer.addSublayer(bottomLine)
    }*/
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    /// 關閉鍵盤
        ///
        /// - Parameters:
        ///   - touches: _
        ///   - event: _
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cdb.db = Firestore.firestore()
        NotificationCenter.default.addObserver(self, selector: "changeName:", name: NSNotification.Name(rawValue: "refresh"), object: nil)
        select_location.setTitle(SelectLocationViewController.city_name, for: .normal)
        //ref = Database.database().reference()
        //self.ref.child("users").child("123").setValue(["username": "1232"])
        //field_bottom_line()
        // Do any additional setup after loading the view.
        
        
        
        // 鍵盤的生命週期
        // 註冊監聽鍵盤 frame 改變的事件
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        // 註冊監聽鍵盤出現的事件
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        // 註冊監聽鍵盤消失的事件
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
               
               
        
        
    }

    /// 監聽鍵盤 frame 改變事件(鍵盤切換時總會觸發，不管是不是相同 type 的....例如：預設鍵盤 → 數字鍵盤)
        ///
        /// - Parameter notification: _
        @objc func keyboardWillChangeFrame(_ notification: Notification) {
            print("keyboardWillChangeFrame...")
            
            
        
        }
        /// 監聽鍵盤開啟事件(鍵盤切換時總會觸發，不管是不是相同 type 的....例如：預設鍵盤 → 數字鍵盤)
        ///
        /// - Parameter notification: _
        @objc func keyboardWillShow(_ notification: Notification) {
            print("keyboardWillShow...")
            
            
        }
        
        /// 監聽鍵盤關閉事件(鍵盤關掉時才會觸發)
        ///
        /// - Parameter notification: _
        @objc func keyboardWillHide(_ notification: Notification) {
            print("keyboardWillHide...")
           
        }
            
        
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
