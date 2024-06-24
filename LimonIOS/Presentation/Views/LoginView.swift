//
//  LoginView.swift
//  LimonIOS
//
//  Created by Marcos on 14/5/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var tokenManager: TokenManager
    @ObservedObject var loginViewModel: LoginViewModel
    //Loading animation
    @State private var offsetY: CGFloat = 110
    @State private var offsetX: CGFloat = 110

    
    init(tokenManager: TokenManager) {
           self.loginViewModel = LoginViewModel(useCase: LoginUseCase(), tokenManager: tokenManager)
       }
    
    var body: some View{
        VStack{
            Spacer()
            Image("HomeImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            
            CustomTextField(text: $loginViewModel.userName, placeholder: "Usuario", isSecure: false)
                .padding()
            if(loginViewModel.showErroUsername){
                HStack{
                    Text("El usuario debe ser un email valido")
                        .font(.system(size: 12))
                        .foregroundStyle(.red)
                        .padding(.leading)
                    Spacer()
                }
            }
            
            CustomTextField(text: $loginViewModel.password, placeholder: "Contraseña", isSecure: true)
                .padding()
            if(loginViewModel.showErrorPassword){
                HStack{
                    Text("La contraseña debe contener almenos 5 caracteres")
                        .font(.system(size: 12))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.red)
                        .padding(.leading)
                    Spacer()
                }
            }

            HStack{
                Spacer()
                Button("He olvidado mi contraseña o usuario"){
                    print("Pulsado")
                }
                .font(.system(size: 12))
            }
           
            
            Spacer()
            
            if(loginViewModel.isLoading){
                ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
            } else {
                Button("Entrar") {
                    loginViewModel.logIn()

                }.frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.PrimaryCustom)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                if(loginViewModel.showErrorLogin){
                        Text("Error al iniciar sesión")
                            .font(.system(size: 12))
                            .foregroundStyle(.red)
                    }
            }
            
            
            Spacer()
            Spacer()

        }
        .navigationTitle("Home")
        .padding()
    }
    
}

#Preview {
    LoginView(tokenManager: TokenManager())
}


