//
//  resultsView.swift
//  Personality Quiz
//
//  Created by David Granger on 2/15/23.
//

import UIKit

extension Array where Element: Comparable {
   var indexOfMax: Index? {
      guard var maxValue = self.first else { return nil }
      var maxIndex = 0

      for (index, value) in self.enumerated() {
         if value > maxValue {
            maxValue = value
            maxIndex = index
         }
     }

     return maxIndex
   }
}

class resultsView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let whichAnimal = resultsArray.indexOfMax
        if whichAnimal == 0 {
            resultsLabel.text = "🐅"
            resultsDetailLabel2.text = "Tiger!"
        } else if whichAnimal == 1 {
            resultsLabel.text = "🐬"
            resultsDetailLabel2.text = "Dolphin!"
        } else if whichAnimal == 2 {
            resultsLabel.text = "🦊"
            resultsDetailLabel2.text = "Fox!"
        } else {
            resultsLabel.text = "🐴"
            resultsDetailLabel2.text = "Horse!"
        }
        whichPageWeAreOn = 1
        resultsArray = [0, 0, 0, 0]
    }
    @IBOutlet weak var resultsDetailLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var resultsDetailLabel2: UILabel!
}
