//
//  Constants.swift
//  LimonIOS
//
//  Created by Marcos on 24/6/24.
//

import Foundation

let server = "http://localhost:8000"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}
let contentType = "application/json"

enum endpoints: String {
    case login = "/login/"
    case categories = "/categories/"
}
