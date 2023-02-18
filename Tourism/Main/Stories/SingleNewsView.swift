//
//  SingleNewsView.swift
//  Tourism
//
//  Created by Maksim Zenkov on 18.02.2023.
//

import SwiftUI

struct SingleNewsView: View {
    let news: News
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                ZStack(alignment: .bottom) {
                    AsyncImage(url: URL(string: news.photo)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: gr.size.width, height: gr.size.height)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                        .frame(height: 300)
                }
                
                VStack {
                    Spacer()
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(news.title)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .font(Design.Fonts.bold24)
                            .padding(.trailing, 50)
                        Text(news.description)
                            .foregroundColor(.white)
                            .font(Design.Fonts.medium14)
                    }
                    .padding(.horizontal, 16)
                    
                    Button {
                        
                    } label: {
                        Text("Подробнее")
                            .foregroundColor(.black)
                            .frame(maxWidth: .greatestFiniteMagnitude)
                            .frame(height: 56)
                        //                        .padding(.horizontal, 16)
                            .background(.white)
                            .cornerRadius(16)
                            .padding(16)
                    }
                    //                .padding(.bottom, 16)
                    
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
