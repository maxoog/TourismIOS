import SwiftUI

struct NewsCarouselView: View {
    @ObservedObject var tabBarViewModel: NavigationController = NavigationController.shared
    
    @State var news: [News]
    let onNewsIndexTap: (Int) -> Void
    
    private var header: some View {
        Text("Новости")
            .foregroundColor(Design.Colors.mainText)
            .fontWeight(.semibold)
            .font(.title2)
            .padding(.leading, 20)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            
            ScrollView([.horizontal], showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(news.indices) { index in
                        Button {
                            onNewsIndexTap(index)
                        } label: {
                            ZStack {
                                Image(news[index].previewPhoto)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 94, height: 118)
                                    .cornerRadius(10)
                                .overlay {
                                    ZStack(alignment: .bottom) {
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            HStack {
                                                Text(news[index].title)
                                                    .font(Design.Fonts.newsSmallFont)
                                                    .foregroundColor(.white)
                                                    .padding(.bottom, 6)
                                                    .padding(.leading, 10)
                                                    .padding(.trailing, 8)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                            }
                            .cornerRadius(16)
                        }
                        .shadow(color: .black.opacity(0.5), radius: 2)
                    }
                }
            }
            .padding(.vertical, 13)
            .padding(.leading, 16)
        }
    }
}
        
struct NewsCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCarouselView(news: News.testArray, onNewsIndexTap: {index in})
    }
}
