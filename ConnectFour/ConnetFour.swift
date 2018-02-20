//
//  ConnetFour.swift
//  ConnectFour
//
//  Created by YinYifei on 2018-02-18.
//  Copyright © 2018 Yifei Yin. All rights reserved.
//

import Foundation

class ConnectFour : CustomStringConvertible {
    
    let Height = 6
    let numberOfTubes = 7
    
    var description: String {
        get {
            var output = ""
            for altitude in stride(from: Height - 1, through: 0, by: -1) {
                output += "(X,\(altitude)): "
                for tubeIndex in 0..<numberOfTubes {
                    var status = ""
                    let content = board[tubeIndex][altitude]
                    switch content {
                    case .occupied(let player) where player == .A: status = "[A]"
                    case .occupied(let player) where player == .B: status = "[B]"
                    case .empty: status = "[ ]"
                    default: fatalError("Unexpected value in var description.get")
                    }
                    output += "\(status) "
                }
                output += "\n"
            }
            output += "       "
            for tubeIndex in 0..<numberOfTubes {
                output += " \(tubeIndex)  "
            }
            output += "\n"
            return output
        }
    }
    
    enum Players {
        case A
        case B
    }
    
    enum CellState : Equatable {
        case empty
        case occupied (Players)
        
        static func ==(lhs: ConnectFour.CellState, rhs: ConnectFour.CellState) -> Bool {
            switch (lhs, rhs) {
            case (.empty, .empty): return true
            case let (.occupied(a), .occupied(b)): return a == b
            default: return false
            }
        }
    }
    
    enum Status {
        case playerInTurn (Players)
        case someoneWins (Players)
        case ties
    }
    
    

    
    lazy private(set) var board = [[CellState]](repeating: [CellState](repeating: .empty, count: Height), count: numberOfTubes)

    var gameStatus: Status = .playerInTurn(.A)
    
    var isGameEnded: Bool {
        get {
            return gameStatus == .someoneWins(.A) ||
                gameStatus == .someoneWins(.B) ||
                gameStatus == .ties
        }
    }
    
    var winner: Players? {
        get {
            switch gameStatus {
            case .someoneWins(let winner): return winner
            default: return nil
            }
        }
    }
    
    var currentPlayerInTurn: Players? {
        get {
            switch gameStatus {
            case .playerInTurn(let player): return player
            default: return nil
            }
        }
    }
    

    func isPushable(at tubeIndex: Int) -> Bool {
        if tubeIndex < 0, tubeIndex > numberOfTubes { fatalError("Unexpected value for func isPushable") }
        
        if isGameEnded { return false }
        
        for index in 0..<Height {
            if board[tubeIndex][index] == .empty {
                return true
            }
        }
        return false
    }
    
    func Push(at tubeIndex: Int) {
        if !isPushable(at: tubeIndex){ return }
        
        for altitude in 0..<Height {
            if board[tubeIndex][altitude] == .empty {
                board[tubeIndex][altitude] = .occupied(currentPlayerInTurn!)
                break
            }
        }
        
        SwitchPlayer()
        CheckIfAnyoneWins()
    }

    func CheckIfAnyoneWins() {
        
    }
    
    func SwitchPlayer() {
        switch gameStatus {
        case .playerInTurn(let currentPlayer):
            if currentPlayer == .A {
                gameStatus = .playerInTurn(.B)
            } else if currentPlayer == .B {
                gameStatus = .playerInTurn(.A)
            } else {
                fatalError("error: Unexpected value in func SwitchPlayer")
            }
        default:
            fatalError("error: unexpected value in func currentPlayer")
        }
    }
    
}

extension ConnectFour.Status : Equatable {
    static func ==(lhs: ConnectFour.Status, rhs: ConnectFour.Status) -> Bool {
        switch (lhs, rhs) {
        case let (.playerInTurn(a), .playerInTurn(b)),
             let (.someoneWins(a), .someoneWins(b)): return a == b
        case (.ties, .ties): return true
        default: return false
        }
    }
}
