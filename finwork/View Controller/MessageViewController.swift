//
//  MessageViewController.swift
//  finwork
//
//  Created by Evan on 2021/8/9.
//

import UIKit

class MessageViewController: UIViewController {

    
    let colorgg = UIColor(red: 0.93, green: 0.46, blue: 0.37, alpha: 1.00)
    
    
    @IBOutlet var group_message_btn: UIButton!
    @IBOutlet var system_message_btn: UIButton!
    
    @IBOutlet var group_btn: UIView!
    
    @IBOutlet var system_btn: UIView!
    
    
    @IBAction func system_message_btn(_ sender: Any) {
        onclick_system_message_btn()
        def_group_message_btn()
        
    }
    @IBAction func group_message_btn(_ sender: Any) {
        onclick_group_message_btn()
        def_system_message_btn()
    }
    
    
    func onclick_group_message_btn() {
        system_btn.isHidden = true
        
        let group_message_btnlineView = UIView(frame: CGRect(x: group_message_btn.bounds.minX , y: group_message_btn.bounds.maxY - 3 , width: group_message_btn.frame.size.width, height: 3)) //遮罩匡線下
        group_message_btnlineView.backgroundColor = colorgg
        self.group_message_btn.addSubview(group_message_btnlineView)
    }
    
    
    func def_group_message_btn() {
        system_btn.isHidden = false
        
        let group_message_btnlineView = UIView(frame: CGRect(x: group_message_btn.bounds.minX , y: group_message_btn.bounds.maxY - 3 , width: group_message_btn.frame.size.width, height: 3)) //遮罩匡線下
        group_message_btnlineView.backgroundColor = UIColor.white
        self.group_message_btn.addSubview(group_message_btnlineView)
    }
    
    
    func onclick_system_message_btn() {
        group_btn.isHidden = true
        let system_message_btnlineView = UIView(frame: CGRect(x: system_message_btn.bounds.minX , y: system_message_btn.bounds.maxY - 3, width: system_message_btn.frame.size.width, height: 3)) //遮罩匡線下
        system_message_btnlineView.backgroundColor = colorgg
        self.system_message_btn.addSubview(system_message_btnlineView)
    }
    
    func def_system_message_btn() {
        group_btn.isHidden = false
        let system_message_btnlineView = UIView(frame: CGRect(x: system_message_btn.bounds.minX , y: system_message_btn.bounds.maxY - 3, width: system_message_btn.frame.size.width, height: 3)) //遮罩匡線下
        system_message_btnlineView.backgroundColor = UIColor.white
        self.system_message_btn.addSubview(system_message_btnlineView)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onclick_system_message_btn()
        def_group_message_btn()
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
