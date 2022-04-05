//
//  EditUserViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/3/9.
//

import UIKit
import Photos
import FirebaseFirestore
import FirebaseStorage


class EditUserTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    let identifier = "HobbieCollectionViewCell"
    
    static var hobbies: [String] = []
    let hobbies_dictionary: [String: Bool] = [:]

    
    @IBOutlet weak var user_image: UIImageView!
    @IBOutlet weak var change_image_btn: UIButton!
    @IBOutlet weak var user_name: UITextField!
    @IBOutlet weak var user_nikename: UITextField!
    @IBOutlet weak var habitat: UITextField!
    @IBOutlet weak var hobbies_collection: UICollectionView!
    @IBOutlet weak var user_birthday: UIDatePicker!
    
    @IBOutlet weak var user_introduction: UITextView!
    let habitatPick = UIPickerView()
    let township = ["雲林縣","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣","苗栗縣","彰化縣","南投縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣","金門縣","連江縣","臺北市"]
    
    @IBAction func change_image(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
                     self.present(imagePicker, animated:  true, completion:  nil)
    }
    
    @IBAction func update_usaedata(_ sender: Any) {
        
        let url: URL = imgurl
        
        uploadToCloud(fileURL: url)
        update(url: url)
        
        
    }
    
    func update(url: URL){
      print("HC53",HobbieCollectionViewCell.hobbieslist)
        let db = Firestore.firestore()
        db.collection("users").whereField("id", isEqualTo: AddUserViewModels.id).getDocuments { (querySnapshot, error) in
           if let querySnapshot = querySnapshot {
              let document = querySnapshot.documents.first
               document?.reference.updateData(["user_name": self.user_name.text!,"user_nikename": self.user_nikename.text!,"user_imagetext": url.path,"user_habitat": self.habitat.text!,"introduce_content": self.user_introduction.text!,"user_hobbies": HobbieCollectionViewCell.hobbieslist], completion: { (error) in
              })
           }
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        var urlPath: URL? = nil
            if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                urlPath = url
                let image = info[.originalImage] as? UIImage
                self.user_image.image = image
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
    
    func check_user_hobbies(user_hobbies: [String], system_hobbies: [String]) {

        var list: [String] = []
        var hobbies_set: Set<String>? = nil
        for item in user_hobbies {
            hobbies_set!.insert(item)
        }
        for item in system_hobbies {
            if hobbies_set!.contains(item) {
                list.append(item)
            }
        }
        print("check_user_hobbies",list)
        return
    }
    
    var currentTextField: UITextField?
        /* 暫存 View 的範圍 */
        var rect: CGRect?
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            /* 開始輸入時，將輸入框實體儲存 */
            currentTextField = textField
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        hobbies_collection.allowsMultipleSelection = true
        EditUserTableViewController.hobbies = hobbies_collection.indexPathsForSelectedItems as! [String]
        
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY年MM月dd日"
        user_birthday.date = dateFormatter.date(from: AddUserViewModels.user_birthday) ?? Date()
        self.user_image.sd_setImage(with: AddUserViewModels.user_imagetext!)
        self.user_nikename.text = AddUserViewModels.user_nikename
        self.user_introduction.text = AddUserViewModels.introduce_content
        self.habitat.text = AddUserViewModels.user_habitat
        self.user_name.text = AddUserViewModels.user_name
        print("EUV121",AddUserViewModels.user_hobbies)
        habitatPick.delegate = self
        habitatPick.dataSource = self
        habitat.inputView = habitatPick
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "HobbieCollectionViewCell", bundle: nil)
        hobbies_collection.register(nib, forCellWithReuseIdentifier: identifier)
        hobbies_collection.delegate = self
        hobbies_collection.dataSource = self
        
        /* 監聽 鍵盤顯示/隱藏 事件 */
               NotificationCenter.default.addObserver(
                   self,
                   selector: #selector(keyboardWillShow),
                   name: UIResponder.keyboardWillShowNotification,
                   object: nil)
               
               NotificationCenter.default.addObserver(
                   self,
                   selector: #selector(keyboardWillHide),
                   name: UIResponder.keyboardWillHideNotification,
                   object: nil)
               
               /* 將 View 原始範圍儲存 */
               rect = view.bounds
        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        user_image.layer.cornerRadius = user_image.frame.size.height/2
        user_image.clipsToBounds = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GetHobbies.hobbiesItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? HobbieCollectionViewCell
        let hobbiesItems: get_hobbies = GetHobbies.hobbiesItems [indexPath.row]
        cell?.hobbiesconfigure(withViewModel: hobbiesItems)
        cell?.layer.cornerRadius = 20
        cell?.layer.borderColor = UIColor.brown.cgColor
        cell?.layer.borderWidth = 3
        //check_user_hobbies(user_hobbies: AddUserViewModels.user_hobbies, system_hobbies: GetHobbies.type_name)
        
        return cell!
        }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat =  170
          let collectionViewSize = hobbies_collection.frame.size.width - padding
          return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? HobbieCollectionViewCell {
            cell.contentView.backgroundColor = .orange
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? HobbieCollectionViewCell {
            cell.contentView.backgroundColor = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         if let cell = collectionView.cellForItem(at: indexPath) as? HobbieCollectionViewCell {
          
        // cell.selectmask.backgroundColor = UIColor.white
                //cell.layer.borderColor = UIColor.yellow.cgColor
               //cell.selectmask.backgroundColor = .white
             let hobbiesItems: get_hobbies = GetHobbies.hobbiesItems [indexPath.row]

             if cell.selectmask.backgroundColor == UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5) {
                 cell.deselectview(withViewModel: hobbiesItems, hobbieslist: HobbieCollectionViewCell.hobbieslist)
             } else {
                 cell.selectview(withViewModel: hobbiesItems, hobbieslist: HobbieCollectionViewCell.hobbieslist)
             }
                
                
                   
                print("EUV179",EditUserTableViewController.hobbies)
            }
        return
        

        }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HobbieCollectionViewCell  {
                
                let hobbiesItems: get_hobbies = GetHobbies.hobbiesItems [indexPath.row]
                        cell.deselectview(withViewModel: hobbiesItems, hobbieslist: HobbieCollectionViewCell.hobbieslist)
                        //cell.layer.borderColor = UIColor.brown.cgColor
                        print("HC44",HobbieCollectionViewCell.hobbieslist)
                return
            }
        
        print("EUV215",EditUserTableViewController.hobbies)
        
        
        }

    
    @objc func keyboardWillShow(note: NSNotification) {
            if currentTextField == nil {
                return
            }
            
            let userInfo = note.userInfo!
            /* 取得鍵盤尺寸 */
            let keyboard = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
            /* 取得焦點輸入框的位置 */
            let origin = (currentTextField?.frame.origin)!
            /* 取得焦點輸入框的高度 */
            let height = (currentTextField?.frame.size.height)!
            /* 計算輸入框最底部Y座標，原Y座標為上方位置，需要加上高度 */
            let targetY = origin.y + height
            /* 計算扣除鍵盤高度後的可視高度 */
            let visibleRectWithoutKeyboard = self.view.bounds.size.height - keyboard.height
            
            /* 如果輸入框Y座標在可視高度外，表示鍵盤已擋住輸入框 */
            if targetY >= visibleRectWithoutKeyboard {
                var rect = self.rect!
                /* 計算上移距離，若想要鍵盤貼齊輸入框底部，可將 + 5 部分移除 */
                rect.origin.y -= (targetY - visibleRectWithoutKeyboard) + 5
                
                UIView.animate(
                    withDuration: duration,
                    animations: { () -> Void in
                        self.view.frame = rect
                    }
                )
            }
        }
         
        @objc func keyboardWillHide(note: NSNotification) {
            /* 鍵盤隱藏時將畫面下移回原樣 */
            let keyboardAnimationDetail = note.userInfo as! [String: AnyObject]
            let duration = TimeInterval(truncating: keyboardAnimationDetail[UIResponder.keyboardAnimationDurationUserInfoKey]! as! NSNumber)
            
            UIView.animate(
                withDuration: duration,
                animations: { () -> Void in
                    self.view.frame = self.view.frame.offsetBy(dx: 0, dy: -self.view.frame.origin.y)
                }
            )
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
extension EditUserTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
