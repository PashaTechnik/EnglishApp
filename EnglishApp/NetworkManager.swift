//
//  NetworkManager.swift
//  EnglishApp
//
//  Created by Pasha on 20.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class NetworkManager: NSObject {
    
    public static var currentUserDocumentId: String?
    
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
                    let imageURL = document.data()["ProfileImage"] as? String ?? ""
                    let grammarQuestions = document.data()["GrammarQuestions"] as? Array<Int> ?? []
                    let translateQuiz = document.data()["TranslateQuiz"] as? Array<Int> ?? []
                    let translateQuestions = document.data()["TranslateQuestions"] as? Array<Int> ?? []
                    let url = URL(string: imageURL)
                    let image: UIImage
                    if url != nil{
                        let imageData = try? Data(contentsOf: url!)
                        image = UIImage(data: imageData!)!
                    } else {
                        image = UIImage(named: "profileIco")!
                    }
                        
                    
                    let currentUser = User(firstName: firstName, lastName: lastName, email: "", points: points, dictionary: dictionary, profileImage: image)
                    CurrentUser.init(firstName: firstName, lastName: lastName, points: points, dictionary: dictionary, profileImage: image, grammarQuestions: grammarQuestions, translateQuiz: translateQuiz, translateQuestions: translateQuestions)
                    
                    
                    completion(currentUser)
                }
            }
        }
    }
    
    static func updateDictionary(newDict: Dictionary<String,String>){
        let db = Firestore.firestore()
        let user = db.collection("users").document(currentUserDocumentId!)
        CurrentUser.Dictionary!.merge(dict: newDict)
        user.updateData([
            "Dictionary": CurrentUser.Dictionary!,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    static func deleteWordInDictionary(key: String){
        CurrentUser.Dictionary!.removeValue(forKey: key)
        let db = Firestore.firestore()
        let user = db.collection("users").document(currentUserDocumentId!)
        user.updateData([
            "Dictionary": CurrentUser.Dictionary!,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    static func saveImageToStorage(image: UIImage?){
        let imageName = NSUUID().uuidString
        CurrentUser.Image = image
        let storage = Storage.storage().reference().child("profilePhotos/\(imageName).png")
        
        if let uploadData = image!.pngData() {
            storage.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print(error!)
                    return
                }
                storage.downloadURL { url, error in
                  if let error = error {
                    print(error)
                  } else {
                    let db = Firestore.firestore()
                    let user = db.collection("users").document(currentUserDocumentId!)
                    user.updateData([
                        "ProfileImage": url!.absoluteString,
                    ]) { err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                  }
                }
            }
        }
    }
    
    static func editGrammarQuestions(grammarQuestionIndex: Int){
        let db = Firestore.firestore()
        let user = db.collection("users").document(currentUserDocumentId!)
        CurrentUser.GrammarQuestions?.append(grammarQuestionIndex)
        user.updateData([
            "GrammarQuestions": FieldValue.arrayUnion([grammarQuestionIndex])
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    static func editTranslateQuestions(translateQuestionIndex: Int){
        let db = Firestore.firestore()
        let user = db.collection("users").document(currentUserDocumentId!)
        CurrentUser.TranslateQuestions?.append(translateQuestionIndex)
        user.updateData([
            "TranslateQuestions": FieldValue.arrayUnion([translateQuestionIndex])
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    static func editTranslateQuiz(translateQuizIndex: Int){
        let db = Firestore.firestore()
        let user = db.collection("users").document(currentUserDocumentId!)
        CurrentUser.TranslateQuiz?.append(translateQuizIndex)
        user.updateData([
            "TranslateQuiz": FieldValue.arrayUnion([translateQuizIndex])
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    static func editPoints(points: Int){
        let db = Firestore.firestore()
        let user = db.collection("users").document(currentUserDocumentId!)
        CurrentUser.Points! += points
        user.updateData([
            "points": CurrentUser.Points!
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

