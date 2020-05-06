//
//  Endpoint.swift
//  Getting Started With Alamofire 5
//
//  Created by Ziad Hamdieh on 2020-05-05.
//  Copyright © 2020 TN. All rights reserved.
//

import Alamofire
import Foundation

enum Endpoint: CustomStringConvertible {
    // MARK: - Endpoint Cases
    
    // You can add PUT/PATCH/DELETE cases here...
    case GET
    case POST
    
    var httpMethod: HTTPMethod {
        switch self {
        case .GET:
            return .get
        case .POST:
            return .post
        }
    }
    
    var description: String {
        switch self {
        case .GET:
            return  "https://qi3gnt3l40.execute-api.us-east-1.amazonaws.com/Dev/user?"
        case .POST:
            return "https://qi3gnt3l40.execute-api.us-east-1.amazonaws.com/Dev/user"
        }
    }

    func url() -> URL {
        switch self {
        case .GET:
            return  URL(string: "https://qi3gnt3l40.execute-api.us-east-1.amazonaws.com/Dev/user?")!
        case .POST:
            return URL(string: "https://qi3gnt3l40.execute-api.us-east-1.amazonaws.com/Dev/user")!
        }
    }
}
