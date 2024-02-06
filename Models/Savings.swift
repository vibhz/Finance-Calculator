//
//  Savings.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 22/07/2022.
//  Copyright © 2022 Vibhavi Hettiarachchi. All rights reserved.
//

import Foundation

class Savings {
    
    var principalAmount: Double
    var interestAmount : Double
    var totalPayment : Double
    var paymentsPerYear : Int

    var compoundsPerYear : Int
    var futureValue : Double
    var numberOfPayments: Int
    var history : [String]
    
    
    init(principalAmount: Double, interest: Double, payment: Double, compoundsPerYear: Int, paymentsPerYear: Int, futureValue: Double, totalNumberOfPayments: Int) {
        self.principalAmount = principalAmount
        self.interestAmount = interest
        self.totalPayment = payment
        self.compoundsPerYear = compoundsPerYear
        self.paymentsPerYear = paymentsPerYear
        self.futureValue = futureValue
        self.numberOfPayments = totalNumberOfPayments
        self.history = [String]()
    }
    
    
    func endPrincipalAmountCalculation() -> Double {
        let interestInDecimal = self.interestAmount/100
        let numberOfYears = Double(self.numberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
    
        let endprincipalAmountCalc = (self.futureValue - (self.totalPayment * ((pow((1 + interestInDecimal/compounds), (compounds*numberOfYears)) - 1) / (interestInDecimal/compounds)))) / (pow(1+(interestInDecimal/compounds), (compounds*numberOfYears)))
        
        if endprincipalAmountCalc < 0 || endprincipalAmountCalc.isNaN || endprincipalAmountCalc.isInfinite {
            self.principalAmount = 0;
            return self.principalAmount
        } else {
            self.principalAmount = endprincipalAmountCalc.roundTo2()
            return self.principalAmount
        }
        
    }
    
  
    func beginningPrincipalAmountCalculation() -> Double {
        let interestInDecimal = self.interestAmount/100
        let numberOfYears = Double(self.numberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        
        let begprincipalAmountCalc = (self.futureValue - (self.totalPayment * ((pow((1 + interestInDecimal/compounds), (compounds*numberOfYears)) - 1) / (interestInDecimal/compounds)) * (1 + (interestInDecimal/compounds)))) / (pow(1+(interestInDecimal/compounds), (compounds*numberOfYears)))
        
        if begprincipalAmountCalc < 0 || begprincipalAmountCalc.isNaN || begprincipalAmountCalc.isInfinite {
            self.principalAmount = 0;
            return self.principalAmount
        } else {
            self.principalAmount = begprincipalAmountCalc.roundTo2()
            return self.principalAmount
        }
        
    }
    
   
    func endPaymentCalculation() -> Double {
        let interestInDecimal = self.interestAmount/100
        let numberOfYears = Double(self.numberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        
        let endPayment = (self.futureValue - (self.principalAmount * (pow(1+(interestInDecimal/compounds), (compounds*numberOfYears))))) / ((pow((1 + interestInDecimal/compounds), (compounds*numberOfYears)) - 1) / (interestInDecimal/compounds))
        
        if endPayment < 0 || endPayment.isNaN || endPayment.isInfinite {
            self.totalPayment = 0;
            return self.totalPayment
        } else {
            self.totalPayment = endPayment.roundTo2()
            return self.totalPayment
        }
    }
    
  
    func calculateBeginningPayment() -> Double {
        let interestInDecimal = self.interestAmount/100
        let numberOfYears = Double(self.numberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        
        let begPayment = (self.futureValue - (self.principalAmount * (pow(1+(interestInDecimal/compounds), (compounds*numberOfYears))))) / (((pow((1 + interestInDecimal/compounds), (compounds*numberOfYears)) - 1) / (interestInDecimal/compounds)) * (1 + (interestInDecimal/compounds)))
        
        if begPayment < 0 || begPayment.isNaN || begPayment.isInfinite {
            self.totalPayment = 0;
            return self.totalPayment
        } else {
            self.totalPayment = begPayment.roundTo2()
            return self.totalPayment
        }
    }
 
    func endFutureValueCalculation() -> Double {
        let interestInDecimal = self.interestAmount/100
        let numberOfYears = Double(self.numberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        
        let endFV = (self.principalAmount * (pow(1+(interestInDecimal/compounds), (compounds*numberOfYears)))) + (self.totalPayment * ((pow((1 + interestInDecimal/compounds), (compounds*numberOfYears)) - 1) / (interestInDecimal/compounds)))
        
        if endFV < 0 || endFV.isNaN || endFV.isInfinite {
            self.futureValue = 0;
            return self.futureValue
        } else {
            self.futureValue = endFV.roundTo2()
            return self.futureValue
        }
    }
    
 
    func beginningFutureValueCalculation() -> Double {
        let interestInDecimal = self.interestAmount/100
        let numberOfYears = Double(self.numberOfPayments)/12
        let compounds = Double(self.compoundsPerYear)
        
        let begFV = (self.principalAmount * (pow(1+(interestInDecimal/compounds), (compounds*numberOfYears)))) + (self.totalPayment * ((pow((1 + interestInDecimal/compounds), (compounds*numberOfYears)) - 1) / (interestInDecimal/compounds)) * (1 + (interestInDecimal/compounds)))
        
        if begFV < 0 || begFV.isNaN || begFV.isInfinite {
            self.futureValue = 0;
            return self.futureValue
        } else {
            self.futureValue = begFV.roundTo2()
            return self.futureValue
        }
        
    }
    
  
    func endNumberOfPaymentCalculation() -> Int {
        let interestInDecimal = self.interestAmount/100
        let compounds = Double(self.compoundsPerYear)
        
        let numberOfyears = (log(self.futureValue + ((self.totalPayment*compounds)/interestInDecimal)) - log(((interestInDecimal*self.principalAmount) + (self.totalPayment*compounds)) / interestInDecimal)) / (compounds * log(1+(interestInDecimal/compounds)))
        let numberOfPayments = numberOfyears * 12
        
        if numberOfPayments < 0 || numberOfPayments.isNaN || numberOfPayments.isInfinite {
            self.numberOfPayments = 0;
            return self.numberOfPayments
        } else {
            self.numberOfPayments = Int(numberOfPayments.roundTo2())
            return self.numberOfPayments
        }
    }
    

    func beginningNumberOfPaymentCalculation() -> Int {
        let interestInDecimal = self.interestAmount/100
        let compounds = Double(self.compoundsPerYear)
        
        let numberOfyears = ((log(self.futureValue + self.totalPayment + ((self.totalPayment * compounds) / interestInDecimal)) - log(self.principalAmount + self.totalPayment + ((self.totalPayment * compounds) / interestInDecimal))) / (compounds * log(1 + (interestInDecimal / compounds))))
        let numberOfPayments = numberOfyears * 12
        
        if numberOfPayments < 0 || numberOfPayments.isNaN || numberOfPayments.isInfinite {
            self.numberOfPayments = 0;
            return self.numberOfPayments
        } else {
            self.numberOfPayments = Int(numberOfPayments.roundTo2())
            return self.numberOfPayments
        }
    }
   
    func interestCalculation() -> Double{
        let numberOfYears = Double(self.numberOfPayments)/12
        let IR = Double(self.compoundsPerYear) * (pow((self.futureValue / self.principalAmount), (1 / (Double(self.compoundsPerYear) * numberOfYears))) - 1)
        
        if IR < 0 || IR.isNaN || IR.isInfinite {
            self.interestAmount = 0.0;
            return self.interestAmount
        } else {
            let AIR = IR * 100
            self.interestAmount = AIR.roundTo2()
            return self.interestAmount
        }
    }
    
    
}
