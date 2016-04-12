//
//  ViewController.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 3/31/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//

enum GameCellType:Int {
    case GameName
    case GameJackpot
    case GameDate
}

let rowCount = 3
let kNavigationTitle = "Game Details"
let kNameCellTitle = "Name"
let kJackpotCellTitle = "Jackpot"
let kDateCellTitle = "Date"
let kGameDetailCellIdentifier = "GameDetailTableViewCell"

import UIKit

class GameDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    internal var game:Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.navigationItem.title = kNavigationTitle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(kGameDetailCellIdentifier, forIndexPath: indexPath)
        
        if let gameCellType = GameCellType(rawValue: indexPath.row) {
            switch gameCellType {
            case .GameName:
                cell.textLabel!.text = kNameCellTitle
                cell.detailTextLabel!.text = String(game!.gameName)
            case .GameJackpot:
                cell.textLabel!.text = kJackpotCellTitle
                cell.detailTextLabel!.text = game?.gameJackpot.toCurrencyString(GameDataManager.sharedInstance.currency)
            case .GameDate:
                cell.textLabel!.text = kDateCellTitle
                cell.detailTextLabel!.text = game?.gameDate.toFormattedDateString()
            }
        }
        
        return cell
    }
}

