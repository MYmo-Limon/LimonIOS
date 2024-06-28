//
//  HomeUseCaseProtocol.swift
//  LimonIOS
//
//  Created by Marcos on 25/6/24.
//

import Foundation
import Combine

protocol UseCaseHomeProtocol {
    func loadCategories() -> AnyPublisher<Categories, Error>
}

