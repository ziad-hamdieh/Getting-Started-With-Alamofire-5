//
//  UIViewControllerExtension.swift
//  Getting Started With Alamofire 5
//
//  Created by Ziad Hamdieh on 2020-04-23.
//  Copyright © 2020 TN. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String) {
        let textNowThemeColor = UIColor.init(red: 160/255, green: 44/255, blue: 222/255, alpha: 1.0)
        
        let alert = UIAlertController(title: title, message: "\n \(message)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        action.setValue(textNowThemeColor, forKey: "titleTextColor")
        alert.addAction(action)
        present(alert, animated: true)
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
