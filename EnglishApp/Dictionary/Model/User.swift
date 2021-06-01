//
//  Person.swift
//  EnglishApp
//
//  Created by Pasha on 19.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import UIKit

struct User: Equatable {
    var firstName: String
    var lastName: String
    var email: String
    var points: Int
    var dictionary: Dictionary<String,String>
    var profileImage: UIImage?
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.firstName == rhs.firstName
            && lhs.lastName == rhs.lastName
            && lhs.email == rhs.email
            && lhs.points == rhs.points
            && lhs.dictionary == rhs.dictionary
            && lhs.profileImage == rhs.profileImage
    }
}
