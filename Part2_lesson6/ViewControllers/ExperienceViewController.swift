//
//  ExperienceViewController.swift
//  Part2_lesson6
//
//  Created by Даниил Чупин on 14.05.2023.
//

import UIKit

class ExperienceViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var workExperienceStack: UIStackView!
    @IBOutlet weak var educationStack: UIStackView!
    @IBOutlet weak var certificateStack: UIStackView!
    
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
            let workExperienceLabel = UILabel()
            workExperienceLabel.numberOfLines = 0
            workExperienceLabel.lineBreakMode = .byWordWrapping
            workExperienceLabel.text = user.workExperience
            workExperienceStack.addArrangedSubview(workExperienceLabel)
            
            let educationLabel = UILabel()
            educationLabel.numberOfLines = 0
            educationLabel.lineBreakMode = .byWordWrapping
            educationLabel.text = user.education
            educationStack.addArrangedSubview(educationLabel)
            
            // Отображение списка сертификатов
            for (index, certificate) in user.certificates.enumerated() {
                let lineNumber = index + 1
                let certificateLabel = UILabel()
                certificateLabel.numberOfLines = 0
                certificateLabel.lineBreakMode = .byWordWrapping
                certificateLabel.text = "\(lineNumber). \(certificate)"
                certificateStack.addArrangedSubview(certificateLabel)
            }
        }
    }
}
