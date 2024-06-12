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


    
    var body: some View{
        ZStack{
            Image("Background")
                      .resizable()
                      .scaledToFit()
                      .edgesIgnoringSafeArea(.all)
            Color.white.opacity(0.5)
            .edgesIgnoringSafeArea(.all)

          
                
                Spacer()
                Spacer()
            }
        }
      
    }

    

#Preview {
    BeeView()
        .environmentObject(TokenManager())
}


