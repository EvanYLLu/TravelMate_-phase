//
//  HobbieCollectionViewCell.swift
//  finwork
//
//  Created by Evan Lu on 2022/2/16.
//

import UIKit
import FirebaseStorage

class HobbieCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var selectmask: UIView!
    
    static var hobbieslist: [String] = []
    static var systemhobbieslist: [String] = []
    var samehobbies: [String] = []
    static var hobbies_dictionary: [String: Bool] = [:]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //imageview.layer.borderWidth = 3
        //imageview.layer.borderColor = UIColor.brown.cgColor
        imageview.layer.cornerRadius = 20
       // imageview.layer.masksToBounds = true
        selectmask.layer.cornerRadius = 20
        //selectmask.backgroundColor = .black
        //imageview.addSubview(selectmask)
    }
    
    func check_user_hobbies(user_hobbies: [String], system_hobbies: [String]) -> [String] {

        
        print("check1",user_hobbies)
        print("check2",system_hobbies)
        var list: [String] = []
        var hobbies_set: Set<String>? = nil
        for item in user_hobbies {
            hobbies_set?.insert(item)
        }
        for item in system_hobbies {
            if ((hobbies_set?.contains(item)) != nil) {
                list.append(item)
            }
        }
        print("check_user_hobbies",list)
        samehobbies = list
        return samehobbies
    }

    func hobbiesconfigure(withViewModel viewModel: get_hobbies) -> (Void) {
        
        if AddUserViewModels.user_hobbies.contains(viewModel.type_name) {
            
            self.selectmask.backgroundColor =  UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5)
            
            label.text = viewModel.type_name
                    HobbieCollectionViewCell.systemhobbieslist.insert(viewModel.type_name, at: 0)
                    let storage = Storage.storage()
                    let storageRef = storage.reference()
                    
                    let ref = storageRef.child(viewModel.type_image)
                    imageview.sd_setImage(with: ref)
            print("HCIF"
            )
        } else {
            
            self.selectmask.backgroundColor =  UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.0)
            label.text = viewModel.type_name
                    HobbieCollectionViewCell.systemhobbieslist.insert(viewModel.type_name, at: 0)
                    let storage = Storage.storage()
                    let storageRef = storage.reference()
                    
                    let ref = storageRef.child(viewModel.type_image)
                    imageview.sd_setImage(with: ref)
            print("HCELSE"
            )
        }
        
        
        
        var hobbies: [String] = []
        hobbies.append(viewModel.type_name)
        HobbieCollectionViewCell.hobbies_dictionary = [viewModel.type_name : false]
        //let system_hobbies = Array(HobbieCollectionViewCell.hobbies_dictionary.keys)
        //check_user_hobbies(user_hobbies: AddUserViewModels.user_hobbies, system_hobbies: system_hobbies)
        print("HC34",AddUserViewModels.user_hobbies
        )
        
    }
    
    func selectview(withViewModel viewModel: get_hobbies, hobbieslist: [String]) ->[String]{
        
        
            
            self.selectmask.backgroundColor =  UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5)
                    
                    //print("hobbieslist",HobbieCollectionViewCell.hobbieslist)
                    var hobbiesitem: String = viewModel.type_name as String
                    //print("hobbiesitem",hobbiesitem)
                    //self.hobbieslist.append(hobbiesitem)
                    HobbieCollectionViewCell.hobbieslist.insert(hobbiesitem, at: 0)
        
        
        
        
        print("HC42",HobbieCollectionViewCell.hobbieslist)
        return HobbieCollectionViewCell.hobbieslist
        
    }
    
    func deselectview(withViewModel viewModel: get_hobbies, hobbieslist: [String]) ->[String]{
        
        
            self.selectmask.backgroundColor =  UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.0)

                    //print("hobbieslist",HobbieCollectionViewCell.hobbieslist)
                    var hobbiesitem: String = viewModel.type_name as String
                    //print("hobbiesitem",hobbiesitem)
                    HobbieCollectionViewCell.hobbieslist.removeAll(where: {$0.contains(hobbiesitem)})
        
        print("HC47",HobbieCollectionViewCell.hobbieslist)
        return HobbieCollectionViewCell.hobbieslist
    }
}
