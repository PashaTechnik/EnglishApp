import Foundation

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

public class JsonDataLoader {
    @Published var translateQuizData = [TranslateQuiz]()
    @Published var listeningData = [listening]()
    @Published var grammarData = [grammar]()
    @Published var translateData = [Translate]()
    @Published var questionData = [Question]()

    
    init() {
        load()
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
                let dataFromJson = try jsonDecoder.decode([TranslateQuiz].self, from: data)
                self.translateQuizData = dataFromJson
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
                let dataFromJson = try jsonDecoder.decode([Translate].self, from: data)
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
