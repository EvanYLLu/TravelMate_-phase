//
//  AddPlaceItemTableViewCell.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/17.
//

import UIKit

class AddPlaceItemTableViewCell: UITableViewCell {

    @IBOutlet weak var textIndex: UILabel!
    @IBOutlet weak var textAddPlaceItem: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withViewModel ViewModel: AddPlaceItemPresentable) -> (Void) {
        
        textIndex.text = ViewModel.id!
        textAddPlaceItem.text = ViewModel.name!
        
    }

}
