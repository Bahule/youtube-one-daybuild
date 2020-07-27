//
//  Video.swift
//  youtube-onedaybuilder
//
//  Created by Bilaal on 2020/07/25.
//  Copyright © 2020 Twilight Audio. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case publised = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    init (from decoder:Decoder) throws{
       
        
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetConteiner = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse the title
        self.title = try snippetConteiner.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetConteiner.decode(String.self, forKey: .description)
        
        // Parse the publish date
        self.published = try snippetConteiner.decode(Date.self, forKey: .publised)
        
        // Parse thumbnails
        let thumbnailContainer = try snippetConteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
    
        // Parse Video ID
        let resourceIdContainer = try snippetConteiner.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    
    }
    
}
 
