//
//  ResultLemonView.swift
//  LimonIOS
//
//  Created by Marcos on 29/6/24.
//

import Foundation
import SwiftUI

struct ResultLemonView: View {
    
    @EnvironmentObject var tokenManager: TokenManager
    
    
    // @ObservedObject var homeViewModel = HomeViewModel(useCase: UseCaseHome())
    
    var body: some View{
        NavigationStack{
            Spacer()
            ZStack{
                Rectangle()
                    .fill(Color.DeepGrey)
                    .frame(width: 357 , height: 161)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 10,
                            topTrailingRadius: 10
                        )
                    )
                Text("Si quieres compartir conmigo más reflexiones, elige  3 ámbitos prioritarios o en los que consideres que tienes mayores oportunidades de mejora ")
                    .foregroundStyle(.white)
                    .padding()
            }
            .padding()
            
            Spacer()
            Spacer()
            
            LemonButton( buttonCategories: [Category(id:"1",text: "Proposito", points: 0),Category(id:"1",text: "Propuesta valor", points: 0),Category(id:"1",text: "Relaciones", points: 0),Category(id:"1",text: "Espacios", points: 0),Category(id:"1",text: "Salud y bienestar", points: 0),Category(id:"1",text: "Prosperidad", points: 0)] )
            
            Spacer()
            Spacer()
            Spacer()
        }
        .navigationTitle("Resultados")
    }
}
    

#Preview {
    ResultLemonView()
        .environmentObject(TokenManager())
}



