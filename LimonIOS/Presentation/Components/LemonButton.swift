import SwiftUI

import SwiftUI

struct LemonButton: View {
    let numberOfSlices: Int
    let buttonCategories: Categories
    
    init(buttonCategories: Categories) {
        self.numberOfSlices = buttonCategories.count
        self.buttonCategories = buttonCategories
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let center = CGPoint(x: width / 2, y: height / 2)
            let radius = (min(width, height) / 2)
            ZStack {
                Image("LemonButtonBG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: radius * 2, height: radius * 2)
                    .position(x: center.x, y: center.y)
                
                ForEach(0..<numberOfSlices, id: \.self) { index in
                    let startAngle = Angle(degrees: (360 / Double(numberOfSlices)) * Double(index))
                    let endAngle = Angle(degrees: (360 / Double(numberOfSlices)) * Double(index + 1))
                    let midAngle = Angle(degrees: (startAngle.degrees + endAngle.degrees) / 2)
                    
                    let textPosition = CGPoint(
                        x: center.x + radius * 0.6 * CGFloat(cos(midAngle.radians)),
                        y: center.y + radius * 0.6 * CGFloat(sin(midAngle.radians))
                    )
                    
                    ZStack {
                        LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius)
                            .fill(buttonCategories[index].points == 0 ? Color.clear : Color.primary.opacity(0.4))
                            .overlay(
                                LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .contentShape(LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius))
                        
                        NavigationLink(destination: QuestionsView(viewModel: QuestionsViewModel(questions: mockedQuestions, useCase: QuestionsUseCase(), themeTitle: buttonCategories[index].text))) {
                            Text(buttonCategories[index].text)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .position(textPosition)
                                
                        }
                        .buttonStyle(PlainButtonStyle()) // Asegúrate de que el estilo del botón no cambie la apariencia
                    }
                }
            }
            .frame(width: width, height: height)
            .scaleEffect(1.5)
        }
        .frame(width: 200, height: 200) // Tamaño fijo del botón de limón
    }
}

struct LemonSliceShape: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let center: CGPoint
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: center)
        
        // Añadir un arco desde el ángulo de inicio hasta el ángulo de finalización con el radio especificado
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        // Cerrar la subruta para crear la forma de un gajo
        path.closeSubpath()
        
        return path
    }
}
