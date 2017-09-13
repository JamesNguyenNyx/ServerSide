//
//  ViewController.swift
//  Alamofire101
//
//  Created by James Nguyen on 2017/09/13.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //1. Create string endpoint
//        let todoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
//        
//        //2. Request with Alamofire
//        Alamofire.request(todoEndpoint, method: .get).responseJSON { (response) in
//            
//            //Get an error in getting the data, need to handle it
//            guard response.result.error == nil else {
//                print("Error calling GET on /todos/1")
//                print(response.result.error!)
//                return
//            }
//            
//            //make sure we got some JSON since that's what we expect
//            guard let json = response.result.value as? [String: Any] else {
//                print("didn't get todo object as JSON from API")
//                print("Error: \(String(describing: response.result.error))")
//                return
//            }
//            
//            //get and print title
//            guard let todoTitle = json["title"] as? String else {
//                print("Could not get todo title from JSON")
//                return
//            }
//            
//            print("The title is: " + todoTitle)
        
        //POST
        
        let todosEndpoint: String = "https://jsonplaceholder.typicode.com/todos"
        let newTodo: [String: Any] = ["title": "James Nguyen Post", "completed": 0, "userId": 1]
        
        Alamofire.request(todosEndpoint, method: .post, parameters: newTodo, encoding: JSONEncoding.default).responseJSON { (response) in
            
            guard response.result.error == nil else {
                print("error calling POST on/todos/1")
                print(response.result.error!)
                return
            }
            
            //make sure we got some JSON since that's what we expect
            guard let json = response.result.value as? [String: Any] else {
                print("didn't get todo object as JSON from API")
                print("Error: \(String(describing: response.result.error))")
                return
            }
            
            //Get and print title
            guard let todoTitle = json["title"] as? String else {
                print("Could not get todo title from JSON")
                return
            }
            
            print("The title is: " + todoTitle)
            
            //DELETE
            let firstTodoEndpoint: String = "https://jsonplaceholder.typicode.com/todos/1"
            Alamofire.request(firstTodoEndpoint, method: .delete).responseJSON(completionHandler: { (response) in
                guard response.result.error == nil else {
                    print("Error calling DELETE on/todos/1")
                    print(response.result.error!)
                    return
                }
                
                print("DELETE OK")
            })
        }
        
    }
}


