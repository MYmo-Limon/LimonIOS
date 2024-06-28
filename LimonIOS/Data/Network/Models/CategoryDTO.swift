//
//  CategorieDTO.swift
//  LimonIOS
//
//  Created by Marcos on 26/6/24.
//

import Foundation

typealias CategoriesDTO = [CategoryDTO]

struct CategoryDTO: Codable {
    let id: String
    let text: String
    let points: Int
}
