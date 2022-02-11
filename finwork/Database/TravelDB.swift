//
//  TravelDB.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/22.
//

//import Foundation
protocol TravelDB {
    func add(usingTravelItem TravelItem: TravelItem) -> Bool
    func update(usingTravelItem TravelItem: TravelItem) -> Void
    //func delete(usingTravelItem TravelItem: TravelItem) -> Void
}
