//
//  SplitterLogic.swift
//  Tipsy
//
//  Created by Saul Rivera on 01/03/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct SplitterLogic {
        
    var bill: Double?
    var tip: Float?
    var splitters: Int?
    
    
    mutating func calculateSplit(bill: Double, tip: Float, splitters: Int) {
        self.bill = bill
        self.tip = tip
        self.splitters = splitters
    }
    
    var pieceAmount: Double {
        get {
            let billToUse = bill ?? 0.0
            let tipToUse = tip ?? 0.0
            let splittersToUse = splitters ?? 2
            return billToUse * Double(1 + tipToUse) / Double(splittersToUse)
        }
    }
}
