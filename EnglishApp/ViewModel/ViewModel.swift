//
//  ViewModel.swift
//  EnglishApp
//
//  Created by Pasha on 19.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation
import Firebase

protocol TableViewModelType {
    var numberOfRows: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellModelType?
}

protocol TableViewCellModelType:class  {
    var word: String { get }
    var translate: String { get }
}

class ViewModel: TableViewModelType {
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellModelType? {
        let word = Array(Dictionary)[indexPath.row]
        return TableViewCellViewModel(dictionary: word)
    }
    
    
    var numberOfRows: Int {
        return Dictionary.count
    }
    
    
    var Dictionary: [String:String] {
        return self.getUserDictionary()
    }
    
    func getUserDictionary() -> Dictionary<String,String> {
        let db = Firestore.firestore()
        let currentUserId = Auth.auth().currentUser?.uid
        var dictionary: Dictionary<String,String> = [:]
        let user = db.collection("users").whereField("uid", isEqualTo: currentUserId)
        user.getDocuments { (query, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in query!.documents {
                            dictionary = document.data()["Dictionary"] as! Dictionary<String, String>
                        }
                    }
        }
        return dictionary
    }
}
