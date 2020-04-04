//
//  ViewController.swift
//  Tipsy
//
//  Created by Saul Rivera on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Float = 0.1
    var splitters = 2
    
    var splitterLogic = SplitterLogic()

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        
        sender.isSelected = true
        
        let buttonTittle = sender.currentTitle!
        let percentageTittle = buttonTittle.dropLast()
        let percentagex100 = Double(percentageTittle)!
        tip = Float(percentagex100) / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitters = Int(sender.value)
        splitNumberLabel.text = String(splitters)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billTextField.text!) ?? 0.0
        splitterLogic.calculateSplit(bill: bill, tip: tip, splitters: splitters)
        
        performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.sliceAmount = splitterLogic.pieceAmount
            destinationVC.tipPercentage = tip
            destinationVC.amountPeople = splitters
        }
    }
}

