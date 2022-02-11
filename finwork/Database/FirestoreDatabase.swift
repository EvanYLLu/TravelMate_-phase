//
//  FirestoreDatabase.swift
//  finwork
//
//  Created by Evan Lu on 2021/12/23.
//

//import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirestoreDatabase {
    private let firebaseDb = Firestore.firestore()
    static let shard : FirestoreDatabase = FirestoreDatabase()
    private let travelCollection = "travel"
    private init() { }
}

extension FirestoreDatabase: TravelDB {
    func add(usingTravelItem travelItem: TravelItem) -> Bool {
        do {
           let ref = try firebaseDb.collection(travelCollection)
                .addDocument(from: travelItem)
            print("Add Document succeded with id = \(ref.documentID)")
        } catch let error {
            print("Add Document failed: \(error)")
            return false
        }
        
        
        return true
    }
    
    func update(usingTravelItem TravelItem: TravelItem) {
        firebaseDb.collection(travelCollection).whereField("id", isEqualTo: TravelItem.id).getDocuments { (snapshot, error) in
            if let document = snapshot?.documents.first {
                do {
                    try document.reference.setData(from: TravelItem)
                } catch let error {
                    print("Document read error: \(error)")
                }
            }
            
        }
    }
}
