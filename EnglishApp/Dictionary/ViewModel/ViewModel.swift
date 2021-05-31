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
    
    var Dictionary: [String:String] = [:]
}
