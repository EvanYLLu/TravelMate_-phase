//
//  TraveListViewModels.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/19.
//

//import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import SideMenu
import Foundation

//class
//struct let item_object: [AddTraveItemPresentable] = []
/*
protocol AddTraveItemPresentable: Codable {
    var id: String? {get}
    var imagetext: String? {get}
    var title: String? {get}
    var start_time: String? {get}
    var finish_time: String? {get}
    var place: String? {get}
    var people_num: String? {get}
    var detail_localtion: String? {get}
    var meeting_place: String? {get}
    var cost: String? {get}
    var tag: String? {get}
    var detail_content: String? {get}
    
}

*/
struct recure: Codable {
    var id: String?
    let imagetext: String?
    let title: String?
    let start_time: Date?
    let finish_time: Date?
    let place: String?
    let people_num: String?
    let detail_localtion: String?
    let meeting_place: String?
    let cost: String?
    let tag: String?
    let detail_content: String?
    let time_sptamp: Date?
    let user_id: String?
}

struct user: Codable {
    var id: String?
    let user_imagetext: String!
    let user_name: String
    let user_id: String//登入帳號
    let user_nikename: String
    let user_gender: String
    let user_birthday: Date
    let user_habitat: String//居住地
    let user_license: String//執照
    let user_hobbies: [String]//興趣
    let follower: [String]!//粉絲
    let introduce_content: String!//自我介紹
    let voyeur: [String]!//追蹤
    
    var dictionary:[String:Any] {
        return [
            "id":id,
            "user_imagetext":user_imagetext,
            "user_name":user_name,
            "user_id":user_id,
            "user_nikename":user_nikename,
            "user_gender":user_gender,
            "user_birthday":user_birthday,
            "user_habitat":user_habitat,
            "user_license":user_license,
            "user_hobbies":user_hobbies,
            "follower":follower,
            "introduce_content":introduce_content,
            "voyeur":voyeur
            
        ]
    }
    
}

struct user_action: Codable {
    let travel_id: [String]?
    let history＿partner: [String]?
    let recruit＿travel: [String]?//正在開團
    let clockIn: [String]?
    let place_id: [String]?//新增地點
    
}

//行程資料
struct travel_action: Codable {
    let travel_id: String?
    let partner: [String]?
    let main_keeper: String?
    let finish_time: Date?
    let place_id: [String]?//新增地點
    
}

struct get_hobbies: Codable {
    let type_image: String
    let type_name: String
    var dictionary:[String:String] {
        return [
        "type_image":type_image,
        "type_name":type_name
        ]
    }
}


/*
struct AddTraveItemViewModels: AddTraveItemPresentable {
    var id: String? 
    var imagetext: String?
    var title: String?
    var start_time: String?
    var finish_time: String?
    var place: String?
    var people_num: String?
    var detail_localtion: String?
    var meeting_place: String?
    var cost: String?
    var tag: String?
    var detail_content: String?
}
*/
protocol AddTraveItemViewDelegate {
    func onAddTraveItemAdd () -> ()
}

let db = Firestore.firestore()

class GetHobbies {
    init() {
        GetHobbies.gethobbies()
    }
    static var hobbiesItems: [get_hobbies] = []
    //static var type_image: String = ""
    static var type_name: [String] = []
    
    static func gethobbies() {
        db.collection("hobbies").getDocuments{(querySnapshot, error) in
    if let error = error {
            print("Error getting documents: \(error)")
    } else {
        for document in querySnapshot!.documents {
            //GetHobbies.type_image = document.data()[ "type_image"] as! String
            //GetHobbies.type_name = document.data()[ "type_name"] as! String
            let hobbies: [get_hobbies] = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data(as: get_hobbies.self)}
            //GetHobbies.hobbiesItems.removeAll()
            GetHobbies.hobbiesItems = hobbies
        }
    }
        }
        
        db.collection("hobbies").whereField("type_name", isNotEqualTo: "")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        //GetHobbies.type_name = querySnapshot!.documents as! [String]
                    }
                }
        }
    }
    

}

class AddUserViewModels {
    init() {
        AddUserViewModels.loadUserData()
    }
    
    static var userItems: [user] = []
    
