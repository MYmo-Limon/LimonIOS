//
//  CompletedLemonScreen.swift
//  LimonIOS
//
//  Created by Marcos on 28/6/24.
//



import Foundation
import SwiftUI

struct CompletedLemonView: View {
    @EnvironmentObject var tokenManager: TokenManager
    
    @State private var offsetY: CGFloat = 80

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
                    VStack {
                        Spacer()
                        ZStack {
                            VStack{
                                Image("Bee")
                                    .resizable()
                                    .frame(width: 186, height: 154)
                                    .offset(x: -170, y: offsetY)
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 2).repeatForever()) {
                                            offsetY = 100
                                        }
                                    }
                            }
                            HStack {
                                Spacer() // Pushes text image to right
                                Image("BeeText2")
                                    .resizable()
                                    .frame(width: 265, height: 217)
                            }
                            .padding(.trailing)
                        }
                        
                        Spacer()
                        NavigationLink(destination: ExplanationView(tokenManager: _tokenManager )){
                            Text("Continuar")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.PrimaryCustom)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }
                        .padding()
                        NavigationLink(destination: ExplanationView(tokenManager: _tokenManager )){
                            Text("Ver Respuestas")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 2)
                                        )
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }
                        .padding()
                        Spacer()
                        Spacer()
                        Spacer()

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
    CompletedLemonView()
        .environmentObject(TokenManager())
}
