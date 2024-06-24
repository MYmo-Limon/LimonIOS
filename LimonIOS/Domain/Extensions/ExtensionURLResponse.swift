//
//  ExtensionURLResponse.swift
//  LimonIOS
//
//  Created by Marcos on 24/6/24.
//

import Foundation

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
