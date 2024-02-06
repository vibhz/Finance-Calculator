//
//  File.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 2022-07-22.
//

import Foundation
import UIKit

extension UITextField {
    
    /// Checks if the text field is empty
    func checkIfEmpty() -> Bool{
        if self.text!.count > 0 {
            return false
        } else {
            return true
        }
    }
    
}
