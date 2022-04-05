//
//  UserFileViewController.swift
//  finwork
//
//  Created by Evan on 2021/8/8.
//

import UIKit
import FirebaseStorage

class UserFileViewController: UIViewController {

    let screenSize:CGRect = UIScreen.main.bounds
    //頭像
    @IBOutlet weak var porfile_image: UIImageView!
    //徽章
    @IBOutlet weak var glory: UICollectionView!
    
    @IBOutlet weak var user_nikename: UILabel!
    //性別
    @IBOutlet weak var user_gender: UIButton!
    //編輯
    @IBAction func edit_btn(_ sender: Any) {
    }
    //自介
    @IBOutlet weak var user_introduction: UITextView!
    //粉絲人數
    @IBOutlet weak var fans_num: UILabel!
    //追蹤數
    @IBOutlet weak var following: UILabel!
    //生日
    @IBOutlet weak var user_birthday: UILabel!
    //居住地
    @IBOutlet weak var user_habitat: UILabel!
    //表單區塊
    @IBOutlet weak var tableview_block: UIView!
    //表單頭
    @IBOutlet weak var tableview_leading: NSLayoutConstraint!
    //表單尾
    @IBOutlet weak var tableview_trailing: NSLayoutConstraint!
    //動態
    @IBOutlet weak var story_view: UIView!
    
    
    @IBAction func story_btn(_ sender: Any) {
        
        arrange_view.isHidden = true
        clockin_view.isHidden = true
        story_view.isHidden = false
        
        
        print("story_btn")
        
    }
    
    //開團
    @IBOutlet weak var arrange_view: UIView!
   
    
    @IBAction func arrange_btn(_ sender: Any) {
        
        story_view.isHidden = true
        clockin_view.isHidden = true
        arrange_view.isHidden = false
        
        print("arrange_btn")
        
    }
    //打卡
    @IBOutlet weak var clockin_view: UIView!
    
    
    @IBAction func clockin_btn(_ sender: Any) {
        story_view.isHidden = true
        arrange_view.isHidden = true
        clockin_view.isHidden = false
        
        print("clockin_btn")
    }
    
    
    @IBAction func edit(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditUser")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        porfile_image.layer.cornerRadius = porfile_image.frame.size.height/2
        porfile_image.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("UF98",AddUserViewModels.user_birthday)
        self.porfile_image.sd_setImage(with: AddUserViewModels.user_imagetext!)
        self.user_nikename.text = AddUserViewModels.user_nikename
        self.user_introduction.text = AddUserViewModels.introduce_content
        if (AddUserViewModels.user_gender == "男") {
            self.user_gender.setImage(UIImage(named: "男生"), for: .normal)
        } else if (AddUserViewModels.user_gender == "女") {
            self.user_gender.setImage(UIImage(named: "愛心後"), for: .normal)
                
        }
        self.following.text = "\(AddUserViewModels.follower.count) 位粉絲"
        self.fans_num.text = "\(AddUserViewModels.voyeur.count) 位追蹤中"
        self.user_birthday.text = AddUserViewModels.user_birthday
        self.user_habitat.text = AddUserViewModels.user_habitat
        story_view.isHidden = false
        clockin_view.isHidden = true
        arrange_view.isHidden = true
        
        
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
