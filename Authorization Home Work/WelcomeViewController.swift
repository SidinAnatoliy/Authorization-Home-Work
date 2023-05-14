//
//  SuccessfulAuthorizationViewController.swift
//  Authorization Home Work
//
//  Created by Анатолий Сидин on 10.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var WelcomeLabel: UILabel!
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WelcomeLabel.text = " Welcome, \(user)!"
    }
    
    @IBAction func LogOutButtonTapped() {
        dismiss(animated: true)
    }
    
}
