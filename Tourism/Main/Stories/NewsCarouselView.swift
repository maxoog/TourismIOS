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
                HStack {
                    ForEach(news.indices) { index in
                        ZStack {
                            AsyncImage(url: URL(string: "https://img3.akspic.ru/previews/9/6/1/9/6/169169/169169-ty_zasluzhivaesh_vsyacheskogo_schastya-schaste-strah-voda-polety_na_vozdushnom_share-500x.jpg"))
                                .frame(width: 104, height: 124)
                                .cornerRadius(16)
                                .overlay {
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
                        .onTapGesture {
                            onNewsIndexTap(index)
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
