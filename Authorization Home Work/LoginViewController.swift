//
//  ViewController.swift
//  Authorization Home Work
//
//  Created by Анатолий Сидин on 10.05.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var UserLoginTF: UITextField!
    @IBOutlet var PasswordTF: UITextField!
    
    @IBOutlet var ForgotUserNameButton: UIButton!
    @IBOutlet var ForgotPasswordButton: UIButton!
    
    var userName = "User"
    var userPassword = "Password"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PasswordTF.isSecureTextEntry = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super .touchesBegan(touches, with: event)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard UserLoginTF.text == userName, PasswordTF.text == userPassword else {
            showAlert(withTitle: "Invalid login for password", andMassage: "Please, enter correct login and password")
            PasswordTF.text = ""
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let successfulAuthorizationVC = segue.destination as? WelcomeViewController else { return }
        successfulAuthorizationVC.welcomeLabelUser = UserLoginTF.text
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        switch sender {
        case ForgotUserNameButton:
            showAlert(withTitle: "Oops!", andMassage: "Your name is User")
        case ForgotPasswordButton:
            showAlert(withTitle: "Oops!", andMassage: "Your password is Password")
        default:
            break
        }
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        UserLoginTF.text = ""
        PasswordTF.text = ""
    }
    
    
}

extension LoginViewController {
    private func showAlert(withTitle title: String, andMassage massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in self.PasswordTF.text = ""}
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
