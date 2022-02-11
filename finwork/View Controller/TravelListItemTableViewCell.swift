//
//  TravelListItemTableViewCell.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/19.
//

import UIKit
import FirebaseStorage
import FirebaseUI

class TravelListItemTableViewCell: UITableViewCell, UICollectionViewDataSource,UICollectionViewDelegate {

   static var tagItem: [String] = []
    //static var tagViewModel: String = ""
    let identifier = "TagCollectionViewCell"
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var titletext: UILabel!
    @IBOutlet weak var start_timetext: UILabel!
    @IBOutlet weak var travelimage: UIImageView!
    @IBOutlet weak var placetext: UILabel!
    @IBOutlet weak var menber: UILabel!
    @IBOutlet weak var tag_collection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
                tag_collection.register(nib, forCellWithReuseIdentifier: identifier)
        tag_collection.delegate = self
        tag_collection.dataSource = self
        
        
        
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        // Configure the view for the selected state
    }
    
    func configure(withViewModel viewModel: recure) -> (Void) {
        
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY/MM/dd"

        
        titletext.text = viewModel.title
        start_timetext.text = dateFormatter.string(from: viewModel.start_time!) 
        placetext.text = viewModel.place!
        menber.text = viewModel.people_num! + "人"
        
        //let imgdata = NSData(contentsOfMappedFile: ViewModel.imagetext!) //ViewModel.imagetext!
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let ref = storageRef.child(viewModel.imagetext!)
        travelimage.sd_setImage(with: ref)
        
        
        //let imgdata = UIImage(data: viewModel.imagetext)
        //travelimage.image = imgdata
        
        
        
        
        
    }
    
    
    func tagCount(withViewModel viewModel: recure) -> [String] {
        if viewModel.tag == nil{
            print("no tag")
        }else{
            
            let tag = viewModel.tag!
                                           let tagList: [String] = (tag.components(separatedBy: "#"))
                               
            TravelListItemTableViewCell.tagItem = tagList.filter{$0 != ""}
                               print("TLC84",TravelListItemTableViewCell.tagItem)
                   
        }
        return TravelListItemTableViewCell.tagItem
                    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (TravelListItemTableViewCell.tagItem.count)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? TagCollectionViewCell
        
        let tagItemViewModel : String =
        TravelListItemTableViewCell.tagItem [indexPath.row]
        print("TLC98",tagItemViewModel)
        cell?.configure(withViewModel: tagItemViewModel)
        
        //let tagViewModel =
        //tagItemViewModel
        //print("TLC103",tagViewModel)
        return cell!
    }
    
}

