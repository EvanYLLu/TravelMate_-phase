//
//  TagCollectionViewCell.swift
//  finwork
//
//  Created by Evan Lu on 2022/1/29.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tag_btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(withViewModel viewModel: String) {
        
        tag_btn.titleLabel?.font = tag_btn.titleLabel?.font.withSize(10)
        let tag = TravelListItemTableViewCell.tagItem
        print("TC23",tag)
        //let tagList: [String] = (tag.components(separatedBy: "#"))
        var item: String = ""
        for tagItem2 in tag {
            print ("TC26",tagItem2)
            
            //item = tagItem2
            //tag_btn.setTitle( item , for: .normal)
            tag_btn.titleLabel?.text = viewModel
            print("TC32",tagItem2)
        }
        
        
                            


    }
    
    

}
