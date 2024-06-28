//
//  HomeUseCase.swift
//  LimonIOS
//
//  Created by Marcos on 25/6/24.
//

import Foundation
import Combine
final class HomeUseCase: UseCaseHomeProtocol {
    func loadCategories() -> AnyPublisher<Categories, any Error> {
        return QuestionsRepository(isMocked: true).loadCategories()
    }
}
