import UIKit

let tenseDescription1 = ["Text5","Text3","Text1","Text6","Text7","Text8","Text9","Text10"]

class GrammarViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let tensesList = [["Present Simple", "Present Continious", "Past Simple", "Articles", "Present Perfect", "Pronouns"],["Conditional clauses","Prepositions", "Adverbs"],["Modal Verbs", "Participles", "Reported Speech"]]
    let sectionHeasers = ["Начинающий уровень","Средний уровень","Продвинутый уровень"]

    let tenseDescription = ["Время Present Simple обозначает действие в настоящем в широком смысле слова. Оно употребляется для обозначения обычных, регулярно повторяющихся или постоянных действий, например, когда мы говорим о чьих-либо привычках, режиме дня, расписании и т. д., т. е. Present Simple обозначает действия, которые происходят в настоящее время, но не привязаны именно к моменту речи.","Present Continuous Tense (или Present Progressive Tense) переводится с английского языка как «настоящее длительное время». В английской речи оно употребляется наравне с Present Simple, с той же частотой, и занимает важное место в грамматике. Когда используется Present Continuous — когда требуется подчеркнуть длительность действия в настоящем. Пределы «длительности» могут быть разными: действие может продолжаться неопределенный срок или занимать определенный промежуток времени ¬— все это случаи употребления Present Continuous.","Text1","Text6","Text7","Text8","Text9","Text10"]
    
    
    @IBOutlet weak var grammarTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grammarTableView.delegate = self
        grammarTableView.dataSource = self
}
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tensesList[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = grammarTableView.dequeueReusableCell(withIdentifier: "grammarCell") as! CustomGrammarListTableViewCell
        
        cell.TenseNameLabel.text = tensesList[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionHeasers[section] as String
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toTenseVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GrammarTenseViewController {
//            destination.inf.text = tenseDescription1[(grammarTableView.indexPathForSelectedRow?.row)!]
            destination.tenseDescriptionInformation.label = tenseDescription[(grammarTableView.indexPathForSelectedRow?.row)!]
            
            
            grammarTableView.deselectRow(at: grammarTableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionHeasers.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
            myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        myLabel.font = UIFont(name: "Montserrat-Bold", size: 18)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        myLabel.textColor = UIColor(red: 54/255.0, green: 54/255.0, blue: 54/255.0, alpha: 1.0)

            let headerView = UIView()
            headerView.addSubview(myLabel)

            return headerView
    }
}


