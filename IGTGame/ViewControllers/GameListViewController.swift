//
//  ViewController.swift
//  IGTGame
//
//  Created by Arit Kumar Bishwas on 3/31/16.
//  Copyright © 2016 Jahanvi Vyas. All rights reserved.
//


let kGameListCellIdentifier = "GameTitleTableViewCell"
let kShowGameDetailSegueIdentifier = "ShowGameDetailSegueIdentifier"

import UIKit

class GameListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var loadingIndicator: UIActivityIndicatorView!
    
    var games : NSMutableArray = [ ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kGameListCellIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        //Get Game Data
        self.showLoading()
        GameDataManager.sharedInstance.getGameDataWithCompletion {(error) -> Void in
            
            dispatch_async(dispatch_get_main_queue())
            {
                if((error) == nil)
                {
                    self.games = GameDataManager.sharedInstance.games
                    self.tableView.reloadData()
                }
                else
                {
                    if(error?.code == kNoInternetErrorCode)
                    {
                        self.showErrorMessage("No Internet Connection")
                    }
                    else
                    {
                        self.showErrorMessage("Problem in server to load data")
                    }
                }
                self.hideLoading()
            }
        }
    }
    
    func showErrorMessage(message:String) {
        let alertView = UIAlertController(title: "", message: message, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
    }
    
    func showLoading() {
        
        if(loadingIndicator == nil)
        {
            loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
            loadingIndicator.center = view.center
            loadingIndicator.hidesWhenStopped = true
            view.addSubview(loadingIndicator)
        }
        loadingIndicator.startAnimating()
    }
    
    func hideLoading() {
        
        loadingIndicator.stopAnimating()
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
        return games.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(kGameListCellIdentifier, forIndexPath: indexPath)
        
        let gameObject = games[indexPath.row] as! Game
        cell.textLabel!.text = gameObject.gameName;
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier(kShowGameDetailSegueIdentifier, sender: indexPath)
    }
    
    //MARK: - 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == kShowGameDetailSegueIdentifier {
            let selectedIndex = sender as! NSIndexPath
            let gameDetailViewController = segue.destinationViewController as! GameDetailViewController;
            gameDetailViewController.game = games[selectedIndex.row] as? Game
        }
    }
}

