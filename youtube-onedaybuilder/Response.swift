//
//  Response.swift
//  youtube-onedaybuilder
//
//  Created by Bilaal on 2020/07/26.
//  Copyright © 2020 Twilight Audio. All rights reserved.
//

import Foundation

struct Response: Decodable{
    
    var items:[Video]?
    
    enum  CodingKeys: String, CodingKey{
        
        case items
        
    }
    
    init (from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        self.items = try container.decode([Video].self,forKey: .items)
    }
    
}
