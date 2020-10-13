//
//  File.swift
//  TaskMatches
//
//  Created by Ivan Simunovic on 13/10/2020.
//

import Foundation

class ResultCalculator {
    
    //MARK: Methods
    static func calculateRequiredMatchesToDisplayNumbers(highestNumber: Int) -> Int {
        let sticks:[Int] = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6]
        var highestNum = highestNumber
        var matchesNeeded = 0
        var number: Int, temp: Int
        
        repeat {
            number = highestNum
            
            repeat{
                
                temp = number % 10
                matchesNeeded += sticks[temp]
                number /= 10
                
            }while(number > 0)
            
            highestNum -= 1
            
        } while(highestNum > 0)
        
        return matchesNeeded
    }

    static func calculateHighestNumberPossibleToDisplay(highestNumber: Int, matchesAvailable: Int) -> Int {
        let sticks:[Int] = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6]
        var highestNum = highestNumber
        var matchesNeeded = 0
        var number: Int, temp: Int
        
        while(true){
            repeat {
                
                number = highestNum
                
                repeat{
                    
                    temp = number % 10
                    matchesNeeded += sticks[temp]
                    number /= 10
                    
                }while(number > 0)
                
                if(matchesNeeded <= matchesAvailable) {
                    return highestNum
                }
                
                highestNum -= 1
                
            } while(highestNum > 0)
        }
    }
}
