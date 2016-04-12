//
//  GameResponse.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 4/1/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import Foundation

class GameResponse: NSObject {
    
    var currency: String = ""
    var games: NSMutableArray = []
    
    
    func initWithProperties(gameResponseDictionary:NSDictionary)
    {
        if let currency = gameResponseDictionary["currency"] as? String {
            self.currency = currency
        }
        
        if let gameData = gameResponseDictionary["data"] as? [[String: AnyObject]] {
            for game in gameData {
                
                let gameObject = Game()
                gameObject.initWithProperties(game)
                
                //Check nil for game object
                self.games.addObject(gameObject)
            }
        }
    }
}
