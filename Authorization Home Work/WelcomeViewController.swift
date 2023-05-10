//
//  SuccessfulAuthorizationViewController.swift
//  Authorization Home Work
//
//  Created by Анатолий Сидин on 10.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var WelcomeLabel: UILabel!
    var welcomeLabelUser: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel.text = welcomeLabelUser
        WelcomeLabel.text = " Welcome, \(welcomeLabelUser ?? "")!"
    }
    
    @IBAction func LogOutButtonTapped() {
        dismiss(animated: true)
    }
    
}
