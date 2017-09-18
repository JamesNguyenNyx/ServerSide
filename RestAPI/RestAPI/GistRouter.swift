//
//  GistRouter.swift
//  RestAPI
//
//  Created by James Nguyen on 2017/09/18.
//  Copyright © 2017 James Nguyen. All rights reserved.
//

import Foundation
import Alamofire

enum GistRouter: URLRequestConvertible {
    
    static let baseURLString = "https://api.github.com/"
    
    case getPublic()
    
    func asURLRequest() throws -> URLRequest {
        
        //Method
        var method: HTTPMethod {
            switch self {
            case .getPublic():
                return .get
            }
        }
        
        
        //Url
        let url: URL = {
            let relativePath: String
            switch self {
            case .getPublic():
                relativePath = "gists/public"
            }
            
            var url = URL(string: GistRouter.baseURLString)!
            url.appendPathComponent(relativePath)
            return url
        }()
        
        
        //Params
        let params: ([String: Any]?) = {
            switch self {
            case .getPublic:
                return nil
            }
        }()
        
        
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
        
        
    }
}
