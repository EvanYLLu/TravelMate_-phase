//
//  TraveListCellTableViewController.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/8.
//

import UIKit
import Firebase
import FirebaseFirestore

struct Travel:  Identifiable {
    var id: ObjectIdentifier
    
        //@DocumentID var id: String?
        var titel: String
        var start_time: Date
        var place: String
        var time_sptamp:Date
        
    }

class TraveListCellTableViewController: UITableViewController {

    //var db:Firestore!
    //var travelArray = [travel]()
    //var travelArray : [travel] = [] {
            //didSet {
                //tableView.reloadData()
            //}
      //  }
    
    var travels = [Any?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
            
        
        //db = Firestore.firestore()
        loadData()
        //checkForUpdates()
        //tableView.dataSource = self
        //tableView.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    //var db:DatabaseReference!
    /*
    func gg() {
        db.collection("travel").addSnapshotListener{(querySnapshot, error) in
            guard let document = querySnapshot?.documents else {
                print("nothing")
                return
            }
            self.travelArray = document.compactMap{_ in ()}
        }
    }
                              
    func readData(){
            db.collection("travel").getDocuments { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    for document in querySnapshot.documents {
                        print(document.data())
                    }
                    let value1 = querySnapshot.value as? NSDictionary
                    let titel = value?["titel"] as? String ?? ""
                    print(titel)
                }
            }
        }
    
     */
    func loadData() {
        //print(cdb.lastid)
        cdb.db.collection("travel").getDocuments() {
            querySnapshot, error in
            if let error = error {
                print("error of loading Document: \(error.localizedDescription)")
                print("it don't work")
            } else {
                
                self.travels = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()}
                
                //cdb.travelArray = querySnapshot!.documents.flatMap{travel(dictionary: $0.data())}
                
                cdb.travelArray = querySnapshot!.documents.compactMap{travel(dictionary: $0.data())}
   
                print("travels")
                print(self.travels)
                print(cdb.lastid)
                print("travelArray")
              
                
                print(cdb.travelArray.count)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print(cdb.travelArray.count)
    }
    
    func checkForUpdates() {
        cdb.db.collection("travel").whereField("time_sptamp", isGreaterThan: Date()).addSnapshotListener{QuerySnapshot ,error in
            guard let spnapshot = QuerySnapshot else {return}
            spnapshot.documentChanges.forEach {
                diff in
                print(cdb.travelArray.count)
                print("11234")
                if diff.type == .added {
                    cdb.travelArray.append(travel(dictionary: diff.document.data())!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        print("work")
                    }
                    
                }
            }
        }
        print("######################################")
        print(cdb.travelArray.count)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cdb.travelArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let travel = cdb.travelArray[indexPath.row]
        cell.textLabel?.text="\(travel.title): \(travel.start_time): \(travel.place)"
        cell.detailTextLabel?.text="\(travel.time_sptamp)"
        // Configure the cell...
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
