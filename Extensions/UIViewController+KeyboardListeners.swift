//
//  File.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 2022-07-22.
//


import Foundation
import UIKit

extension UIViewController {
    
 
    func addKeyboardEventListeners() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification){}
    
}
