//
//  VideoTableViewCell.swift
//  youtube-onedaybuilder
//
//  Created by Bilaal on 2020/07/26.
//  Copyright © 2020 Twilight Audio. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
   
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v:Video) {
        
        self.video = v
        
        // Ensure that we have video
        guard self.video != nil else {
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set  the dat
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video!.thumbnail != "" else {
         return
        }
        
        // Download the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        // Get the shared URL Session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Check that the downloaded url matches the video thumbnail url that this cell is currently set  to display
                if url!.absoluteString != self.video?.thumbnail {
                    // Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    
                    return
                }
                
                // Create the image obgect
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.sync {
                    self.thumbnailImageView.image = image
                }
            
            }
            
        }
    // Start data task
        dataTask.resume()
    }
    
    
}