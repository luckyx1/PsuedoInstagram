//
//  FeedViewController.swift
//  PsuedoInstagram
//
//  Created by Rob Hernandez on 2/17/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD


class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var posts: [Post] = []
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(refreshControl:)), for: UIControlEvents.valueChanged)

        // add refresh control to table view
        tableView.insertSubview(refreshControl, at: 0)
        
        //Load data
        self.getPosts()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InstaCell", for: indexPath) as! InstalCell
        let post = self.posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func getPosts(){
        // construct query
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        MBProgressHUD.showAdded(to: self.view, animated: true)
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if let posts = posts{
                print("Today is \(Date())")
                for post in posts{
                    self.posts.append(Post(object: post))
                }
                self.tableView.reloadData()
                
            }else{
                print(error?.localizedDescription)
            }
        }

    }
    
    @IBAction func onSignout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            // PFUser.currentUser() will now be nil
            if let error = error{
                print(error.localizedDescription)
            }else{
                NotificationCenter.default.post(name: Post.userDidLogout, object: nil)
                print("signed out successfully!")
            }
        }
    }
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        getPosts()
        // Tell the refreshControl to stop spinning
        refreshControl.endRefreshing()
    }
    


    


}
