import Foundation

struct testing_quiz: Codable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var right: Int
}

struct grammar: Codable {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var right: Int
}

struct listening: Codable {
    var question: String
    var answer: String
}

struct translate: Codable {
    var question: String
    var answer: String
}


public class JsonDataLoader {
    @Published var tesingQuizData = [testing_quiz]()
    @Published var listeningData = [listening]()
    @Published var grammarData = [grammar]()
    @Published var translateData = [translate]()
    @Published var questionData = [Question]()

    
    init() {
        load()
       // print(listeningData[0].question)
    }
    
    public func random()
    {
        
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "DataSets/testing-sets/quiz", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([testing_quiz].self, from: data)
                self.tesingQuizData = dataFromJson
            } catch {
                print(error)
            }
        }
        if let fileLocation = Bundle.main.url(forResource: "DataSets/testing-sets/listening", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([listening].self, from: data)
                self.listeningData = dataFromJson
            } catch {
                print(error)
            }
        }
        if let fileLocation = Bundle.main.url(forResource: "DataSets/testing-sets/grammar", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([grammar].self, from: data)
                self.grammarData = dataFromJson
            } catch {
                print(error)
            }
        }
        if let fileLocation = Bundle.main.url(forResource: "DataSets/testing-sets/translate", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([translate].self, from: data)
                self.translateData = dataFromJson
            } catch {
                print(error)
            }
        }
        if let fileLocation = Bundle.main.url(forResource: "DataSets/testing-sets/questions", withExtension: "json")
        {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Question].self, from: data)
                self.questionData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
}
