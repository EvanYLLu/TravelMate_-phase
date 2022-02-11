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
    
    @IBOutlet weak var tableViewItem: UITableView!
    
    @IBAction func btn(_ sender: Any) {
       
        print("arkk",AddTraveViewModels.myItems.count)
        tableViewItem.reloadData()
    }
    
    var viewModel: AddTraveViewModels?
    let identifier = "AddTraveItemCellIdentifier"
    
    var db:Firestore!
    var travelRef:DocumentReference!
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        return cell!

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "joinPageView")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
