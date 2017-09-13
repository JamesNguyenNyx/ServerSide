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
//        let todoEndPoint: String = "https://jsonplaceholder.typicode.com/todos/1"
//        
//        guard let url = URL(string: todoEndPoint) else {
//            print("Error: Cannot create URL")
//            return
//        }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let session = URLSession.shared
//        let task = session.dataTask(with: urlRequest) {
//            (data, response, error) in
//            
//            //Check for any error
//            guard error == nil else {
//                print("error calling GET on /todos/1")
//                print(error!)
//                return
//            }
//            
//            //make sure we got data
//            guard let responseData = data else {
//                print("Error: did not receive data")
//                return
//            }
//            
//            //Parse the result as JSON, since that's what the API provides
//            do {
//                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
//                    print("error trying to convert data to JSON")
//                    return
//                }
//                
//                print("The todo is: " + todo.description)
//                
//                guard let todoTitle = todo["title"] as? String else {
//                    print("Could not get todo title from JSON")
//                    return
//                }
//                
//                print("The title is: " + todoTitle)
//            } catch {
//                print("Failed to serialize data to JSON")
//                return
//            }
//            
//        }
//        
//        task.resume()
        
        //POST
        let todosEndpoint: String = "https://jsonplaceholder.typicode.com/todos"
        guard let todosURL = URL(string: todosEndpoint) else {
            print("Error: Cannot create URL")
            return
        }
        
        var todosUrlRequest = URLRequest(url: todosURL)
        todosUrlRequest.httpMethod = "POST"
        
        let newTodo: [String: Any] = ["title": "Nguyen An Tinh", "completed": true, "userId": 1]
        let jsonTodo: Data
        
        do {
            jsonTodo = try JSONSerialization.data(withJSONObject: newTodo, options: [])
            todosUrlRequest.httpBody = jsonTodo
        } catch {
            print("Error: cannot create JSON from todo")
            return
        }
        
        //DELETE
        let firstTodoEndPoint: String = "https://jsonplaceholder.typicode.com/todos/1"
        var firstTodoUrlRequest = URLRequest(url: URL(string: firstTodoEndPoint)!)
        
        firstTodoUrlRequest.httpMethod = "DELETE"
        
        let sessionDelete = URLSession.shared
        
        let taskDelete = sessionDelete.dataTask(with: firstTodoUrlRequest) {
            (data, response, error) in
            
            guard let _ = data else {
                print("Error calling DELETE on /todos/1")
                return
            }
            
            print("DELETE ok")
        }
        
        taskDelete.resume()
        
        
        //GET
        let session = URLSession.shared
        let task = session.dataTask(with: todosUrlRequest) {
            (data, response, error) in
            
            guard error == nil else {
                print("Error calling POST on /todos/1")
                print(error as Any)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            //Parse the result as JSON, since that's what the API provides
            do {
                guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                    print("Could not get JSON from responseData as dictionary")
                    return
                }
                print("The todo is: " + receivedTodo.description)
                
                guard let todoID = receivedTodo["id"] as? Int else {
                    print("Could not get todoID as int from JSON")
                    return
                }
                
                print("The ID is: \(todoID)")
            } catch {
                print("Error parsing response from POST on todos")
                return
            }
        }
        task.resume()

    }
}














