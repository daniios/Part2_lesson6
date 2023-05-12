//
//  ViewController.swift
//  Part2_lesson6
//
//  Created by Даниил Чупин on 10.05.2023.
//  Modified by Даниил Чупин on 12.05.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    private let validUsername = "admin"
    private let validPassword = "password"
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureKeyboardSettings()
        loginButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let welcomeVC = segue.destination as? WelcomeViewController
            else { return }
            welcomeVC.welcomeMessage = validUsername
    }
    
    // MARK: - Actions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        if isValidCredentials(username: username, password: password) {
            performSegue(withIdentifier: "WelcomeScreenSegue", sender: nil)
        } else {
            showAlert(title: "Ошибка",
                      message: "Неверные учетные данные",
                      textField: passwordTextField
            )
        }
    }
    
    @IBAction func userInfoButtonTapped(_ sender: UIButton) {
        showAlert(title: "Пользователь:", message: "admin")
    }
    
    @IBAction func pswdInfoButtonTapped(_ sender: UIButton) {
        showAlert(title: "Пароль:", message: "password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }

    // MARK: - Helper Methods
    
    private func isValidCredentials(username: String,
                                    password: String) -> Bool {
        username == validUsername && password == validPassword
    }
    
    private func showAlert(title: String,
                           message: String,
                           textField: UITextField? = nil) {
        let alertController = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        textField?.text = ""
    }
    
    private func configureKeyboardSettings() {
        usernameTextField.autocorrectionType = .no
        usernameTextField.smartQuotesType = .no
        usernameTextField.smartDashesType = .no
        usernameTextField.smartInsertDeleteType = .no

        passwordTextField.isSecureTextEntry = true
    }
}
