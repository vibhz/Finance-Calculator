//
//  File.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 2022-07-22.
//


import Foundation
import UIKit

extension UIButton {
    
    ///Styling custom keyboard buttons
    func styleKeyboardButtons() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = tintColor.cgColor
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
    }
    
}
