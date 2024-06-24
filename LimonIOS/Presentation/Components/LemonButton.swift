import SwiftUI

struct LemonButton: View {
    let numberOfSlices: Int
    let lemonButtonCat: LemonButtonCategories
    
    init(lemonButtonCat: LemonButtonCategories) {
        self.numberOfSlices = lemonButtonCat.count
        self.lemonButtonCat = lemonButtonCat
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let center = CGPoint(x: width / 2, y: height / 2)
            let radius = min(width, height) / 2 * 1.5
            
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
                    
                    // Calculate the position of the text inside the slice
                    let textPosition = CGPoint(
                        x: center.x + radius * 0.6 * CGFloat(cos(midAngle.radians)),
                        y: center.y + radius * 0.6 * CGFloat(sin(midAngle.radians))
                    )
                    
                    NavigationLink(destination: QuestionsView(viewModel: QuestionsViewModel(questions: mockedQuestions, useCase: QuestionsUseCase(), themeTitle: lemonButtonCat[index].name))) {
                        ZStack {
                            LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius)
                                .fill(lemonButtonCat[index].points == 0 ? Color.clear : Color.PrimaryCustom.opacity(0.4))
                                .overlay(
                                    LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .contentShape(LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius))
                            
                            Text(lemonButtonCat[index].name)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .position(textPosition)
                        }
                    }
                }
            }
            .frame(width: width, height: height)
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

