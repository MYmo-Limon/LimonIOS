//
//  QuestionsViewModel.swift
//  LimonIOS
//
//  Created by Marcos on 10/6/24.
//

import Foundation
import Combine

final class QuestionsViewModel: ObservableObject {
    @Published var questions: Questions
    @Published var selectedQuestion: Int = 0
    @Published var selectedOption: Int = 0
    @Published var themeTitle: String
    private let useCase: UseCaseQuestionsProtocol

    
    init(questions: Questions, useCase: UseCaseQuestionsProtocol, themeTitle: String) {
        self.questions = questions
        self.useCase = useCase
        self.themeTitle = themeTitle
    }
    
    func saveResponses(){
        
    }
    
    func onPressButton(){
        
        
        questions[selectedQuestion].points = (selectedOption + 1)
        if(selectedQuestion + 1 < questions.count){
            selectedQuestion += 1
        }else{
            //TODO: Go to next view
        }
        
        print(questions)
    }
}
