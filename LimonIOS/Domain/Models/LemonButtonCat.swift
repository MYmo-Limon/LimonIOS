//
//  LemonButtonConfig.swift
//  LimonIOS
//
//  Created by Marcos on 27/5/24.
//

import Foundation

typealias LemonButtonCategories = [LemonButtonCat]

struct LemonButtonCat: Codable {
    let name: String
    let points: Int
}
