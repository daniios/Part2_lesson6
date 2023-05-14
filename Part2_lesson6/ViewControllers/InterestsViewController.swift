//
//  InterestsViewController.swift
//  Part2_lesson6
//
//  Created by Даниил Чупин on 14.05.2023.
//

import UIKit

final class InterestsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var skillsStack: UIStackView!
    @IBOutlet weak var portfolioStack: UIStackView!
    @IBOutlet weak var interestsStack: UIStackView!
    
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
            // Отображение списка навыков
            for (index, skill) in user.skills.enumerated() {
                let lineNumber = index + 1
                let skillLabel = UILabel()
                skillLabel.numberOfLines = 0
                skillLabel.lineBreakMode = .byWordWrapping
                skillLabel.text = "\(lineNumber). \(skill)"
                skillsStack.addArrangedSubview(skillLabel)
            }
            
            // Отображение списка интересов
            for (index, interest) in user.interests.enumerated() {
                let lineNumber = index + 1
                let interestLabel = UILabel()
                interestLabel.numberOfLines = 0
                interestLabel.lineBreakMode = .byWordWrapping
                interestLabel.text = "\(lineNumber). \(interest)"
                interestsStack.addArrangedSubview(interestLabel)
            }
            
            let portfolioLabel = UILabel()
            portfolioLabel.numberOfLines = 0
            portfolioLabel.lineBreakMode = .byCharWrapping
            portfolioLabel.text = user.portfolio
            portfolioStack.addArrangedSubview(portfolioLabel)
        }
    }
}
