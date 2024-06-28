//
//  QuestionDTO.swift
//  LimonIOS
//
//  Created by Marcos on 25/6/24.
//

import Foundation

typealias QuestionsDTO = [QuestionDTO]

struct QuestionDTO: Codable {
    let id: String
    let text: String
    let points: Int
}
