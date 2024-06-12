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
            
            // Calculate the center point of the container
            let center = CGPoint(x: width / 2, y: height / 2)
            
            // Calculate the radius of the circle
            // Use the minimum value between width and height to ensure the circle fits within the container
            let radius = min(width, height) / 2 * 1.5
            
            ZStack {
                
                Image("LemonButtonBG")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .position(x: center.x, y: center.y) // Centra la imagen en el centro del contenedor
                        .frame(width: radius * 2, height: radius * 2)
                
                ForEach(0..<numberOfSlices, id: \.self) { index in
                    
                    let startAngle = Angle(degrees: (360 / Double(numberOfSlices)) * Double(index))
                    let endAngle = Angle(degrees: (360 / Double(numberOfSlices)) * Double(index + 1))
                    
                    let midAngle = Angle(degrees: (startAngle.degrees + endAngle.degrees) / 2)
                    
                    // Calcula la posición del texto dentro del gajo
                    // center.x y center.y son las coordenadas del centro del círculo
                    // radius * 0.7 determina la distancia del texto desde el centro (0.7 veces el radio)
                    // cos(midAngle.radians) y sin(midAngle.radians) calculan las coordenadas x e y
                    // correspondientes al ángulo medio del gajo
                    let textPosition = CGPoint(
                        x: center.x + radius * 0.7 * CGFloat(cos(midAngle.radians)),
                        y: center.y + radius * 0.7 * CGFloat(sin(midAngle.radians))
                    )
                    
                    NavigationLink(destination: QuestionsView(viewModel: QuestionsViewModel(questions: mockedQuestions, useCase: QuestionsUseCase(), themeTitle: lemonButtonCat[index].name))) {
                        ZStack {
                            LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius)
                                .fill(lemonButtonCat[index].points == 0 ? Color.clear : Color.PrimaryCustom.opacity(0.7))
                                .overlay(
                                    LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius)
                                        .stroke(Color.red, lineWidth: 2)
                                )
                                .contentShape(LemonSliceShape(startAngle: startAngle, endAngle: endAngle, center: center, radius: radius))
                            if index < lemonButtonCat.count {
                                Text(lemonButtonCat[index].name)
                                    .foregroundColor(.black)
                                //Uncomment if you want to rotate the text
                                   // .rotationEffect(-midAngle, anchor: .center)
                                    .position(textPosition)
                            }
                        }
                    }
                    }
                                 
                .frame(width: width, height: height)
            }
        }
        .frame(width: 200, height: 200)
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
}
