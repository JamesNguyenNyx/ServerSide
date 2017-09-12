//
//  ViewController.swift
//  Network101
//
//  Created by James Nguyen on 2017/09/12.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let todoEndPoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        
        guard let url = URL(string: todoEndPoint) else {
            print("Error: Cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
    }
}

