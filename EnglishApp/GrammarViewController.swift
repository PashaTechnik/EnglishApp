import UIKit

let tenseDescription1 = ["Text5","Text3","Text1","Text6","Text7","Text8","Text9","Text10"]

class GrammarViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let tensesList = [["Present Simple", "Present Continious", "Past Simple", "Articles", "Present Perfect"],["pr","prrr"],["op", "opp"]]
    let sectionHeasers = ["Начинающий уровень","Средний уровень","Продвинутый уровень"]

    let tenseDescription = ["Text5","Text3","Text1","Text6","Text7","Text8","Text9","Text10"]
    
    
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
            destination.tenseDescriptionInformation.label = tenseDescription1[(grammarTableView.indexPathForSelectedRow?.row)!]
            
            
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


