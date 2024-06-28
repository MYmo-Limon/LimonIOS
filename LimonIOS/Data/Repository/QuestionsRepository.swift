//
//  QuestionsRepository.swift
//  LimonIOS
//
//  Created by Marcos on 26/6/24.
//

import Foundation
import Combine
struct QuestionsRepository: QuestionsServiceProtocol {

    let isMocked: Bool
    
    init(isMocked: Bool) {
        self.isMocked = isMocked
    }
    
    func loadCategories() -> AnyPublisher<Categories, any Error> {
            if(!isMocked){
                let publisher: AnyPublisher<CategoriesDTO, any Error>
                publisher = QuestionsService().loadCategories()
                return publisher.map { responseList in
                    responseList.map { response in
                        Category(id: response.id, text: response.text, points: response.points)
                    }
                }.eraseToAnyPublisher()
            }else{
               return MockedQuestionsService().loadCategories()
            }
        }
}
