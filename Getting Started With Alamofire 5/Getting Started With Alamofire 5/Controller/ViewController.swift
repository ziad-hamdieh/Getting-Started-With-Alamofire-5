//
//  ViewController.swift
//  Getting Started With Alamofire 5
//
//  Created by Ziad Hamdieh on 2020-04-22.
//  Copyright © 2020 TN. All rights reserved.
//

import Alamofire
import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var ageTextField: UITextField!
    @IBOutlet private var spinner: UIActivityIndicatorView!

    // MARK: - IBActions

    /// Gets called when the user taps on the GET button. Performs a GET request to the server.
    @IBAction private func GETButtonTapped(_ sender: Any) {
        spinner.startAnimating()
        
        guard let name = nameTextField.text, let age = Int(ageTextField.text ?? "") else { return }

        let userStruct = User(name: name, age: age)
        
        // Create request
        let request = AF.request(
            Endpoint.GET.url(),
            method: Endpoint.GET.httpMethod,
            parameters: userStruct,
            encoder: URLEncodedFormParameterEncoder.default)
        
        // Interpret response
        request.responseDecodable(of: ExpectedResponse.self) { response in
            self.spinner.stopAnimating()

            switch response.result {
            case let .success(result):
                self.presentAlert(title: "🎉 Success! 🎉", message: "Retrieved JSON: \n\n { name=\(result.name), age=\(result.age) }")
            case let .failure(error):
                self.presentAlert(title: "🤦🏻‍♂️ Error 🤦🏻‍♂️", message: error.localizedDescription)
            }
        }
    }

    /// Gets called when the user taps on the POST button. Performs a POST request to the server.
    @IBAction func POSTButtonTapped(_ sender: Any) {
        spinner.startAnimating()
        
        guard let name = nameTextField.text, let age = Int(ageTextField.text ?? "") else { return }
        
        let userStruct = User(name: name, age: age)

        // Create request
        let request = AF.request(
            Endpoint.POST.url(),
            method: Endpoint.POST.httpMethod,
            parameters: userStruct,
            encoder: JSONParameterEncoder.default)

        // Interpret response
        request.response { response in
            self.spinner.stopAnimating()

            switch response.result {
            case .success:
                let statusCode = response.response?.statusCode ?? -1
                self.presentAlert(title: "🎉 Success! 🎉", message: "Status Code: \(statusCode)")
            case let .failure(error):
                self.presentAlert(title: "🤦🏻‍♂️ Error 🤦🏻‍♂️", message: error.localizedDescription)
            }
        }
    }
}


// Placing life cycle in an extension because its implementation is not the main focus here
extension ViewController {
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
}
