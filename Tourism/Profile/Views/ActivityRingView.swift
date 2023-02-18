import SwiftUI

struct ActivityRingView: View {
    @Binding var progress: CGFloat
    
    var colors: [Color] = [Design.Colors.mainGreen, Design.Colors.mainGreen]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.white, style: StrokeStyle(lineWidth: 10, lineCap: .round))
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(-360),
                        endAngle: .degrees(0)
                    ),
                    style: StrokeStyle(lineWidth: 10, lineCap: .round)
            ).rotationEffect(.degrees(-90))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(progress > 0.95 ? colors[1]: colors[0].opacity(0))
                .rotationEffect(Angle.degrees(360 * Double(progress)))
                .shadow(color: progress > 0.96 ? Color.black.opacity(0.1): Color.clear, radius: 3, x: 4, y: 0)
        }.frame(idealWidth: 80, idealHeight: 80, alignment: .center)
    }
}

struct ActivityRingView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRingView(progress: .constant(0.6))
    }
}
