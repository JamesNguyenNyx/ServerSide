//
//  TodoModel.swift
//  AlamofireRouter
//
//  Created by James Nguyen on 2017/09/13.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import Foundation

class TodoModel {
    
    var title: String
    var id: Int?
    var userId: Int
    var completed: Bool
    
    required init(title: String, id: Int?, userId: Int, completedStatus: Bool) {
        self.title = title
        self.id = id
        self.userId = userId
        self.completed = completedStatus
    }
    
    func decription() -> String {
        return "ID: \(String(describing: self.id)), " + "User ID: \(self.userId)" + "Title: \(self.title)\n" + "Completed: \(self.completed)\n"
    }
}
