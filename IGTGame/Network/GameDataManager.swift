//
//  GameDataManager.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 3/31/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

typealias GameObject = [String: AnyObject]

import Foundation

class GameDataManager: NSObject {
    
    var games: NSMutableArray = []
    var currency: String = ""

    static let sharedInstance = GameDataManager()
    
    func getGameDataWithCompletion(completionHandler:((NSError?)) -> Void)
    {
        if(CacheDataManager.sharedInstance.isCachedDataAvailable()) {
            let jsonData  = CacheDataManager.sharedInstance.readDataFromTextFile()
            self.parseJSONData(jsonData!)
            completionHandler(nil)
        }
        else
        {
            if(RestAPIManager.isConnectedToNetwork())
            {
                RestAPIManager.requestDataWithURL(kBaseURL!,completionHandler: { (data, error) -> Void in
                    if error == nil {
                        CacheDataManager.sharedInstance.saveDataToTextFile(data!)
                        CacheDataManager.sharedInstance.saveCachedDate()
                        self.parseJSONData(data!)
                        completionHandler(error)
                    }
                    else
                    {
                        completionHandler(error)
                    }
                })
            }
            else
            {
                completionHandler(NSError(domain: "", code: kNoInternetErrorCode, userInfo: nil))
            }
        }
    }
    
    
    func parseJSONData(data:NSData)
    {
        var json: GameObject!
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? GameObject
        } catch {
            print(error)
        }
        
        let gameResponse = GameResponse()
        gameResponse.initWithProperties(json)
        self.currency = gameResponse.currency
        self.games = gameResponse.games
    }
}