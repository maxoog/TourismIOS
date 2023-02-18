import SwiftUI

struct LikeView: View {
    @State var isLiked: Bool
    
    let color: Color
    
    var body: some View {
        Button {
            isLiked.toggle()
        } label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundColor(color)
        }

    }
}
