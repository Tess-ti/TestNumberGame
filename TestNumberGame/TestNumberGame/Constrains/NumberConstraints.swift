//
//  NumberConstraints.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit

extension NumberSelectVC {
    
    func setupConstraints() {
        view.addSubview(enterNumberButton)
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            enterNumberButton.widthAnchor.constraint(equalToConstant: 350),
            enterNumberButton.heightAnchor.constraint(equalToConstant: 50),
            enterNumberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            enterNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: 300),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
