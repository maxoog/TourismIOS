import SwiftUI

struct SingleNewsView: View {
    let news: News
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                Image(news.backgroundPhoto)
                    .resizable()
                    .scaledToFill()
                    .frame(width: gr.size.width, height: gr.size.height, alignment: .center)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(news.title)
                            .foregroundColor(.white)
                            .font(Design.Fonts.bold24)
                            .padding(.trailing, 50)
                        Text(news.description)
                            .foregroundColor(.white)
                            .font(Design.Fonts.medium14)
                    }
                    .padding(.horizontal, 16)
                    .multilineTextAlignment(.leading)
                    
                    Button {
                        
                    } label: {
                        Text("Подробнее")
                            .foregroundColor(.black)
                            .frame(maxWidth: .greatestFiniteMagnitude)
                            .frame(height: 56)
                            .background(.white)
                            .cornerRadius(16)
                            .padding(16)
                    }
                    .padding(.bottom, 16)
                    
                }
                
            }
        }
    }
}

struct SingleNewsView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNewsView(news: News.testArray[0])
    }
}
