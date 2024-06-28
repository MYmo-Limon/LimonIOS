//
//  QuestionsService.swift
//  LimonIOS
//
//  Created by Marcos on 26/6/24.
//

import Foundation
import Combine

protocol QuestionsServiceProtocol{
    func loadCategories() -> AnyPublisher<Categories, Error>
    func loadQuestions() -> AnyPublisher<Questions, Error>
    func sendAnswers()
}

struct QuestionsService {
    
//    TODO: Check with backend when pushed
    func loadCategories() -> AnyPublisher<CategoriesDTO, any Error> {
        let urlLoadCategories = "\(server)\(endpoints.categories.rawValue)"
        let url = URL(string: urlLoadCategories)!

        var request: URLRequest = URLRequest(url: url)
                request.httpMethod = HTTPMethods.get
//        let parameters: [String: Any] = []
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
//        } catch {
//            print("Error al convertir los parámetros a JSON: \(error)")
//        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
                    .tryMap { data, response in
                        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                        return data
                    }
                    .decode(type: CategoriesDTO.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
    
    
}
