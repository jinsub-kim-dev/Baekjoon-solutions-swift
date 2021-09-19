//
//  Bronze.swift
//  BaekjoonSolutions
//
//  Created by Jinsub on 2021/09/19.
//

import Foundation

class Bronze {
    static func solution1000() {
        let readBuffer = readLine()!.components(separatedBy: " ").map({ Int($0) })
        if let number1 = readBuffer[0], let number2 = readBuffer[1] {
            print(number1 + number2)
        }
    }
    
    static func solution1001() {
        let readBuffer = readLine()!.components(separatedBy: " ").map({ Int($0) })
        if let number1 = readBuffer[0], let number2 = readBuffer[1] {
            print(number1 - number2)
        }
    }
    
    static func solution1008() {
        let readBuffer = readLine()!.components(separatedBy: " ").map({ Int($0) })
        if let number1 = readBuffer[0], let number2 = readBuffer[1] {
            print(Double(number1) / Double(number2))
        }
    }
    
    static func solution1009() {
        func fastModular(base: Int, exponent: Int, mod: Int) -> Int {
            var _base = base
            var _exponent = exponent
            var result = 1
            while _exponent > 0 {
                if _exponent & 1 == 1 {
                    result = (result * _base) % mod
                }
                _exponent = _exponent / 2
                _base = (_base * _base) % mod
            }
            return result
        }
        
        var testSet: [(Int, Int)] = []
        let numberOfTestReadBuffer = readLine()!
        if let numberOfTest = Int(numberOfTestReadBuffer), numberOfTest > 0 {
            for _ in 0..<numberOfTest {
                let testSetReadBuffer = readLine()!.components(separatedBy: " ").map({ Int($0) })
                if let base = testSetReadBuffer[0], let exponent = testSetReadBuffer[1] {
                    testSet.append((base, exponent))
                }
            }
            
            for test in testSet {
                var answer = fastModular(base: test.0, exponent: test.1, mod: 10)
                answer = answer == 0 ? 10 : answer
                print(answer)
            }
        }
    }
}
