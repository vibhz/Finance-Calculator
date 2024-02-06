//
//  Mortgage.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 22/07/2022.
//  Copyright © 2022 Vibhavi Hettiarachchi. All rights reserved.
//

import Foundation

class Mortgage {
    var totalLoan: Double
    var interestAmount : Double
    var totalPayment : Double
    var numberOfYears : Double
    var history : [String]
    
    init(loanAmount: Double, interest: Double, payment: Double, numberOfYears: Double) {
        self.totalLoan = loanAmount
        self.interestAmount = interest
        self.totalPayment = payment
        self.numberOfYears = numberOfYears
        self.history = [String]()
    }

    
      func monthlyPaymentCalculation() -> Double {
          let MIR = self.interestAmount / (12 * 100)
          let months = 12 * self.numberOfYears
          let monthlyPayment = (self.totalLoan * MIR) / (1 - (pow((1 + MIR), months * -1)))
          
          if monthlyPayment < 0 || monthlyPayment.isNaN || monthlyPayment.isInfinite {
              self.totalPayment = 0.0;
              return self.totalPayment
          } else {
              self.totalPayment = monthlyPayment.roundTo2()
              return self.totalPayment
          }
          
      }
      
   
      func numberOfYearsCalculation() -> Double {
          let MIR = self.interestAmount / (12 * 100)
          let months = log((self.totalPayment / MIR) / ((self.totalPayment / MIR) - (self.totalLoan))) / log(1 + MIR)
          
          if months < 0 || months.isNaN || months.isInfinite {
              self.numberOfYears = 0.0;
              return self.numberOfYears
          } else {
              self.numberOfYears = (months / 12).roundTo2()
              return self.numberOfYears
          }
      }
    
    
    func loanAmountCalculation() -> Double {
        let MIR = self.interestAmount / (12 * 100) //Monthly Interest Rate
        let months = 12 * self.numberOfYears
        let loanCalculation = (self.totalPayment * (pow((1 + MIR), months) - 1)) / (MIR * pow((1 + MIR), months))
        
        if loanCalculation < 0 || loanCalculation.isNaN || loanCalculation.isInfinite {
            self.totalLoan = 0.0;
            return self.totalLoan
        } else {
            self.totalLoan = loanCalculation.roundTo2()
            return self.totalLoan
        }
        
    }
    
    
    
    
//Anual Interest Rate
    func AIR_Calculation() -> Double {
        let months = 12 * self.numberOfYears
        var x = 1 + (((self.totalPayment*months/self.totalLoan) - 1) / 12)
        
        func F(_ x: Double) -> Double {
            let F = self.totalLoan * x * pow(1 + x, months) / (pow(1+x, months) - 1) - self.totalPayment
            return F;
        }
        
        func F_Prime(_ x: Double) -> Double {
            let F_Prime = self.totalLoan * pow(x+1, months-1) * (x * pow(x+1, months) + pow(x+1, months) - (months*x) - x - 1) / pow(pow(x+1, months) - 1, 2)
            return F_Prime
        }
        
        while(abs(F(x)) > Double(0.000001)) {
            x = x - F(x) / F_Prime(x)
        }
        
        let I = Double(12 * x * 100)
        
        if I < 0 || I.isNaN || I.isInfinite {
            self.interestAmount = 0.0;
            return self.interestAmount
        } else {
            self.interestAmount = I.roundTo2()
            return self.interestAmount
        }
    }
    
 
    
  
    
}
