//
//  QuestionComponent.swift
//  LimonIOS
//
//  Created by Marcos on 4/6/24.
//

import SwiftUI
struct QuestionComponent: View {
    @Binding var selectedOption: Int // Cambiado a Binding
    var text :String
    
    init(text: String, selectedOption: Binding<Int>) {
         self.text = text
        _selectedOption = selectedOption // Inicializa el binding
     }
    
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color.gray, lineWidth: 1)
                .cornerRadius(10, antialiased: true)
                .frame(height: 204)
            
            VStack(spacing: 0) {
                ZStack{
                    Rectangle()
                        .fill(Color.CustomGrey.opacity(0.80))
                        .frame(height: 104)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 10,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 10
                            )
                        )
                    
                    Text(text)
                        .padding()
                }
                ZStack{
                    Rectangle()
                        .fill(Color.white.opacity(0.80))
                        .frame(height: 104)
                        .clipShape(
                            .rect(
                                bottomLeadingRadius: 10,
                                bottomTrailingRadius: 10
                            )
                        )
                    VStack {
                        SegmentedPicker(selectedSegment: $selectedOption,segments: ["1", "2", "3", "4", "5"])
                            .padding()
                        
                    }
                }
            }
        }
        .padding()
    }
}





#Preview {
    QuestionComponent(text: "¿Cómo calificarías tu nivel de satisfacción con el ambiente laboral y su impacto en tu salud física y mental?", selectedOption: .constant(0))
}

