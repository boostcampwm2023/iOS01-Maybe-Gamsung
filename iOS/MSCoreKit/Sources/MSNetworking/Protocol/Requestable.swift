//
//  Requestable.swift
//
//
//  Created by 전민건 on 11/16/23.
//

import Foundation

protocol Requestable {
    
    var baseURL: APIbaseURL { get }
    var pathURL: APIpathURL { get }
    var method: HTTPMethod { get }
    var body: HTTPBody { get }
    
    func asURLRequest() -> URLRequest?
}
