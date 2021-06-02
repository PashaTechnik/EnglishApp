import Foundation
import RealmSwift

class Translate: Object, Codable{
    @objc dynamic var id = 0
    @objc dynamic var word: String?
    @objc dynamic var translate: String?
    @objc dynamic var level: String?
    
    
    required init(id: Int, word: String?, translate: String?, level: String?){
        self.id = id
        self.word = word
        self.translate = translate
        self.level = level
    }
    
    required override init() { }
}
