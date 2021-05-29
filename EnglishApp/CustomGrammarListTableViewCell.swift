import UIKit

class CustomGrammarListTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var TenseNameLabel: UILabel!
 
    @IBOutlet weak var progressBar: UIView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressBar.layer.cornerRadius = 3
        cellView.layer.cornerRadius = 10
        progressBar.layer.masksToBounds = false
        cellView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    

}
