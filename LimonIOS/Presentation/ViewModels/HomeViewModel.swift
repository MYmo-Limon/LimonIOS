//
//  HomeViewModel.swift
//  LimonIOS
//
//  Created by Marcos on 25/6/24.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    private let tokenManager: TokenManager
    private let useCase: UseCaseHomeProtocol
    var suscriptors = Set<AnyCancellable>()

    @Published var isLoading = false
    @Published var categories: Categories = []
    
    init(useCase: UseCaseHomeProtocol, tokenManager: TokenManager) {
        self.useCase = useCase
        self.tokenManager = tokenManager
    }
    
    func loadCategories(){
        useCase.loadCategories()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self?.isLoading = false
                }
            } receiveValue: { categories in
                if(!categories.isEmpty){
                    categories.forEach { category in
                        self.categories.append(category)
                    }
                }
            }        
            .store(in: &suscriptors)
    }
    
}
