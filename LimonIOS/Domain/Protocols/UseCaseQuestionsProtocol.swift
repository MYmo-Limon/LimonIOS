//
//  UseCaseQuestionsProtocol.swift
//  LimonIOS
//
//  Created by Marcos on 10/6/24.
//

import Foundation
import Combine
protocol UseCaseQuestionsProtocol {
    func loadQuestions() -> AnyPublisher<Questions, Error>
    func sendResponses()
}
