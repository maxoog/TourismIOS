import SwiftUI

struct LoadingRectangle: View {
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { gr in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.white.opacity(0.3))
                    .cornerRadius(5)
                
                Rectangle()
                    .frame(width: gr.size.width * progress, height: nil, alignment: .leading)
                    .foregroundColor(.white.opacity(0.9))
                    .cornerRadius(5)
            }
        }
    }
}

struct LoadingRectangle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingRectangle(progress: 0.5)
    }
}
