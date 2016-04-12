//
//  Game.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 3/31/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import Foundation

class Game: NSObject {
    
    var gameName: String = ""
    var gameJackpot: Double=0
    var gameDate: String = ""
    
    
    func initWithProperties(gameDataDictionary:NSDictionary)
    {
        if let name = gameDataDictionary["name"] as? String {
            self.gameName = name
        }
        if let jackpot = gameDataDictionary["jackpot"] as? Double {
            self.gameJackpot = jackpot
        }
        if let gameDate = gameDataDictionary["date"] as? String {
            self.gameDate = gameDate
        }
    }
}
