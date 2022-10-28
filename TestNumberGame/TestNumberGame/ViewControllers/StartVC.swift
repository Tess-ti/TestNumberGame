//
//  StartVC.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit

class StartVC: UIViewController {
    
    let button: UIButton = {
        let startButton = UIButton()
        startButton.backgroundColor = .blue
        startButton.setTitle("Start New Game", for: .normal)
        startButton.layer.cornerRadius = 15
        startButton.titleLabel?.font = UIFont(name: "Avenir-Book ", size: 20.0)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.addTarget(self, action: #selector(segueToNextVC), for: .touchUpInside)
        return startButton
    }()
    
    let label: UILabel = {
        let startLabel = UILabel()
        startLabel.text = "My Awesome Game"
        startLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 23.0)
        startLabel.textColor = .black
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        return startLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    @objc func segueToNextVC() {
        performSegue(withIdentifier: "startGame", sender: nil)
    }
}
