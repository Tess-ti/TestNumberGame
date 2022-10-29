//
//  TryCountsVC.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit

class TryCountsVC: UIViewController {
        
    var compTries = 0
    var humanTries = 0
    
    let scoresLabel: UILabel = {
        let label = UILabel()
        label.text = "Scores:"
        label.font = UIFont(name: "Avenir-Book", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humansTriesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Your tries count:  \(humanTries)"
        label.font = UIFont(name: "Avenir-Book", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var compTriesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Computer's tries count:  \(compTries)"
        label.font = UIFont(name: "Avenir-Book", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let winnerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Book", size: 23.0)
        label.text = "You'r winner"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Main menu", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Avenir-Book", size: 23.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backToMainScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    @objc private func backToMainScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}
