//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Saul Rivera on 01/03/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var sliceAmount: Double?
    var amountPeople: Int = 2
    var tipPercentage: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipx100 = (tipPercentage ?? 0.0) * 100
        let tipString = String(format: "%.0f", tipx100)
        
        totalLabel.text = String(format: "%.2f", sliceAmount ?? 0.00)
        settingsLabel.text = "Split between \(amountPeople) people, with \(tipString)% tip."
    }
    
    @IBAction func recalculateBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
