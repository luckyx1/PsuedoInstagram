//
//  FeedViewController.swift
//  PsuedoInstagram
//
//  Created by Rob Hernandez on 2/17/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var posts: [Post] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
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
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts{
                print("yay found data")
                for post in posts{
                    print("post is: \(post)")
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
                self.dismiss(animated: true, completion: nil)
                print("signed out successfully!")
            }
        }
    }
    


    


}
