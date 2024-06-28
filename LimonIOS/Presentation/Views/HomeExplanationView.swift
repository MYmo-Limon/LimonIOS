//
//  HomeExplanation.swift
//  LimonIOS
//
//  Created by Marcos on 18/6/24.
//

import SwiftUI

struct HomeExplanationView: View {
    
    @EnvironmentObject var tokenManager: TokenManager
    
    
    // @ObservedObject var homeViewModel = HomeViewModel(useCase: UseCaseHome())
    
    var body: some View{
        NavigationStack{
            Spacer()
            ZStack{
                Rectangle()
                    .fill(Color.CustomGrey.opacity(0.80))
                    .frame(width: 357 , height: 219)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 10,
                            topTrailingRadius: 10
                        )
                    )
                Text("Te voy a estar preguntando qué nivel de satisfacción laboral tienes en relación a cada uno de estos 6 ámbitos, para que veamos cuál es el que tienes más oportunidades de mejoras. Este LIMON te acompañará a visibilizar el equilibrio entre lo que das y lo que recibes. Lo vas a medir tu con respecto a tu conexión con cada ámbito, nivel de energía o satisfacción.")
                    .padding()
            }
            .padding()
            
            Spacer()
            Spacer()
            
            LemonButton( buttonCategories: [Category(id:"1",text: "Proposito", points: 0),Category(id:"1",text: "Propuesta valor", points: 0),Category(id:"1",text: "Relaciones", points: 0),Category(id:"1",text: "Espacios", points: 0),Category(id:"1",text: "Salud y bienestar", points: 0),Category(id:"1",text: "Prosperidad", points: 0)] )
            
            Spacer()
            Spacer()
            
            NavigationLink(destination: HomeView(tokenManager: tokenManager)){
                Text("Siguiente")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.PrimaryCustom)
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }
            .padding()
            Spacer()
        
            
        }
        .navigationBarBackButtonHidden(true)
    }
}
    

#Preview {
    HomeExplanationView()
        .environmentObject(TokenManager())
}



