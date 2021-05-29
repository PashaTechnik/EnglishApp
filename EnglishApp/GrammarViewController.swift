import UIKit

class GrammarViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    let tensesList = ["Present Simple", "Present Continious", "Past Simple", "Articles", "Present Perfect"]

    
    @IBOutlet weak var grammarTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grammarTableView.delegate = self
        grammarTableView.dataSource = self

        
        


}
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tensesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = grammarTableView.dequeueReusableCell(withIdentifier: "grammarCell") as! CustomGrammarListTableViewCell
        
        cell.TenseNameLabel.text = tensesList[indexPath.row]
        
        return cell
    }
}
