//
//  MachAIRecommendViewController.swift
//  finwork
//
//  Created by Evan on 2021/8/7.
//

import UIKit

class MachAIRecommendViewController: UIViewController {
    
    
    
    

    @IBOutlet var userPhoto: UIImageView!
    
    
    
    @IBOutlet var userCardView: CardView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //userPhoto.frame.size.width = 322
        //userPhoto.frame.size.height = 620
        let photo_gradient = CAGradientLayer()
        photo_gradient.frame = CGRect(x: userCardView.bounds.minX, y: userCardView.bounds.minY, width: userCardView.frame.size.width, height: userCardView.frame.size.height)
        photo_gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        photo_gradient.locations = [0.6,0.75]
        photo_gradient.cornerRadius = 10
        
        self.userPhoto.layer.addSublayer(photo_gradient)
        
        
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
