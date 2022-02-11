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
}

struct user: Codable {
    var id: String
    let user_imagetext: String
    let user_name: String
    let user_id: String//登入帳號
    let user_nikename: String
    let user_gender: String
    let user_birthday: Date
    let user_habitat: String//居住地
    let user_license: String//執照
    let user_hobbies: String//興趣
    let follower: String//粉絲
    let introduce_content: String//自我介紹
    let voyeur: String//追蹤
    
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
    let travel_id: String?
    let history＿partner: String?
    let recruit＿travel: String?//正在開團
    let done＿travel: String?//結束行程
    let clockIn: String?
    let place_id: String?//新增地點
    
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

class AddUserViewModels {
    init() {
        self.loadUserData()
    }
    
    static var userItems: [user] = []
    func loadUserData() {
        
    }

}

class AddTraveViewModels {
    //var newAddTraveItem: String?
    //var item: [AddTraveItemPresentable] = []
    init()
   // /**
    {
       
            self.loadData()
            //print("0051:",self.item.count)
        
        //self.item = loadData()
        
    }//init



//static var item: [AddTraveItemPresentable] = []
static var myItems: [recure] = []


    
func loadData(/*completion: @escaping () -> [AddTraveItemPresentable]*/) //-> [AddTraveItemPresentable]
    {
    
    db.collection("travel").getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error getting documents: \(error)")
        } else {
            
            for _ in querySnapshot!.documents {

                //let opter: Int = 0
                //let count: Int = self.item.count
                /*
                var iditem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["id"]}
                var titleitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["title"]}
                var placeitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["place"]}
                var start_timeitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["start_time"]}
                var finish_timeitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["finish_time"]}
                var people_numitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["people_num"]}
                var tagitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["tag"]}
                var imagetextitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["imagetext"]}
                var detail_localtionitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["detail_localtion"]}
                var meeting_placeitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["meeting_place"]}
                var costitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["cost"]}
                var detail_contentitem: Any = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data()["detail_content"]}
               */
                var i123: [recure] = querySnapshot!.documents.compactMap{querySnapshot in try? querySnapshot.data(as: recure.self)} as! [recure]
               /*
                var index = AddTraveItemViewModels(id: String(describing: iditem),
                                                  imagetext: String(describing: imagetextitem),
                                                  title: String(describing: titleitem),
                                                  start_time: String(describing: start_timeitem),
                                                  finish_time: String(describing: finish_timeitem),
                                                  place: String(describing: placeitem),
                                                  people_num: String(describing: people_numitem),
                                                  detail_localtion: String(describing: detail_localtionitem),
                                                  meeting_place: String(describing: meeting_placeitem),
                                                  cost: String(describing: costitem),
                                                  tag: String(describing: tagitem),
                                                  detail_content: String(describing: detail_contentitem))
                //print("hood")
                */
                AddTraveViewModels.myItems.removeAll()
                //AddTraveViewModels.myItems.append(contentsOf:[i123])
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

extension AddTraveViewModels: AddTraveItemViewDelegate {
    func onAddTraveItemAdd() {
        
    }
}
