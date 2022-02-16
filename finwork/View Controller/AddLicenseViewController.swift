//
//  AddLicenseViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/2/13.
//

import UIKit

class AddLicenseViewController: UIViewController {

    static var license: String = "none"
    
    @IBOutlet weak var license_table: UITableView!
    
    @IBAction func skip_btn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "adduser3")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
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
