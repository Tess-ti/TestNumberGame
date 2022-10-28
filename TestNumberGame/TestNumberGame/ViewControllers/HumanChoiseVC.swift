//
//  HumanChoiseVC.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit

class HumanChoiseVC: UIViewController {
    
    lazy var gameModel = GameModel(secretNumber: compNumber, guesses: humanGuesses)
    
    var humanGuesses = 1
    lazy var compNumber = Int()
    
    let guessButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Guess", for: .normal)
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Avenir-Book ", size: 23.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(guessTapped), for: .touchUpInside)
        return button
    }()
    
    let  tryLabel: UILabel = {
        let label = UILabel()
        label.text = "Try № 1"
        label.font = UIFont(name: "Avenir-Book ", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let  guessingLabel: UILabel = {
        let label = UILabel()
        label.text = "You're guessing"
        label.font = UIFont(name: "Avenir-Book ", size: 23.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let guessingTextField: UITextField = {
        let numberTextField = UITextField()
        numberTextField.placeholder = "Try to guess the number"
        numberTextField.textAlignment = .center
        numberTextField.borderStyle = .roundedRect
        numberTextField.keyboardType = .numberPad
        numberTextField.font = UIFont(name: "Avenir-Book ", size: 23.0)
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        return numberTextField
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Book ", size: 23.0)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessingTextField.delegate = self
        infoLabel.isHidden = true
        setupConstraints()
        randomCompNumber()
    }
    
    @objc func equalNumbers() {
        performSegue(withIdentifier: "triesSegue", sender: AnyObject.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "triesSegue",
           let dvc = segue.destination as? TryCountsVC {
            dvc.humanTries = humanGuesses
        }
    }
}

extension HumanChoiseVC: UITextFieldDelegate {
    
    func randomCompNumber() {
        while compNumber < 1 {
            let randomNumber = Int.random(in: 1..<100)
            compNumber = randomNumber
        }
    }
    
    func compGuessingPlus() {
        tryLabel.text = String("Try № \(humanGuesses)")
    }
    
    @objc func guessTapped() {
        compGuessingPlus()
        if guessingTextField.text == String(compNumber) {
            equalNumbers()
        } else if compNumber < Int(guessingTextField.text ?? "101") ?? 101 {
            humanGuesses += 1
            infoLabel.isHidden = false
            infoLabel.text = "No, my number is less than yours"
        } else {
            humanGuesses += 1
            infoLabel.isHidden = false
            infoLabel.text = "No, my number is more than yours"
        }
    }
        func showAlert(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            self.present(alert, animated: true)
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard !string.isEmpty else {
                return true
            }
            if guessingTextField.keyboardType == .numberPad {
                if CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАБВГ ДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя").isSuperset(of: CharacterSet(charactersIn: string)) {
                    showAlert(message: "Используйте только цифры")
                    return false
                }
            }
            if let text = guessingTextField.text, let range = Range(range, in: text) {
                let proposedText = text.replacingCharacters(in: range, with: string)

                guard proposedText.count <= 2 else {
                    if string.count > 1 {
                        showAlert(message: "Значение привышено!")
                    }
                    return false
                }
                guessButton.isEnabled = (proposedText.count <= 3)
            }
            return true
        }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    }



