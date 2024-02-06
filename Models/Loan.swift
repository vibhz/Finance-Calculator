//
//  Loan.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 22/07/2022.
//  Copyright © 2022 Vibhavi Hettiarachchi. All rights reserved.
//


import Foundation

class Loan {
    
    var totalLoan: Double
    var interestAmount : Double
    var totalPayment : Double
    var numberOfPayments : Int
    var history : [String]
    
    init(loanAmount: Double, interest: Double, payment: Double, numberOfPayments: Int) {
        self.totalLoan = loanAmount
        self.interestAmount = interest
        self.totalPayment = payment
        self.numberOfPayments = numberOfPayments
        self.history = [String]()
    }
    
    func numberOfPaymentsCalculation() -> Int {
        let MIR = self.interestAmount / (12 * 100)
        let months = log((self.totalPayment / MIR) / ((self.totalPayment / MIR) - (self.totalLoan))) / log(1 + MIR)
        
        if months < 0 || months.isNaN || months.isInfinite {
            self.numberOfPayments = 0;
            return self.numberOfPayments
        } else {
            self.numberOfPayments = Int(months)
            return self.numberOfPayments
        }
        
        
    }
    func monthlyPaymentCalculation() -> Double {
        let MIR = self.interestAmount / (12 * 100)
        let monthlyPayment = (self.totalLoan * MIR) / (1 - (pow((1 + MIR), Double(numberOfPayments) * -1)))
        
        if monthlyPayment < 0 || monthlyPayment.isNaN || monthlyPayment.isInfinite {
            self.totalPayment = 0.0;
            return self.totalPayment
        } else {
            self.totalPayment = monthlyPayment.roundTo2()
            return self.totalPayment
        }
    }
    
  
    func loanAmountCalculation() -> Double {
        let MIR = self.interestAmount / (12 * 100)
        let loanCalculation = (self.totalPayment * (pow((1 + MIR), Double(numberOfPayments)) - 1)) / (MIR * pow((1 + MIR), Double(numberOfPayments)))
        
        if loanCalculation < 0 || loanCalculation.isNaN || loanCalculation.isInfinite {
            self.totalLoan = 0.0;
            return self.totalLoan
        } else {
            self.totalLoan = loanCalculation.roundTo2()
            return self.totalLoan
        }
    }
    

    func AIR_Calculation() -> Double {
        let months = Double(self.numberOfPayments)
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
