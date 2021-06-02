//
//  TranslateViewController.swift
//  EnglishApp
//
//  Created by Pasha on 28.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit
import Firebase
import MLKit

let options = TranslatorOptions(sourceLanguage: .russian, targetLanguage: .english)
let russianEnglishTranslator = Translator.translator(options: options)
let conditions = ModelDownloadConditions(
    allowsCellularAccess: false,
    allowsBackgroundDownloading: true
)

class TranslateViewController: UIViewController {

    @IBOutlet weak var buttonTranslate: UIButton!
    @IBOutlet weak var wordTextField: UITextField!
    
    @IBOutlet weak var traslateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonTranslate.layer.cornerRadius = 0.5 * buttonTranslate.bounds.size.width;
        

    }
    
    @IBAction func saveWord(_ sender: Any) {
        if (wordTextField.text != "") && (traslateTextField.text != ""){
            let word = wordTextField.text!.capitalizingFirstLetter()
            let tranlsate = traslateTextField.text!.capitalizingFirstLetter()
            NetworkManager.updateDictionary(newDict: [tranlsate:word])
        }
        self.performSegue(withIdentifier: "exitAction", sender: self)
    }
    @IBAction func translateBtn(_ sender: Any) {
        
        russianEnglishTranslator.downloadModelIfNeeded(with: conditions) { error in
            guard error == nil else { return }

        }
        
        russianEnglishTranslator.translate(wordTextField.text!) { [self] translatedText, error in
            guard error == nil, let translatedText = translatedText else { return }
            traslateTextField.text = translatedText
    
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
