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
        guard let url = URL(string: "http://serene-mountain-41963.herokuapp.com/users") else { return }
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
}
