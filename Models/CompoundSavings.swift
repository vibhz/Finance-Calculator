//
//  CompundSavings.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 22/07/2022.
//  Copyright © 2022 Vibhavi Hettiarachchi. All rights reserved.
//
import Foundation

class CompoundSavings {
    
    var presentValue: Double
    var futureValue : Double
    var interestAmount : Double
    
    var numberOfYears : Double
    var compoundsPerYear : Int
    var historyStringArray : [String]
    
    init(presentValue: Double, futureValue: Double, interest: Double, numberOfYears: Double, compoundsPerYear : Int) {
        self.presentValue = presentValue
        self.futureValue = futureValue
        self.interestAmount = interest
        self.numberOfYears = numberOfYears
        self.compoundsPerYear = compoundsPerYear
        self.historyStringArray = [String]()
    }
 
    func presentValueCalculation() -> Double {
        let AIR = self.interestAmount / 100
        let PV = self.futureValue / pow(1 + (AIR / Double(self.compoundsPerYear)), Double(self.compoundsPerYear) * self.numberOfYears)
        
       if PV < 0 || PV.isNaN || PV.isInfinite {
            self.presentValue = 0.0;
            return self.presentValue
        } else {
            self.presentValue = PV.roundTo2()
            return self.presentValue
        }
        
    }
    
    

    func futureValueCalculation() -> Double {
        let AIR = self.interestAmount / 100
        let FV = self.presentValue * pow(1 + (AIR / Double(self.compoundsPerYear)), Double(self.compoundsPerYear) * self.numberOfYears)
        
        if FV < 0 || FV.isNaN || FV.isInfinite {
            self.futureValue = 0.0;
            return self.futureValue
        } else {
            self.futureValue = FV.roundTo2()
            return self.futureValue
        }
        
    }
    
    func compoundIRCalculation() -> Double {
        let IR = Double(self.compoundsPerYear) * (pow((self.futureValue / self.presentValue), (1 / (Double(self.compoundsPerYear) * self.numberOfYears))) - 1)
        
        if IR < 0 || IR.isNaN || IR.isInfinite {
            self.interestAmount = 0.0;
            return self.interestAmount
        } else {
            let AIR = IR * 100
            self.interestAmount = AIR.roundTo2()
            return self.interestAmount
        }
        
        
    }

    func numberOfYearsCalculation() -> Double {
        let AIR = self.interestAmount / 100
        let years = log(self.futureValue / self.presentValue) / (Double(self.compoundsPerYear) * log(1 + (AIR / Double(self.compoundsPerYear))))
        
        if years < 0 || years.isNaN || years.isInfinite {
            self.numberOfYears = 0.0;
            return self.numberOfYears
        } else {
            self.numberOfYears = years.roundTo2()
            return self.numberOfYears
        }
        
        
    }
    
}
