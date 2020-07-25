//
//  ViewController.swift
//  youtube-onedaybuilder
//
//  Created by Bilaal on 2020/07/25.
//  Copyright © 2020 Twilight Audio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }


}

