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
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            //Check for any error
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            
            //make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            //Parse the result as JSON, since that's what the API provides
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                    print("error trying to convert data to JSON")
                    return
                }
                
                print("The todo is: " + todo.description)
                
                guard let todoTitle = todo["title"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                
                print("The title is: " + todoTitle)
            } catch {
                print("Failed to serialize data to JSON")
                return
            }
            
        }
        
        task.resume()
    }
}

