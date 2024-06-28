//
//  ContentView.swift
//  LimonIOS
//
//  Created by Marcos on 8/5/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var tokenManager: TokenManager
    let keychain: KeychainProtocol = Keychain()
    var body: some View{
        VStack{
            if(!tokenManager.token.isEmpty || tokenManager.token != ""){
                if(keychain.getKey(key: FIRST_TIME_KEY).isEmpty){
                    BeeView(tokenManager: _tokenManager)
                }else{
                    HomeView(tokenManager: tokenManager)
                }
            }else{
                LoginView(tokenManager: tokenManager)
            }
        }
    }
}


#Preview {
    ContentView()
}
