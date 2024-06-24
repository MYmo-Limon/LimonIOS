//
//  BeeView.swift
//  LimonIOS
//
//  Created by Marcos on 12/6/24.
//

import Foundation
import SwiftUI

struct BeeView: View {
    @EnvironmentObject var tokenManager: TokenManager
    
    @State private var offsetY: CGFloat = 110

    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    // Color blanco semitransparente
                    Color.white.opacity(0.8)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    Spacer()
                    
                    // Contenido principal dentro de un VStack
                    VStack {
                        Spacer()
                        
                        Image("HomeImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text("Hola, ¿qué tal estás?")
                            .foregroundColor(.red)
                            .bold()
                            .font(.title)
                        ZStack {
                            VStack{
                                Image("Bee")
                                    .resizable()
                                    .frame(width: 134, height: 117)
                                    .offset(x: -110, y: offsetY)
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 2).repeatForever()) {
                                            offsetY = 130
                                        }
                                    }
                            }
                            HStack {
                                Spacer() // Pushes text image to right
                                Image("BeeText")
                                    .resizable()
                                    .frame(width: 219, height: 217)
                            }
                            .padding(.trailing)
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        NavigationLink(destination: ExplanationView(tokenManager: _tokenManager )){
                            Text("Siguiente")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.PrimaryCustom)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }
                        .padding()
                    }
                    .padding()
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    BeeView()
        .environmentObject(TokenManager())
}
