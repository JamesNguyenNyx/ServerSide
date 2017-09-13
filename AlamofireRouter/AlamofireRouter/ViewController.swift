//
//  ViewController.swift
//  AlamofireRouter
//
//  Created by James Nguyen on 2017/09/13.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func alamofireGet() {
        Alamofire.request(AlamofireRouter.get(1))
            .responseJSON { response in
                
                // Check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                // Make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(String(describing: response.result.error))")
                    return
                }
                
                // Get and print the title
                guard let todoTitle = json["title"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
        }
    }
    
    func alamofirePost() {
        let newTodo: [String: Any] = ["title": "My First Post", "completed": 0, "userId": 1]
        
        Alamofire.request(AlamofireRouter.create(newTodo)).responseJSON { (response) in
            
            
            guard response.result.error == nil else {
                // got an error in getting the data, need to handle it
                print("error calling POST on /todos/1")
                print(response.result.error!)
                return
            }
            // make sure we got some JSON since that's what we expect
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get todo object as JSON from API")
                print("Error: \(String(describing: response.result.error))")
                return
            }
            // get and print the title
            guard let todoTitle = json["title"] as? String else {
                print("Could not get todo title from JSON")
                return
            }
            print("The title is: " + todoTitle)
        }
    }
    
    func alamofireDelete() {
        Alamofire.request(AlamofireRouter.delete(1))
            .responseJSON { response in
                
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling DELETE on /todos/1")
                    print(response.result.error!)
                    return
                }
                
                print("DELETE ok")
        }
    }
}

