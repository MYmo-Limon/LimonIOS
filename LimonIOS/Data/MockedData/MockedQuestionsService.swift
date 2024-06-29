//
//  MockedQuestionsService.swift
//  LimonIOS
//
//  Created by Marcos on 26/6/24.
//

import Foundation
import Combine
struct MockedQuestionsService: QuestionsServiceProtocol {
    func loadQuestions() -> AnyPublisher<Questions, any Error> {
        fatalError("unimplemented method")
    }
    
    func sendAnswers() {
        fatalError("unimplemented method")
    }
    
    func loadCategories() -> AnyPublisher<Categories, any Error> {
        let mockedCategories = [Category(id: "1", text: "Example1", points: 3), Category(id: "2", text: "Example2", points: 0),Category(id: "3", text: "Example3", points: 0),Category(id: "4", text: "Example4", points: 5),Category(id: "5", text: "Example5", points: 0),Category(id: "6", text: "Example6", points: 0),Category(id: "7", text: "Example7", points: 0),Category(id: "8", text: "Example8", points: 0)]
        
        let future = Future<Categories, Error> { promise in
                       promise(.success(mockedCategories))
                   }
        return future.eraseToAnyPublisher()
    }
}
