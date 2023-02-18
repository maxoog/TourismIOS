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
        VStack(alignment: .leading, spacing: 13) {
            header
            
            ScrollView([.horizontal], showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(news.indices) { index in
                        Button {
                            onNewsIndexTap(index)
                        } label: {
                            ZStack {
                                AsyncImage(url: URL(string: news[index].photo)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 104, height: 124)
                                            .background(Design.Colors.lightGray)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 104, height: 124)
                                    case .failure:
                                        Image(systemName: "photo")
                                            .frame(width: 104, height: 124)
                                            .background(Design.Colors.lightGray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 104, height: 124)
                                .overlay {
                                    ZStack(alignment: .bottom) {
                                        LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                                            .frame(height: 40)
                                        
                                        VStack(alignment: .leading) {
                                            Spacer()
                                            HStack {
                                                Text(news[index].title)
                                                    .font(Design.Fonts.newsSmallFont)
                                                    .foregroundColor(.white)
                                                    .padding(.bottom, 10)
                                                    .padding(.leading, 10)
                                                Spacer()
                                            }
                                        }
                                    }
                                }
                            }
                            .cornerRadius(16)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
        
struct NewsCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCarouselView(news: News.testArray, onNewsIndexTap: {index in})
    }
}
