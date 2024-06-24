//
//  TokenManager.swift
//  LimonIOS
//
//  Created by Marcos on 20/5/24.
//

import SwiftUI
import Combine

class TokenManager: ObservableObject {
    @Published var token: String = "" {
        didSet {
//            print("Token changed: \(token)") // Agrega esta línea para depuración
            saveToken(token:token, key: TOKEN_KEY)
        }
    }
    
    @Published var refreshToken: String = "" {
        didSet {
//            print("REFRESH Token changed: \(refreshToken)") // Agrega esta línea para depuración
            saveToken(token: token, key: REFRESH_TOKEN_KEY)
        }
    }
    
    
    private let keychain: KeychainProtocol
    
    init(keychain: KeychainProtocol = Keychain()) {
        self.keychain = keychain
        self.token = keychain.getKey(key: TOKEN_KEY)
        self.refreshToken = keychain.getKey(key: REFRESH_TOKEN_KEY)
    }
    
    private func saveToken( token: String, key: String) {
        keychain.save(key: key, value: token)
    }
    
    func deleteToken(key: String){
        keychain.save(key: key, value: "")
        self.token = ""
    }
}
