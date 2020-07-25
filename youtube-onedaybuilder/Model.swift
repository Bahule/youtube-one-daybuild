//
//  Model.swift
//  youtube-onedaybuilder
//
//  Created by Bilaal on 2020/07/25.
//  Copyright © 2020 Twilight Audio. All rights reserved.
//

import Foundation


class Model {
    
    func getVideos(){
        
        // Create a URL object
        let url = URL(string: Consatants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // checck if there were any errors
            if error != nil || data == nil {
                return
                
            }
            
            // Parsing the data into video object
        }
        
        // kick off the task
        dataTask.resume()
        
        
    }
    
}
