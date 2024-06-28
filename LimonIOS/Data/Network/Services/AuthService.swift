//
//  AuthServices.swift
//  LimonIOS
//
//  Created by Marcos on 14/5/24.
//

import Foundation
import Combine

protocol AuthServiceProtocol{
    func signIn(userName: String?, password: String?) -> AnyPublisher<LoginResponse, Error>
    //func signUp(user: User) -> AnyPublisher<User, Error>
}

struct AuthService {
    func signIn(userName: String?, password: String?) -> AnyPublisher<LoginDTO, any Error> {
        let urlLogin = "\(server)\(endpoints.login.rawValue)"
        
        let url = URL(string: urlLogin)!
        

        
        var request: URLRequest = URLRequest(url: url)
                request.httpMethod = HTTPMethods.post
        let parameters: [String: Any] = [
            "correo": userName ?? "",
            "contrasenia": password ?? ""
        ]
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            print("Error al convertir los parámetros a JSON: \(error)")
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
                    .tryMap { data, response in
                        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                        return data
                    }
                    .decode(type: LoginDTO.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
    
    
}
