//
//  InsertDate.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/7.
//

import Foundation
import FirebaseFirestore

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}
struct cdb {
    static var db:Firestore!
        
    static var travelArray = [travel]()
    static var lastid = "0"
}
struct travel {
    
    var imagetext: String
    var title: String
    var start_time: Date
    var finish_time: Date
    var place: String
    var people_num: String
    var detail_localtion: String
    var meeting_place: String
    var cost: String
    var tag: String
    var detail_content: String
    var time_sptamp:Date
    var user_id:String
    
    var dictionary:[String:Any] {
        return [
            "title":title,
            "imagetext":imagetext,
            "start_time":start_time,
            "place":place,
            "finish_time":finish_time,
            "people_num":people_num,
            "detail_localtion":detail_localtion,
            "meeting_place":meeting_place,
            "cost":cost,
            "tag":tag,
            "detail_content":detail_content,
            "time_sptamp":time_sptamp,
            "user_id":user_id

        ]
    }
    
    
}

extension travel : DocumentSerializable {
    init?(dictionary:[String:Any]) {
        guard let title = dictionary["title"] as? String,
              let imagetext = dictionary["imagetext"] as? String,
              let start_time = dictionary["start_time"] as? Date,
              let finish_time = dictionary["finish_time"] as? Date,
              let people_num = dictionary["people_num"] as? String,
              let detail_localtion = dictionary["detail_localtion"] as? String,
              let meeting_place = dictionary["meeting_place"] as? String,
              let place = dictionary["place"] as? String,
              let cost = dictionary["cost"] as? String,
              let tag = dictionary["tag"] as? String,
              let detail_content = dictionary["detail_content"] as? String,
              let time_sptamp = dictionary["time_sptamp"] as? Date,
              let user_id = dictionary["user_id"] as? String
        else {return nil}
        
        self.init(imagetext: imagetext,
                  title: title,
                  start_time: start_time,
                  finish_time: finish_time,
                  place: place,
                  people_num: people_num,
                  detail_localtion: detail_localtion,
                  meeting_place: meeting_place,
                  cost: cost,
                  tag: tag,
                  detail_content: detail_content,
                  time_sptamp: time_sptamp,
                  user_id: user_id)
    }
    

}
