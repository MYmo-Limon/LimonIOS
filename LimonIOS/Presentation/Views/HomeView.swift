//
//  LoginView.swift
//  LimonIOS
//
//  Created by Marcos on 14/5/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var tokenManager: TokenManager
    let keychain: KeychainProtocol = Keychain()
    
    // @ObservedObject var homeViewModel = HomeViewModel(useCase: UseCaseHome())
    
    var body: some View{
        NavigationStack{
            VStack{
                ZStack {
                    VStack{
                        Image("Bee")
                            .resizable()
                            .frame(width: 134, height: 117)
                            .offset(x: -180, y: 150)
                            }
                    }
                    HStack {
                        Spacer()
                        Spacer()
                        ZStack{
                            Text("¿Por donde quieres seguir?")
                                .frame(width: 100, height: 217)
                                .font(.subheadline)
                                .offset( y: -110)

                                .padding()
                            Image("bubble")
                                .resizable()
                                .frame(width: 219, height: 217)
                                .rotationEffect(.degrees(-10))
                                .offset(y: -100)


                            
                        }
                        Spacer()
                        Spacer()
                    }
                    .padding(.trailing)
                }
            LemonButton( lemonButtonCat: [LemonButtonCat(name: "Proposito", points: 3),LemonButtonCat(name: "Propuesta valor", points: 0),LemonButtonCat(name: "Relaciones", points: 0),LemonButtonCat(name: "Espacios", points: 0),LemonButtonCat(name: "Salud y bienestar", points: 0),LemonButtonCat(name: "Prosperidad", points: 0)] )
                Spacer()
            
                Button("Borrar token"){
                    tokenManager.deleteToken(key: TOKEN_KEY)
                }
                
                Spacer()
                Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            keychain.save(key: FIRST_TIME_KEY, value: "false")
        }
    }
}
    

#Preview {
    HomeView()
        .environmentObject(TokenManager())
}


