//
//  Question.swift
//  LimonIOS
//
//  Created by Marcos on 10/6/24.
//

import Foundation
typealias Questions = [Question]

struct Question: Codable {
    let text: String
    var points: Int
}
