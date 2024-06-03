//
//  QuestionsView.swift
//  LimonIOS
//
//  Created by Marcos on 1/6/24.
//

import SwiftUI

struct QuestionsView: View {
    
//    @EnvironmentObject var tokenManager: TokenManager

    
    // @ObservedObject var homeViewModel = HomeViewModel(useCase: UseCaseHome())
    
    var body: some View{
     
        VStack{
            Text("Preguntas jiji")
            Spacer()
            Spacer()
        }
        .navigationTitle("Questions")

    }
    
}
    

#Preview {
    HomeView()
        .environmentObject(TokenManager())
}


