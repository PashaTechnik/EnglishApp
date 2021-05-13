//
//  CardViewController.swift
//  EnglishApp
//
//  Created by Pasha on 24.04.2021.
//  Copyright © 2021 Pasha. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, SwipeableCardViewDataSource {
    

    @IBOutlet private weak var swipeableCardView: SwipeableCardViewContainer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeableCardView.dataSource = self
    }

}

// MARK: - SwipeableCardViewDataSource

extension CardViewController {

    func numberOfCards() -> Int {
        return viewModels.count
    }

    func card(forItemAtIndex index: Int) -> SwipeableCardViewCard {
        let viewModel = viewModels[index]
        let cardView = SampleSwipeableCard()
        cardView.viewModel = viewModel
        return cardView
    }

    func viewForEmptyCards() -> UIView? {
        return nil
    }

}

extension CardViewController {

    var viewModels: [SampleSwipeableCellViewModel] {

        let hamburger = SampleSwipeableCellViewModel(title: "Hamburger",
                                                     subtitle: "Гамбургер",
                                                     color: UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0),
                                                     image: #imageLiteral(resourceName: "hamburger"))

        let panda = SampleSwipeableCellViewModel(title: "Panda",
                                                  subtitle: "Панда",
                                                  color: UIColor(red:0.29, green:0.64, blue:0.96, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "panda"))

        let puppy = SampleSwipeableCellViewModel(title: "Puppy",
                                                  subtitle: "Щенок",
                                                  color: UIColor(red:0.29, green:0.63, blue:0.49, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "puppy"))

        let robot = SampleSwipeableCellViewModel(title: "Robot",
                                                  subtitle: "Робот",
                                                  color: UIColor(red:0.90, green:0.99, blue:0.97, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "robot"))

        let clown = SampleSwipeableCellViewModel(title: "Clown",
                                                  subtitle: "Клоун",
                                                  color: UIColor(red:0.83, green:0.82, blue:0.69, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "clown"))

        return [hamburger, panda, puppy, robot, clown]
    }

}

