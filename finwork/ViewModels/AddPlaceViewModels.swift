//
//  AddPlaceViewModels.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/15.
//

//import Foundation
/**
import Foundation

class AddPlaceViewModels: ObservableObject {
    @Published var list = [location_Data]()
}
 */
protocol AddPlaceItemPresentable {
    
    var id: String? {get}
    var name: String? {get}
    
}

struct AddPlaceItemViewModels: AddPlaceItemPresentable {
    
    var id: String? = "0"
    var name: String?
}

protocol AddPlaceItemViewDelegate {
    func onAddPlaceItemAdd () -> ()
}

struct AddPlaceViewModels {
    
    init() {
        let item1 = AddPlaceItemViewModels(id: "1", name: "washing clothes")
        let item2 = AddPlaceItemViewModels(id: "2", name: "buy food")
        
        item.append(contentsOf: [item1,item2])
    }
    var newAddPlaceItem: String?
    var item: [AddPlaceItemPresentable] = []
}

extension AddPlaceViewModels: AddPlaceItemViewDelegate {
    func onAddPlaceItemAdd() {
        
    }
}

