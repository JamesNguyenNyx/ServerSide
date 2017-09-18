//
//  GithubAPIManager.swift
//  RestAPI
//
//  Created by James Nguyen on 2017/09/18.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import Foundation
import Alamofire

class GithubManager {
    static let sharedInstance = GithubManager()
    
    func printPublicGits() -> Void {
        Alamofire.request(GistRouter.getPublic()).responseString { (response) in
            if let receivedString = response.result.value {
                print(receivedString)
            }
        }
    }
}
