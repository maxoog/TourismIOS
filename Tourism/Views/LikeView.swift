import SwiftUI

struct LikeView: View {
    @State var isLiked: Bool
    
    var body: some View {
        Button {
            isLiked.toggle()
        } label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .foregroundColor(isLiked ? Design.Colors.red : .gray)
        }

    }
}
