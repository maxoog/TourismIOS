//
//  LivingBookCardView.swift
//  Tourism
//
//  Created by Maksim Zenkov on 18.02.2023.
//

import SwiftUI

enum BookStatus: String {
    case review = "На рассмотрении"
    case approved = "Заявка одобрена"
    case rejected = "Заявка отклонена"
}

struct BookingSnippetView: View {
    let name: String
    let status: BookStatus
    let city: String
    let date: String
    var photo: String? = nil
//    let onRemove: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                ZStack(alignment: .bottom) {
                    AsyncImage(url: URL(string: photo ?? "")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .greatestFiniteMagnitude)
                                .frame(height: 200)
                                .clipped()
                                .background(Design.Colors.lightGray)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .greatestFiniteMagnitude)
                                .frame(height: 200)
                                .clipped()
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .greatestFiniteMagnitude)
                                .frame(height: 200)
                                .clipped()
                                .background(Design.Colors.lightGray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                        .frame(height: 100)
                }
                .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    HStack {
                        statusView
                        
                        Spacer()
                        
                        LikeView(isLiked: false, color: .white)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text(name)
                        .font(Design.Fonts.bold16)
                        .padding()
                }
                .foregroundColor(.white)
            }
            
            HStack {
                HStack {
                    Image("geoIcon")
                    
                    Text(city)
                        .font(Design.Fonts.medium14)
                }
                
                Spacer()
                
                Text(date)
                    .font(Design.Fonts.medium14)
            }
            .padding()
        }
        .background(in: RoundedRectangle(cornerRadius: 20))
        .defaultShadow()
    }
    
    let statusColor: [BookStatus : Color] = [
        .rejected : .red,
        .review : .yellow,
        .approved : .green
    ]
    
    var statusView: some View {
        HStack {
            Circle()
                .frame(width: 7, height: 7)
                .foregroundColor(statusColor[status])
            Text(status.rawValue)
                .font(Design.Fonts.common16)
                .foregroundColor(.black)
        }
        .frame(width: 133, height: 28)
        .background(.white)
        .cornerRadius(9)
    }
}

struct LivingBookCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookingSnippetView(name: "База учебных практик \"Чарыш\"", status: .approved, city: "Барнаул", date: "27.04.2023")
    }
}
