//
//  QuestionsView.swift
//  LimonIOS
//
//  Created by Marcos on 1/6/24.
//

import SwiftUI

struct QuestionsView: View {
    
    @EnvironmentObject var tokenManager: TokenManager
    
    @ObservedObject var vm: QuestionsViewModel
      
      init(viewModel: QuestionsViewModel) {
          self.vm = viewModel
      }
    
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .edgesIgnoringSafeArea(.all)
                    Color.white.opacity(0.8)
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .leading) {
                        Spacer()
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 239, height: 40)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 0,
                                        bottomLeadingRadius: 0,
                                        bottomTrailingRadius: 50,
                                        topTrailingRadius: 50
                                    )
                                )
                            Text(vm.themeTitle)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Spacer()
                        QuestionComponent(text: vm.questions[vm.selectedQuestion].text,
                                          selectedOption: $vm.selectedOption)
                        Text("De una escala del 1  al  5  donde 1  es muy insatisfecho y  5 es muy satisfecho. Responda las siguiente pregunta:  ")
                            .fontWeight(.thin)
                            .padding()
                        
                        if((vm.selectedQuestion + 1) >= vm.questions.count){
                            NavigationLink(destination: HomeView()){Text("Finalizar")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.PrimaryCustom)
                                    .cornerRadius(10)
                                .foregroundColor(.black)}.padding()
                        }else{
                            Button(action: {
                                vm.onPressButton()
                            }) {Text("Siguiente")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.PrimaryCustom)
                                    .cornerRadius(10)
                                .foregroundColor(.black)}.padding()
                        }
                        Spacer()
                        
                    }
                }
                .navigationTitle("Questions")
                .navigationDestination(isPresented: $vm.navigateHome) {
                    HomeView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
    

#Preview {
    QuestionsView(viewModel: QuestionsViewModel(questions: mockedQuestions, useCase: QuestionsUseCase(), themeTitle: "Salud y bienestar"))
        .environmentObject(TokenManager())
}
