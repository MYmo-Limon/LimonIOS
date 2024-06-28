//
//  Category.swift
//  LimonIOS
//
//  Created by Marcos on 26/6/24.
//

import Foundation
typealias Categories = [Category]

struct Category: Codable {
    let id: String
    let text: String
    var points: Int
}
