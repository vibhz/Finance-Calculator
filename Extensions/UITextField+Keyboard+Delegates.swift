//
//  File.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 2022-07-22.
//

import Foundation
import UIKit

extension UITextField {
    
    func setCustomKeyboard(_ customKeyboard: KeyboardController) {
        self.inputView = customKeyboard
    }
    
    func assignDelegates(_ viewController: UITextFieldDelegate) {
        self.delegate = viewController
    }
}
