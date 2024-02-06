//
//  File.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 2022-07-22.
//

import Foundation
import UIKit

extension UIViewController {
    
   
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    /// Closes the popup keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
