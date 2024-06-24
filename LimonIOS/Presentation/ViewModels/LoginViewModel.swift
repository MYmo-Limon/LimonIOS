//
//  LoginViewModel.swift
//  LimonIOS
//
//  Created by Marcos on 14/5/24.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    private let tokenManager: TokenManager
    private let useCase: UseCaseLoginProtocol
    var suscriptors = Set<AnyCancellable>()
    @Published var userName = "" {
        didSet{
            showErroUsername = !checkValidUser(userName: userName)
        }
    }
    
    @Published var password = "" {
            didSet {
                showErrorPassword = !checkValidPassword(password: password)
            }
        }
    
    @Published var showErroUsername = false
    @Published var showErrorPassword = false
    @Published var showErrorLogin = false
    @Published var isLoading = false
    
    init(useCase: UseCaseLoginProtocol, tokenManager: TokenManager) {
        self.useCase = useCase
        self.tokenManager = tokenManager
    }
    
    
    func logIn() {
        isLoading = true
        print(isLoading)
        useCase.logIn(user: userName, password: password)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self?.isLoading = false
                    self?.showErrorLogin = true
                }
            } receiveValue: { [weak self] loginResponse in
                if !loginResponse.token.isEmpty {
                    self?.tokenManager.token = loginResponse.token
                    self?.tokenManager.refreshToken = loginResponse.refreshToken
                }
                self?.isLoading = false
            }
            .store(in: &suscriptors)
    }
    
    func checkValidUser(userName: String) -> Bool{
        userName.contains("@") && userName.contains(".")
    }
    
    func checkValidPassword(password: String) -> Bool{
        password.count > 5
    }
}
