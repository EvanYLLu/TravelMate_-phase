//
//  MessageViewCell.swift
//  finwork
//
//  Created by Evan on 2021/8/9.
//

import UIKit

class MessageViewCell: UITableViewCell {

    
    @IBOutlet var message_view: UIView!
    
    @IBOutlet var message_text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
