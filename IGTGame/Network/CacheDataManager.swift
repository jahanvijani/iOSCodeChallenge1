//
//  CacheDataManager.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 4/1/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

let cacheLimitInMinutes = 60
import Foundation

class CacheDataManager: NSObject {
    
    static let sharedInstance = CacheDataManager()

    let file = "gameDataTextfile.txt"
    
    func isCachedDataAvailable() -> Bool {
        
        if((NSUserDefaults.standardUserDefaults().objectForKey(kGameDataCachedDateKey)) != nil)
        {
            let cachedDate:NSDate = NSUserDefaults.standardUserDefaults().objectForKey(kGameDataCachedDateKey) as! NSDate!
            let minutes:Int = cachedDate.timeIntervalInMinutesSinceDate(NSDate())
            
            if(minutes > cacheLimitInMinutes) {
                
                //Clear Cache
                return false
            }
            return true
        }
        return false
    }
    
    func saveDataToTextFile(gameData:NSData) {
        
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            gameData.writeToFile(path, atomically: true)
        }
    }
    
    func readDataFromTextFile() -> NSData? {
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            
            let gameData = NSData(contentsOfFile: path)
            return gameData!
        }
        return nil
    }
    
    func deleteTextFile() {
        /*var error: NSError?
        var fileManager = NSFileManager()

        let file = "gameDataTextfile.txt"
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            fileManager.removeItemAtPath(path,error)
        } else {
            print("No file found")
        }*/

    }
    
    
    func saveCachedDate() {
        
        NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey:kGameDataCachedDateKey)
    }
    
    func getCachedDate() -> NSDate? {
        
        let userDefaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if((userDefaults.objectForKey(kGameDataCachedDateKey)) != nil)
        {
            let cachedDate:NSDate = userDefaults.objectForKey(kGameDataCachedDateKey) as! NSDate!
            return cachedDate
        }
        return nil;
    }
}