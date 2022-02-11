//
//  UserFileViewController.swift
//  finwork
//
//  Created by Evan on 2021/8/8.
//

import UIKit

class UserFileViewController: UIViewController {

    let colorgg = UIColor(red: 0.93, green: 0.46, blue: 0.37, alpha: 1.00)
    
    @IBOutlet var clock_btn: UIButton!
    @IBOutlet var party_btn: UIButton!
    @IBOutlet var story_btn: UIButton!
    @IBOutlet var story: UIView!
    
    @IBOutlet var partyList: UIView!
    
    
    @IBAction func clock_btn(_ sender: Any) {
        
    }
    
    @IBAction func party_btn(_ sender: Any) {
        def_story_btn()
        onclick_party_btn()
        partyList.isHidden = false
    }
    
    @IBAction func story_btn(_ sender: Any) {
        story.isHidden = false
        def_party_btn()
        onclick_story_btn()
    }
    
    func onclick_story_btn() {
        partyList.isHidden = true
        
        let story_btnlineView = UIView(frame: CGRect(x: story_btn.bounds.minX , y: story_btn.bounds.maxY - 3 , width: story_btn.frame.size.width, height: 3)) //遮罩匡線下
        story_btnlineView.backgroundColor = colorgg
        self.story_btn.addSubview(story_btnlineView)
    }
    
    
    func def_story_btn() {
        partyList.isHidden = true
        
        let story_btnlineView = UIView(frame: CGRect(x: story_btn.bounds.minX , y: story_btn.bounds.maxY - 3 , width: story_btn.frame.size.width, height: 3)) //遮罩匡線下
        story_btnlineView.backgroundColor = UIColor.white
        self.story_btn.addSubview(story_btnlineView)
    }
    
    
    func onclick_party_btn() {
        story.isHidden = true
        let party_btnlineView = UIView(frame: CGRect(x: party_btn.bounds.minX , y: party_btn.bounds.maxY - 3, width: party_btn.frame.size.width, height: 3)) //遮罩匡線下
        party_btnlineView.backgroundColor = colorgg
        self.party_btn.addSubview(party_btnlineView)
    }
    
    func def_party_btn() {
        story.isHidden = true
        let party_btnlineView = UIView(frame: CGRect(x: party_btn.bounds.minX , y: party_btn.bounds.maxY - 3, width: party_btn.frame.size.width, height: 3)) //遮罩匡線下
        party_btnlineView.backgroundColor = UIColor.white
        self.party_btn.addSubview(party_btnlineView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onclick_story_btn()
        partyList.isHidden = true
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
