//
//  Networking.swift
//  EnglishApp
//
//  Created by Pasha on 25.10.2020.
//  Copyright © 2020 Pasha. All rights reserved.
//

import Foundation


class Networking {
    static func fetchData(completion: @escaping ([User]) -> ()){
        guard let url = URL(string: "http://localhost:8080/users") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            let decoder = JSONDecoder()
            
            if let users = try? decoder.decode([User].self, from: data) {

                completion(users)
                
                } else {
                    print("Unable to parse JSON response.")
                }
        }.resume()
    }
    
    static func addUser(_ user: User){
        let nUser = User(name: user.name, email: user.email, password: user.password, points: user.points)
        let url = URL(string: "http://localhost:8080/users")!

        let encoder = JSONEncoder()

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? encoder.encode(nUser)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()

                if let item = try? decoder.decode(User.self, from: data) {
                    print(item.email)
                } else {
                    print("Bad JSON received back.")
                }
            }
        }.resume()
    }
}