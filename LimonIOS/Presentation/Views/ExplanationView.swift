//
//  ExplanationView.swift
//  LimonIOS
//
//  Created by Marcos on 17/6/24.
//

import Foundation
import SwiftUI

struct ExplanationView: View {
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
                    
                    // Contenido principal dentro de un VStack
                    VStack(alignment: .center) {
                        Spacer()
                        Spacer()
                        
                        Image("HomeImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        Text("¡Te damos la bienvenida a la encuesta de satisfacción laboral!")
                            .foregroundColor(.red)
                            .bold()
                            .font(.title2)
                        ScrollView(.vertical){
                            ZStack{
                                Rectangle()
                                    .fill(Color.CustomGrey.opacity(0.80))
                                    .frame(width: .infinity , height: .infinity)
                                    .clipShape(
                                        .rect(
                                            topLeadingRadius: 10,
                                            bottomLeadingRadius: 0,
                                            bottomTrailingRadius: 0,
                                            topTrailingRadius: 10
                                        )
                                    )
                                VStack{
                                    Text("¿Por qué estamos aquí?")
                                        .font(.title3)
                                        .padding(.top)
                                    Text("Yo solo soy una abeja, no puedo saber por qué estás aquí, pero te puedo compartir mi motivación y ver cómo conecta contigo.")
                                        .padding()
                                }
                                
                            }
                            .frame(width: .infinity)
                            
                            ZStack{
                                Rectangle()
                                    .fill(Color.white.opacity(0.80))
                                    .frame(height: .infinity)
                                    .clipShape(
                                        .rect(
                                            bottomLeadingRadius: 30,
                                            bottomTrailingRadius: 30
                                        )
                                    )
                                VStack {
                                    ZStack{
                                        Text("Mi motivación es presentarte un LIMON como herramienta para que trabajemos más a gusto tanto de manera colectiva como individual. La función principal de este LIMÓN es que veamos las interrelaciones entre todos sus gajos que corresponden a nuestro ámbito laboral pero también vital. Vamos, ¿Me acompañas?")
                                            .padding()
                                        Spacer()
                                        Image("Bee")
                                            .resizable()
                                            .frame(width: 53, height: 52)
                                            .offset(x: 110, y: 110)
                                        
                                    }
                                    Spacer()
                                    
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("• La encuesta es anonima")
                                    .font(.title3)
                                    .padding(.top)
                                Text("• Tomate el tiempo necesario para responder con honestidad")
                                    .font(.title3)
                                    .padding(.top)
                                Text("• Tu participación es clave para nuestro continuo esfuerzo por mejorar. Agradecemos enormemente tu colaboración y sinceridad.")
                                    .font(.title3)
                                    .padding(.top)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            Spacer()
                            
                            
                        }
                        .frame(width: .infinity, height: .infinity)
                        
                        NavigationLink(destination: HomeExplanationView(tokenManager: _tokenManager )){
                            Text("Continuar")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.PrimaryCustom)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }
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
    ExplanationView()
        .environmentObject(TokenManager())
}
