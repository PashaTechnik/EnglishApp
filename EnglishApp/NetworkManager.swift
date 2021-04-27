//
//  NetworkManager.swift
//  EnglishApp
//
//  Created by Pasha on 20.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation
import Firebase

class NetworkManager: NSObject {
    
    public static var currentUserDocumentId: String?
    public static var userDictionary: Dictionary<String,String>?
    
     func fetchData(completion: @escaping (User) -> ()){
        let db = Firestore.firestore()
        let currentUserId = Auth.auth().currentUser?.uid
        let user = db.collection("users").whereField("uid", isEqualTo: currentUserId!)
        user.getDocuments { (query, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in query!.documents {
                    print("\(document.documentID) => \(document.data())")
                    NetworkManager.currentUserDocumentId = document.documentID
                    let firstName = document.data()["firstname"] as! String
                    let lastName = document.data()["lastname"] as! String
                    let points = document.data()["points"] as? Int ?? 0
                    let dictionary = document.data()["Dictionary"] as? Dictionary<String,String> ?? [:]
                    let currentUser = User(firstName: firstName, lastName: lastName, email: "", points: points, dictionary: dictionary)
                    NetworkManager.userDictionary = dictionary
                    completion(currentUser)
                }
            }
        }
    }
    
    static func updateDictionary(newDict: Dictionary<String,String>){
        let db = Firestore.firestore()
        let user = db.collection("users").document(currentUserDocumentId!)
        NetworkManager.userDictionary!.merge(dict: newDict)
        user.updateData([
            "Dictionary": userDictionary,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}


extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