    static var user_name: String = ""
    static var user_nikename: String = ""
    static var user_imagetext: StorageReference? = nil
    static var introduce_content: String = ""
    static var user_gender: String = ""
    static var follower: [String] = [""]
    static var voyeur: [String] = [""]
    static var user_habitat: String = ""
    static var user_birthday: String = ""
    static var user_hobbies: [String] = [""]
    static var id: String = ""
    static func loadUserData() -> (Void) {
        
        db.collection("users").whereField("user_id", isEqualTo: SignInViewController.user_email)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("TLV136","\(document.documentID) => \(document.data())")
                        
                        AddUserViewModels.user_name = document.data()[ "user_name"] as! String
                        AddUserViewModels.user_nikename = document.data()[ "user_nikename"] as! String
                        let storage = Storage.storage()
                        let storageRef = storage.reference()
                        AddUserViewModels.user_imagetext = storageRef.child(document.data()[ "user_imagetext"] as! String)
                        AddUserViewModels.user_gender = document.data()[ "user_gender"] as! String
                        AddUserViewModels.introduce_content = document.data()[ "introduce_content"] as! String
                        AddUserViewModels.follower = document.data()[ "follower"] as! [String]
                        AddUserViewModels.voyeur = document.data()[ "voyeur"] as! [String]
                        //AddUserViewModels.user_birthday = document.data()[ "user_birthday"] as? Date
                        AddUserViewModels.user_habitat = document.data()[ "user_habitat"] as! String
                        AddUserViewModels.user_hobbies = document.data()[ "user_hobbies"] as! [String]
                        print("TLV160",document.data()[ "user_birthday"] as! Timestamp)
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "YYYY年MM月dd日"
                        let timestamp: Timestamp = document.data()[ "user_birthday"] as! Timestamp
                        AddUserViewModels.user_birthday = dateFormatter.string(from: timestamp.dateValue())
                        
                        AddUserViewModels.id = document.data()[ "id"] as! String
                        
                        var users: [user] = querySnapshot!.documents.compactMap{querySnapshot in try? document.data(as: user.self)}
                            
                        AddUserViewModels.userItems = users
                            
                        print("TLV143",AddUserViewModels.user_nikename)
                        
                        }
                }
        }
        
    
    }
}

class AddTraveViewModels {
    //var newAddTraveItem: String?
    //var item: [AddTraveItemPresentable] = []
    init()
   // /**
    {
       
        AddTraveViewModels.loadData()
            //print("0051:",self.item.count)
        
        //self.item = loadData()
        
    }//init



//static var item: [AddTraveItemPresentable] = []
static var myItems: [recure] = []


     
static func loadData(/*completion: @escaping () -> [AddTraveItemPresentable]*/) //-> [AddTraveItemPresentable]
    {
    
    db.collection("travel").getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error getting documents: \(error)")
        } else {
            
            for _ in querySnapshot!.documents {

                
                var i123: [recure] = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data(as: recure.self)}
               
                AddTraveViewModels.myItems.removeAll()
                
                AddTraveViewModels.myItems = i123
                
                
                DispatchQueue.main.async {
                   
                   // print("spy", index)
                    print("pltr",AddTraveViewModels.myItems[0])
                }
                
                
                
                

            }//for
            print("tqqqq")

            }//else
        //print("vti", self.item)
    }//getDocuments
    print("voo")
        
        
    //return item//completion()//
}//func
}//class

class AddUserAction {
    init() {
        
    }
    static var travel_id: [Set<String>] = []
    static var history＿partner: [String] = []
    static var recruit＿travel: [String] = []
    static var clockIn: [String] = []
    static var place_id: [String] = []
    
    static func loadData() {
        db.collection("user_action").whereField("id", isEqualTo: AddUserViewModels.id).getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                
                for document in querySnapshot!.documents {

                    
                    AddUserAction.travel_id = document.data()[ "travel_id"] as! [Set<String>]
                    
                    
                    
                    
                    
                    
                    

                }//for
                print("tqqqq")

                }//else
            //print("vti", self.item)
        }
    }
}

extension AddTraveViewModels: AddTraveItemViewDelegate {
    func onAddTraveItemAdd() {
        
    }
}
