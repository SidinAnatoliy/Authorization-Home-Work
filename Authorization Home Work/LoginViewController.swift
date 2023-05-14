//
//  ViewController.swift
//  Authorization Home Work
//
//  Created by Анатолий Сидин on 10.05.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userLoginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private var userName = "User"
    private var userPassword = "Password"
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userLoginTF.text == userName, passwordTF.text == userPassword else {
            showAlert(
                title: "Invalid login for password",
                massage: "Please, enter correct login and password",
                textField: passwordTF
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.user = userName
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", massage: "Your name is \(userName) 😉")
            : showAlert(title: "Oops!", massage: "Your password is \(userPassword) 😉")
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userLoginTF.text = ""
        passwordTF.text = ""
    }
    
    private func showAlert(title: String, massage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
