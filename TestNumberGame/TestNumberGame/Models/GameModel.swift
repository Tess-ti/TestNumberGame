//
//  GameModel.swift
//  TestNumberGame
//
//  Created by Виталий Ковылин on 28.10.2022.
//
//прописываю логику игры
import Foundation

struct GameModel {
    
    var secretNumber: Int
    var guesses: Int
    var lastNumber = ""
    
    var minimum = 0
    var maximum = 99
    
    mutating func more() -> Int? {
        
        while minimum != maximum {
            var mid = (minimum + maximum) / 2
            
            if secretNumber > mid {
                self.guesses += 1
                minimum = mid + 1
                mid = (minimum + maximum) / 2
                lastNumber = "Your number is \(mid)?"
            } else {
                print("error")
            }
            return mid
        }
        return nil
    }
    
    mutating func less() -> Int? {
        
        while minimum != maximum {
            var mid = (minimum + maximum) / 2
            
            if secretNumber < mid {
                self.guesses += 1
                maximum = mid - 1
                mid = (minimum + maximum) / 2
                lastNumber = "Your number is \(mid)?"
            }
            return mid
        }
        return nil
    }
}

