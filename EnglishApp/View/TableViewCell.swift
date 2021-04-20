//
//  TableViewCell.swift
//  EnglishApp
//
//  Created by Pasha on 18.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var translate: UILabel!
    
    weak var viewModel: TableViewCellModelType? {
        willSet(viewModel) {
            word.text = viewModel?.word
            translate.text = viewModel?.translate
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }


}
