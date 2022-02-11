//
//  TravelItem.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/22.
//

//import Foundation
struct TravelItem: Codable {
    let id: String
    //let imagetext: String
    let title: String
    let start_time: String
    //let finish_time: String
    let place: String
    //let people_num: String
    //let detail_localtion: String
    //let meeting_place: String
    //let cost: String
    //let tag: String
    //let detail_content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case start_time
        case place
    }
}
