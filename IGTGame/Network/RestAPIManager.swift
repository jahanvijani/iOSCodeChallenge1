//
//  RestAPIManager.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 3/31/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

import Foundation

class RestAPIManager: NSObject {
    
    class func requestDataWithURL(url: NSURL, completionHandler:((NSData?,NSError?)) -> Void)
    {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
            completionHandler(data,error)
            if error == nil {
                //Successful 
                //let urlContent = NSString(data: data!, encoding: NSASCIIStringEncoding) as NSString!
                //print(urlContent)
            }
        })
        task.resume()
    }
    
    class func isConnectedToNetwork() -> Bool {
        let reachability: Reachability = Reachability.reachabilityForInternetConnection()
        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
        return networkStatus != 0
        /*let networkStatus = reachability.currentReachabilityStatus()
        if(networkStatus == NotReachable) {
            return false
        }
        else if(networkStatus == ReachableViaWiFi || networkStatus == ReachableViaWWAN) {
            return true
        }
        return false*/
    }

}