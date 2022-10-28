//
//  NumberSelectVC.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//

import Foundation
import UIKit

class NumberSelectVC: UIViewController {
//    let minValue = 1
//    let maxValue = 99
//    lazy var valuesRange = minValue...maxValue
    
    let enterNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter The Number", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Avenir-Book", size: 23.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(segueToNextVC), for: .touchUpInside)
        return button
    }()
    
    let textField: UITextField = {
        let numberTextField = UITextField()
        numberTextField.placeholder = "Guess the number"
        numberTextField.textAlignment = .center
        numberTextField.borderStyle = .roundedRect
        numberTextField.keyboardType = .numberPad
        numberTextField.font = UIFont(name: "Avenir-Book", size: 18.0)
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        return numberTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        enterNumberButton.isEnabled = false
        textField.delegate = self
    }
    
    @objc func segueToNextVC() {
        if textField.text?.isEmpty != true {
            performSegue(withIdentifier: "passNumber", sender: AnyObject.self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passNumber",
           let dvc = segue.destination as? ComputerChoiseVC {
            dvc.hiddenNumber = Int(textField.text ?? "100") ?? 100
        }
    }
}
extension NumberSelectVC: UITextFieldDelegate {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true)
    }
    
    //Ограничение по вводу
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard !string.isEmpty else {
            return true
        }
        if textField.keyboardType == .numberPad {
            if CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАБВГ ДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя").isSuperset(of: CharacterSet(charactersIn: string)) {
                showAlert(message: "Используйте только цифры!")
                return false
            }
        }
        if let text = textField.text, let range = Range(range, in: text) {
            let proposedText = text.replacingCharacters(in: range, with: string)
            guard proposedText.count <= 2 else {
                if string.count > 1 {
                    showAlert(message: "Значение привышено!")
                }
                return false
            }
            enterNumberButton.isEnabled = (proposedText.count <= 3)
        }
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
