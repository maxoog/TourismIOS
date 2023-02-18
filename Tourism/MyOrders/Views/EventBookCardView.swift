//
//  EventBookCardView.swift
//  Tourism
//
//  Created by Maksim Zenkov on 18.02.2023.
//

import SwiftUI

struct EventBookCardView: View {
    let cardInfo: Event
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image("icpc")
                    .resizable()
                    .frame(maxWidth: .greatestFiniteMagnitude)
                    .frame(height: 200)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    HStack {
                        if Int.random(in: 0...1) != 2 {
                            Text("Волонтерство")
                                .font(Design.Fonts.medium11)
                                .padding(5)
                                .foregroundColor(Design.Colors.darkBlue)
                                .background(Design.Gradients.titleGradient, in: RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Spacer()
                        
                        LikeView(isLiked: false)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text(cardInfo.name)
                        .font(Design.Fonts.bold16)
                        .padding()
                }
                .foregroundColor(.white)
            }
            
            HStack {
                HStack {
                    Image("geoIcon")
                    
                    Text(cardInfo.region)
                        .font(Design.Fonts.medium14)
                }
                
                Spacer()
                
                Text(cardInfo.timeRange)
                    .font(Design.Fonts.medium14)
            }
            .padding(.horizontal)
            
            Text("Стоимость: \(cardInfo.price)₽")
                .font(Design.Fonts.medium14)
                .foregroundColor(Design.Colors.lightGray)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .background(in: RoundedRectangle(cornerRadius: 20))
        .defaultShadow()
    }
}

struct EventBookCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventBookCardView(cardInfo: Event.testArray[0])
    }
}
