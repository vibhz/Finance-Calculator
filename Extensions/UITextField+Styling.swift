//
//  File.swift
//  FinanceCalculator
//
//  Created by Vibhavi Hettiarachchi on 2022-07-22.
//


import Foundation
import UIKit

extension UITextField {

    /// Adds a box border with a particular border width
    func styleTextField() {
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 5.0
    }
    
    /// Clears text fields
    func clearField() {
        self.text = ""
    }
    
    func greyedTextField() {
        self.backgroundColor = UIColor.lightGray
    }
    
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 5, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
}
