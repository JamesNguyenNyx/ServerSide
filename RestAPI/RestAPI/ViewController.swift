//
//  ViewController.swift
//  RestAPI
//
//  Created by James Nguyen on 2017/09/18.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        GithubManager.sharedInstance.printPublicGits()
    }
}

