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
    
    static func solution1032() {
        func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
            var chars = Array(myString)
            chars[index] = newChar
            let modifiedString = String(chars)
            return modifiedString
        }
        
        var fileNames: [String] = []
        let numberOfFileNamesReadBuffer = readLine()!
        if let numberOfFileNames = Int(numberOfFileNamesReadBuffer), numberOfFileNames > 0 {
            for _ in 0..<numberOfFileNames {
                let fileNameReadBuffer = readLine()
                if let fileName = fileNameReadBuffer {
                    fileNames.append(fileName)
                }
            }
            
            let maxFileNameLen = fileNames[0].count
            var result = String(repeating: "?", count: maxFileNameLen)
            let baseFileName = fileNames[0]
            
            for charIdx in 0..<maxFileNameLen {
                var isCharacterEqual: Bool = true
                let baseCharacter = baseFileName[baseFileName.index(baseFileName.startIndex, offsetBy: charIdx)]
                for fileIdx in 1..<fileNames.count {
                    let comparedFileName = fileNames[fileIdx]
                    let comparedCharacter = comparedFileName[comparedFileName.index(comparedFileName.startIndex, offsetBy: charIdx)]
                    if baseCharacter != comparedCharacter {
                        isCharacterEqual = false
                        break
                    }
                }
                
                if isCharacterEqual {
                    result = replace(myString: result, charIdx, baseCharacter)
                }
            }
            
            print(result)
        }
    }
    
    static func solution1075() {
        let dividendReadBuffer = readLine()!
        let dividerReadBuffer = readLine()!
        var minimumDividend = 0
        
        if let dividend = Int(dividendReadBuffer), let divider = Int(dividerReadBuffer) {
            let baseDividend = (dividend / 100) * 100
            let quotient = baseDividend / divider
            let remainder = baseDividend % divider
            
            if remainder == 0 {
                minimumDividend = baseDividend
            } else {
                minimumDividend = (quotient * divider) + divider
            }
        }
        
        let result = String(format: "%02d", (minimumDividend % 100))
        print(result)
    }
    
    static func solution1076() {
        let registerSet: [String: (Int, Int)] = [
            "black": (0, 1),
            "brown": (1, 10),
            "red": (2, 100),
            "orange": (3, 1000),
            "yellow": (4, 10000),
            "green": (5, 100000),
            "blue": (6, 1000000),
            "violet": (7, 10000000),
            "grey": (8, 100000000),
            "white": (9, 1000000000),
        ]
        
        let firstColorReadBuffer = readLine()
        let secondColorReadBuffer = readLine()
        let thirdColorReadBuffer = readLine()
        
        if let firstColor = firstColorReadBuffer,
           let secondColor = secondColorReadBuffer,
           let thirdColor = thirdColorReadBuffer {
            if let firstValue = registerSet[firstColor]?.0, let secondValue = registerSet[secondColor]?.0, let thirdValue = registerSet[thirdColor]?.1 {
                let registerValue = (10 * firstValue + secondValue) * thirdValue
                print(registerValue)
            }
        }
    }
    
    static func solution1085() {
        let coordReadBuffer = readLine()!.components(separatedBy: " ").map({ Int($0) })
        if let curX = coordReadBuffer[0],
           let curY = coordReadBuffer[1],
           let rectWidth = coordReadBuffer[2],
           let rectHeight = coordReadBuffer[3] {
            let result = min(min(curX, rectWidth - curX), min(curY, rectHeight - curY))
            print(result)
        }
    }
    
    static func solution1100() {
        let numOfRanks = 8
        let numOfFiles = 8
        
        var numOfPiecesInWhiteSquare = 0
        
        for rankIdx in 0..<numOfRanks {
            let rankReadBuffer = readLine()
            if let rank = rankReadBuffer {
                for fileIdx in 0..<numOfFiles {
                    if (rankIdx + fileIdx) % 2 == 0 {
                        if rank[rank.index(rank.startIndex, offsetBy: fileIdx)] == "F" {
                            numOfPiecesInWhiteSquare += 1
                        }
                    }
                }
            }
        }
        
        print(numOfPiecesInWhiteSquare)
    }
    
    static func solution1110() {
        func getNextCycleNumber(number: Int) -> Int {
            let tensDigit = number / 10
            let unitsDigit = number % 10
            let intermediateStageNumber = tensDigit + unitsDigit
            let nextCycleNumber = (unitsDigit * 10) + (intermediateStageNumber % 10)
            return nextCycleNumber
        }
        
        let numberReadBuffer = readLine()!
        var numOfCycle = 0
        if let initialCycleNumber = Int(numberReadBuffer) {
            var cycleNumber = initialCycleNumber
            while true {
                numOfCycle += 1
                let nextCycleNumber = getNextCycleNumber(number: cycleNumber)
                if initialCycleNumber == nextCycleNumber {
                    break
                }
                
                cycleNumber = nextCycleNumber
            }
        }
        
        print(numOfCycle)
    }
    
    static func solution1145() {
        var numbers: [Int] = []
        let numbersReadBuffer = readLine()!.components(separatedBy: " ").map({ Int($0) })
        for idx in 0..<5 {
            if let number = numbersReadBuffer[idx] {
                numbers.append(number)
            }
        }
        
        var minDividend = 1
        while true {
            var countOfZeroRemainer = 0
            for idx in 0..<5 {
                if minDividend % numbers[idx] == 0 {
                    countOfZeroRemainer += 1
                }
            }
            
            if countOfZeroRemainer >= 3 {
                break
            }
            
            minDividend += 1
        }
        
        print(minDividend)
    }
    
    static func solution1152() {
        let wordsReadBuffer = readLine()!.components(separatedBy: .whitespaces)
        let trimmedWords = wordsReadBuffer.filter { $0 != "" }
        print(trimmedWords.count)
    }
    
    static func solution1157() {
        var characterCountDictionary: [String: Int] = [:]
        let wordReadBuffer = readLine()
        if let word = wordReadBuffer {
            let lowerWorld = word.lowercased()
            for char in lowerWorld {
                if characterCountDictionary.keys.contains(String(char)) {
                    characterCountDictionary[String(char)]! += 1
                } else {
                    characterCountDictionary[String(char)] = 0
                }
            }
            
            let sortedDictionary = characterCountDictionary.sorted(by: { $0.1 > $1.1 })
            if sortedDictionary.count == 1 {
                print(String(sortedDictionary[0].key).uppercased())
            } else if sortedDictionary.count > 1 {
                if sortedDictionary[0].value > sortedDictionary[1].value {
                    print(String(sortedDictionary[0].key).uppercased())
                } else {
                    print("?")
                }
            }
        }
    }
    
    static func solution1159() {
        let numOfAlphabet = 26
        var playerNames: [String] = []
        var alphabetCount = Array(repeating: 0, count: numOfAlphabet)
        let numberOfPlayerNamesReadBuffer = readLine()!
        if let numberOfPlayerNames = Int(numberOfPlayerNamesReadBuffer) {
            for _ in 0..<numberOfPlayerNames {
                if let playerName = readLine() {
                    playerNames.append(playerName)
                }
            }
            
            for idx in 0..<numberOfPlayerNames {
                let firstCharacter = playerNames[idx][playerNames[idx].startIndex]
                let index = Int(firstCharacter.asciiValue! - Character("a").asciiValue!)
                alphabetCount[index] += 1
            }
            
            var result = ""
            let startingValue = Int(("a" as UnicodeScalar).value)
            for idx in 0..<numOfAlphabet {
                if alphabetCount[idx] >= 5 {
                    result += String(Character(UnicodeScalar(idx + startingValue)!))
                }
            }
            
            if result.isEmpty {
                print("PREDAJA")
            } else {
                print(result)
            }
        }
    }
}
