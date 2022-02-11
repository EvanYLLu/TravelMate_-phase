//
//  AIRecommendViewController.swift
//  finwork
//
//  Created by Evan on 2021/8/6.
//

import UIKit

class AIRecommendViewController: UIViewController {
    
    
    @IBOutlet var dialogue1: UIView!
    @IBOutlet var dialogue2: UIView!
    @IBOutlet var dialogue3: UIView!
    @IBOutlet var dialogue4: UIView!
    
    
    @IBOutlet var ans_dialogue1: UIView!
    @IBOutlet var ans_dialogue2: UIView!
    @IBOutlet var ans_dialogue3: UIView!
    @IBOutlet var ans_dialogue4: UIView!
    
    
    @IBOutlet var choos1: UIView!
    @IBOutlet var choos2: UIView!
    @IBOutlet var choos3: UIView!
    @IBOutlet var choos4: UIView!
    
    
    
    @IBAction func ch_1(_ sender: Any) {
        
        ans_dialogue1.isHidden = false
        choos1.isHidden = true
        f_con()
    }
    
    @IBAction func rh_1(_ sender: Any) {
        
        ans_dialogue1.isHidden = false
        choos1.isHidden = true
        //usleep(100000)
        f_con()
        
    }
    
    
    @IBAction func rh_2(_ sender: Any) {
        
        ans_dialogue2.isHidden = false
        choos2.isHidden = true
        //usleep(100000)
        s_co()
        
        
    }
    
    @IBAction func rh_3(_ sender: Any) {
        
        
        ans_dialogue3.isHidden = false
        choos3.isHidden = true
        t_con()
        
    }
    
    
    @IBAction func rh_4(_ sender: Any) {
        
        
        ans_dialogue4.isHidden = false
        choos4.isHidden = true
        
    }
    
    
    
    func f_con()
    {
        
        dialogue2.isHidden = false
        choos2.isHidden = false
        
    }
    
    func s_co() {
        
        dialogue3.isHidden = false
        choos3.isHidden = false
        
    }
    
    func t_con() {
        
        dialogue4.isHidden = false
        choos4.isHidden = false
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        dialogue2.isHidden = true
        dialogue3.isHidden = true
        dialogue4.isHidden = true
        
        ans_dialogue1.isHidden = true
        ans_dialogue2.isHidden = true
        ans_dialogue3.isHidden = true
        ans_dialogue4.isHidden = true
        
        choos2.isHidden = true
        choos3.isHidden = true
        choos4.isHidden = true
        
        
        
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
