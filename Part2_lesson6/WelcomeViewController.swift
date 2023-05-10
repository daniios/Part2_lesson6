//
//  WelcomeViewController.swift
//  Part2_lesson6
//
//  Created by Даниил Чупин on 10.05.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    var welcomeMessage: String!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessageLabel.text = welcomeMessage
        
        setupGradientBackground()
    }
    
    // MARK: - Actions
    
    @IBAction func logoutButtonTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
                gradientLayer.frame = view.bounds
                gradientLayer.colors = [UIColor.green.cgColor,
                                        UIColor.yellow.cgColor]
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
                view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
