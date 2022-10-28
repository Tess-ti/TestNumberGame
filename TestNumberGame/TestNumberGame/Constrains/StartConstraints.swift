//
//  StartConstrains.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit
extension StartVC {
    
    func setupConstraints() {
        view.addSubview(label)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

    }
}
