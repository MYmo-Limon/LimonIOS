//
//  LoginView.swift
//  LimonIOS
//
//  Created by Marcos on 14/5/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var tokenManager: TokenManager

    
    // @ObservedObject var homeViewModel = HomeViewModel(useCase: UseCaseHome())
    
    var body: some View{
        ZStack{
            Image("Background")
                      .resizable()
                      .scaledToFit()
                      .edgesIgnoringSafeArea(.all)
            Color.white.opacity(0.5)
            .edgesIgnoringSafeArea(.all)

            VStack{
                Spacer()
                LemonButton( lemonButtonCat: [LemonButtonCat(name: "Test", points: 3),LemonButtonCat(name: "Test", points: 3),LemonButtonCat(name: "Test", points: 3),LemonButtonCat(name: "Test", points: 3),LemonButtonCat(name: "Test", points: 0),LemonButtonCat(name: "Test", points: 3)] )
                
                Spacer()
                Button("Borrar token"){
                    tokenManager.deleteToken()
                }
                
                Spacer()
                Spacer()
            }
        }
      
        .navigationTitle("Home")

    }
    
}
    

#Preview {
    HomeView()
        .environmentObject(TokenManager())
}


