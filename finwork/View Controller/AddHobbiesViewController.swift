//
//  AddHobbiesViewController.swift
//  finwork
//
//  Created by Evan Lu on 2022/2/13.
//

import UIKit

class AddHobbiesViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    let identifier = "HobbieCollectionViewCell"
    
    static var user_hobbies: [String] = [""]
    
    @IBOutlet weak var hobbies_collection: UICollectionView!
    
    @IBAction func skip_btn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "adduser4")
           vc.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        hobbies_collection.allowsMultipleSelection = true
        let nib = UINib(nibName: "HobbieCollectionViewCell", bundle: nil)
        hobbies_collection.register(nib, forCellWithReuseIdentifier: identifier)
        hobbies_collection.delegate = self
        hobbies_collection.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GetHobbies.hobbiesItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? HobbieCollectionViewCell
        let hobbiesItems: get_hobbies = GetHobbies.hobbiesItems [indexPath.row]
        cell?.hobbiesconfigure(withViewModel: hobbiesItems)
        cell?.layer.cornerRadius = 20
        cell?.layer.borderColor = UIColor.brown.cgColor
        cell?.layer.borderWidth = 3
        return cell!
        }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat =  170
          let collectionViewSize = hobbies_collection.frame.size.width - padding
          return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? HobbieCollectionViewCell {
            cell.contentView.backgroundColor = .orange
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? HobbieCollectionViewCell {
            cell.contentView.backgroundColor = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         if let cell = collectionView.cellForItem(at: indexPath) as? HobbieCollectionViewCell {
          
        // cell.selectmask.backgroundColor = UIColor.white
                cell.layer.borderColor = UIColor.yellow.cgColor
                //cell.selectmask.backgroundColor = .white
                
                let hobbiesItems: get_hobbies = GetHobbies.hobbiesItems [indexPath.row]
                cell.selectview(withViewModel: hobbiesItems, hobbieslist: HobbieCollectionViewCell.hobbieslist)
                   
                print("EUV179",EditUserTableViewController.hobbies)
            }
        return
        

        }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HobbieCollectionViewCell  {
                
                let hobbiesItems: get_hobbies = GetHobbies.hobbiesItems [indexPath.row]
                        cell.deselectview(withViewModel: hobbiesItems, hobbieslist: HobbieCollectionViewCell.hobbieslist)
                        cell.layer.borderColor = UIColor.brown.cgColor
                        print("HC44",HobbieCollectionViewCell.hobbieslist)
                return
            }
        
        print("EUV215",EditUserTableViewController.hobbies)
        
        
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
