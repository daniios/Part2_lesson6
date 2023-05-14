//
//  ProfileViewController.swift
//  Part2_lesson6
//
//  Created by Даниил Чупин on 14.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var user: User?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        if let userData = userDefaults.data(forKey: "userKey"),
           let user = User.fromData(userData) {
            self.user = user
        }
        
        if let user = user {
            nameLabel.text = "Имя: \(user.name)"
            ageLabel.text = "Возраст: \(user.age)"
            emailLabel.text = "E-mail: \(user.email)"
            addressLabel.text = "Адрес: \(user.address)"
            phoneNumberLabel.text = "Телефон: \(user.phoneNumber)"
        }
    }
}
