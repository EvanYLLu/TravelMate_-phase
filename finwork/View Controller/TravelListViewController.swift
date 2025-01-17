//
//  TravelListViewController.swift
//  finwork
//
//  Created by admin on 2021/11/21.
//

import UIKit
import Firebase
import FirebaseFirestore




class TravelListViewController: UIViewController {
    
    var refreshControl:UIRefreshControl!
    
    
    
    @IBOutlet weak var tableViewItem: UITableView!
    
 
    
    
    
    
   
    
    var viewModel: AddTraveViewModels?
    let identifier = "AddTraveItemCellIdentifier"
    
    var travel = [recure]()
    var db:Firestore!
    var travelRef:DocumentReference!
    

    @objc func reload() {
        tableViewItem.reloadData()
        refreshControl.endRefreshing()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        tableViewItem.addSubview(refreshControl)
        
        
        
        refreshControl.addTarget(self, action: #selector(reload), for: UIControl.Event.valueChanged)
        print("+++++where am i+++++++")
        
        
        /**
        travelRef.getDocument { (docSnapshot error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else {return}
            let mydata
            if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
          print("\(document.documentID) => \(document.data())")
                    }
                }

        }
         
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
        }
         */
        let nib = UINib(nibName: "TravelListItemTableViewCell", bundle: nil)
        tableViewItem.register(nib, forCellReuseIdentifier: identifier)
        // Do any additional setup after loading the view.
        
        viewModel = AddTraveViewModels()
        print("TL55",AddTraveViewModels.myItems.count)
        tableViewItem.reloadData()
    }
    
    /*
    override func viewDidAppear(_ animated: Bool) {
        <#code#>
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - TableView
extension TravelListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (AddTraveViewModels.myItems.count)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("s82")
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TravelListItemTableViewCell
        //let itemViewModel  = viewModel?.item[indexPath.row]b
        let itemViewModel : recure = AddTraveViewModels.myItems[indexPath.row]
        
        //let itemViewModel : recure = recure(id: "test",imagetext: "test",title: "test",start_time: "test",finish_time: "test",place: "test",people_num: "test",detail_localtion: "test",meeting_place: "test",cost: "test", tag: "test",detail_content: "test")
        //print("88:", )
        cell?.configure(withViewModel: itemViewModel)
        cell?.tagCount(withViewModel: itemViewModel)
        print ("####################################")
        print("show up")
        self.travel = AddTraveViewModels.myItems
        print("S120",self.travel)
        
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
