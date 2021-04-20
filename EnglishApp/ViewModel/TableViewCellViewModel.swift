//
//  TableViewCellViewModel.swift
//  EnglishApp
//
//  Created by Pasha on 19.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellModelType {
    var word: String {
        return dictionary.key
    }
    
    var translate: String {
        return dictionary.value
    }
    
    private var dictionary: Dictionary<String,String>.Element
    
    init(dictionary: Dictionary<String,String>.Element) {
        self.dictionary = dictionary
    }
}
