//
//  CacheMananger.swift
//  youtube-onedaybuilder
//
//  Created by Bilaal on 2020/07/29.
//  Copyright © 2020 Twilight Audio. All rights reserved.
//

import Foundation

class CacheMananger {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
     
        // Store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
      
        
        // Try to get the data for the specified url
        return cache[url]
    }
    
}
