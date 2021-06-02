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
