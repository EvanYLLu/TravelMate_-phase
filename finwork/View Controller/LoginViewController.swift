//
//  LoginViewController.swift
//  finwork
//
//  Created by Evan on 2021/7/20.
//
//import FirebaseAuth
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var passwd: UITextField!
    
    func Login_for_10() -> String {
        let email: String = "123@123.com"
        let passwd: String = "123456"

        SignInViewController.user_email = email
        //let error = validateFiled()
     Auth.auth().signIn(withEmail: email, password: passwd) {authResult, error in
         if error != nil{
             //有錯誤時執行
             let alertController = UIAlertController(
                 title: "錯誤",
                 message: "帳號密碼錯誤",
                 preferredStyle: .alert)

             // 建立[取消]按鈕
             let cancelAction = UIAlertAction(
               title: "重試",
                 style: .cancel,
               handler: nil)
             alertController.addAction(cancelAction)

             // 顯示提示框
             self.present(
               alertController,
               animated: true,
               completion: nil)
             
             //self.email.text = ""
             //self.passwd.text = ""
             
         }else{
             //沒錯誤時執行
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let vc = storyboard.instantiateViewController(withIdentifier: "index")
                vc.modalPresentationStyle = .overFullScreen
             self.navigationController?.pushViewController(vc, animated: true)
             GetHobbies.gethobbies()
             
         }//else
         
     }//func
        
        return SignInViewController.user_email
    }
    
    /*
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
    */
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("1233333")
        
        self.email.isHidden = true
        self.passwd.isHidden = true
        
        /*
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           //textField.resignFirstResponder() 兩種寫法皆可
           self.view.endEditing(true)
           return true
        }

        
        passwd.keyboardType = .numberPad
        //passwd.setNumberKeyboardReturn()
        passwd.resignFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        // 註冊監聽鍵盤出現的事件
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        // 註冊監聽鍵盤消失的事件
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        */
        
        email.autocapitalizationType = .none
        email.autocorrectionType = .no
        email.returnKeyType = .continue
        email.placeholder = "帳號"
        email.keyboardType = .emailAddress
        
        
        passwd.autocapitalizationType = .none
        passwd.autocorrectionType = .no
        passwd.returnKeyType = .continue
        passwd.placeholder = "密碼"
        passwd.isSecureTextEntry = true
        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    func confirm() {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "錯誤",
            message: "請輸入帳號密碼",
            preferredStyle: .alert)

        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
          title: "好",
            style: .cancel,
          handler: nil)
        alertController.addAction(cancelAction)

        // 顯示提示框
        self.present(
          alertController,
          animated: true,
          completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
                        
        validateFiled()
    }
    
    func validateFiled() {
        
        if email.text?.isEmpty == true {
            print("請輸入信箱")
            confirm()
           
            
            return
        }
        if passwd.text?.isEmpty == true {
            print("請輸入密碼")
            return
        }
        Login()
        
    }
    
    
    @IBAction func respect_10_authoritah(_ sender: Any) {
        Login_for_10()
    }
    
    func Login() {
        let email_value: String? = email.text
        let passwd_value: String? = passwd.text

        //let error = validateFiled()
     Auth.auth().signIn(withEmail: email_value!, password: passwd_value!) {authResult, error in
         if error != nil{
             //有錯誤時執行
             let alertController = UIAlertController(
                 title: "錯誤",
                 message: "帳號密碼錯誤",
                 preferredStyle: .alert)

             // 建立[取消]按鈕
             let cancelAction = UIAlertAction(
               title: "重試",
                 style: .cancel,
               handler: nil)
             alertController.addAction(cancelAction)

             // 顯示提示框
             self.present(
               alertController,
               animated: true,
               completion: nil)
             
             self.email.text = ""
             self.passwd.text = ""
             
         }else{
             //沒錯誤時執行
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let vc = storyboard.instantiateViewController(withIdentifier: "index")
                vc.modalPresentationStyle = .overFullScreen
             self.navigationController?.pushViewController(vc, animated: true)
             GetHobbies.gethobbies()
             
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
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    }


