//
//  Person.swift
//  EnglishApp
//
//  Created by Pasha on 19.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: UUID?
    var email: String
    var password: String
}
