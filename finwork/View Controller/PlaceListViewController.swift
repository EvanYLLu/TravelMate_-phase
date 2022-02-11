//
//  PlaceListViewController.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/18.
//

import UIKit

class PlaceListViewController: UIViewController {

    
    @IBOutlet weak var tableViewItem: UITableView!
    
    
    var viewModel: AddPlaceViewModels?
    let identifier = "AddPlaceItemCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "AddPlaceItemTableViewCell", bundle: nil)
        tableViewItem.register(nib, forCellReuseIdentifier: identifier)
        // Do any additional setup after loading the view.
        viewModel = AddPlaceViewModels()
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

extension PlaceListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.item.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? AddPlaceItemTableViewCell
        let itemViewModel  = viewModel?.item[indexPath.row]
        
        cell?.configure(withViewModel: itemViewModel!)
        
        return cell!
    }
}
