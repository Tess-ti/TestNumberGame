//
//  HumanChoiseConstraints.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit

extension HumanChoiseVC {
    
    func setupConstraints() {
        view.addSubview(guessButton)
        view.addSubview(tryLabel)
        view.addSubview(guessingLabel)
        view.addSubview(guessingTextField)
        view.addSubview(infoLabel)
        
        
        NSLayoutConstraint.activate([
            guessButton.widthAnchor.constraint(equalToConstant: 350),
            guessButton.heightAnchor.constraint(equalToConstant: 50),
            guessButton.topAnchor.constraint(equalTo: guessingTextField.topAnchor, constant: 100),
            guessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            tryLabel.widthAnchor.constraint(equalToConstant: 80),
            tryLabel.heightAnchor.constraint(equalToConstant: 30),
            tryLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            tryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            guessingLabel.widthAnchor.constraint(equalToConstant: 180),
            guessingLabel.heightAnchor.constraint(equalToConstant: 30),
            guessingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            guessingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            guessingTextField.widthAnchor.constraint(equalToConstant: 280),
            guessingTextField.heightAnchor.constraint(equalToConstant: 50),
            guessingTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            guessingTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            infoLabel.widthAnchor.constraint(equalToConstant: 3000),
            infoLabel.heightAnchor.constraint(equalToConstant: 60),
            infoLabel.topAnchor.constraint(equalTo: guessButton.topAnchor, constant: 80),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
