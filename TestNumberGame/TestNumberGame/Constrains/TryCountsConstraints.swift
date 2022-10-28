//
//  TryCountsConstraints.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit

extension TryCountsVC {
    
    func setupConstraints() {
       view.addSubview(scoresLabel)
       view.addSubview(humansTriesCountLabel)
       view.addSubview(compTriesCountLabel)
       view.addSubview(winnerLabel)
       view.addSubview(backButton)
       
        NSLayoutConstraint.activate([
            scoresLabel.widthAnchor.constraint(equalToConstant: 100),
            scoresLabel.heightAnchor.constraint(equalToConstant: 28),
            scoresLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            scoresLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            humansTriesCountLabel.widthAnchor.constraint(equalToConstant: 210),
            humansTriesCountLabel.heightAnchor.constraint(equalToConstant: 28),
            humansTriesCountLabel.topAnchor.constraint(equalTo: scoresLabel.topAnchor, constant: 50),
            humansTriesCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            compTriesCountLabel.widthAnchor.constraint(equalToConstant: 210),
            compTriesCountLabel.heightAnchor.constraint(equalToConstant: 28),
            compTriesCountLabel.topAnchor.constraint(equalTo: scoresLabel.topAnchor, constant: 80),
            compTriesCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            winnerLabel.widthAnchor.constraint(equalToConstant: 170),
            winnerLabel.heightAnchor.constraint(equalToConstant: 28),
            winnerLabel.bottomAnchor.constraint(equalTo: backButton.bottomAnchor, constant: -100),
            winnerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        

        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 350),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
   }
}
