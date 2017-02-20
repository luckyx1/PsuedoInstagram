//
//  InstalCell.swift
//  PsuedoInstagram
//
//  Created by Rob Hernandez on 2/17/17.
//  Copyright © 2017 Robert Hernandez. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstalCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeCounter: UILabel!
    @IBOutlet weak var instaImage: PFImageView!
    
    var post: Post!{
        didSet{
            userNameLabel.text = post.user?.username
            commentLabel.text = post.caption
            likeCounter.text = "\(post.likeCount)"
            timeLabel.text = post.dateStr
            
            // Add the image
            self.instaImage.file = post.image
            self.instaImage.loadInBackground()
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onLike(_ sender: Any) {
    }

}
