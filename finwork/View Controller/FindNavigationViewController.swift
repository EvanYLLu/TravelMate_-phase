//
//  FindNavigationViewController.swift
//  finwork
//
//  Created by Evan on 2021/7/3.
//

import UIKit

class FindNavigationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet var tableView: UITableView!
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.register(UINib.init(nibName: "UITableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 8
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        
        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return cell
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
