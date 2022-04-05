//
//  FindPartnerViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/1/30.
//

import UIKit

class FindPartnerViewController: UIViewController {
    
    
    var viewModel: AddTraveViewModels?
    let identifier = "AddTraveItemCellIdentifier"
    var travel = [recure]()
    // MARK: - ButtonAction
    @IBOutlet weak var add_btn: UIButton!
    
    @IBAction func add_btm(_ sender: Any) {
        print("Hi")
    }
    // MARK: - TableView
    
    @IBOutlet weak var tableViewItem: UITableView!
    
    
    // MARK: - Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewItem.delegate = self
        tableViewItem.dataSource = self
        add_btn.setTitle("", for: .normal)
        //tableViewItem.addSubview(add_btn)
        
        let nib = UINib(nibName: "TravelListItemTableViewCell", bundle: nil)
        tableViewItem.register(nib, forCellReuseIdentifier: identifier)
        // Do any additional setup after loading the view.
        
        viewModel = AddTraveViewModels()
        print("FP52",AddTraveViewModels.myItems.count)
        tableViewItem.reloadData()
        
    }
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

extension FindPartnerViewController: UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return (AddTraveViewModels.myItems.count)
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                print("FP30")
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TravelListItemTableViewCell
                //let itemViewModel  = viewModel?.item[indexPath.row]b
                let itemViewModel : recure = AddTraveViewModels.myItems[indexPath.row]
                
                //let itemViewModel : recure = recure(id: "test",imagetext: "test",title: "test",start_time: "test",finish_time: "test",place: "test",people_num: "test",detail_localtion: "test",meeting_place: "test",cost: "test", tag: "test",detail_content: "test")
                print("FP36:")
                cell?.configure(withViewModel: itemViewModel)
                cell?.tagCount(withViewModel: itemViewModel)
                self.travel = AddTraveViewModels.myItems
                //print ("####################################")
                //print("show up")
                
                
                
                return cell!
            }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "joinPage", sender: self)
            
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? JoinPageViewController {
                destination.travelItem = travel[(tableViewItem.indexPathForSelectedRow?.row)!]
                print("135",travel.count)
                
            }
        }
    
}
