//
//  LivingBookCardView.swift
//  Tourism
//
//  Created by Maksim Zenkov on 18.02.2023.
//

import SwiftUI

struct LivingBookCardView: View {
    let cardInfo: Living
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image("testImage")
                    .resizable()
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        LikeView(isLiked: false, color: .white)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text(cardInfo.dormitoryName)
                        .font(Design.Fonts.bold16)
                        .padding()
                }
                .foregroundColor(.white)
            }
            
            HStack {
                HStack {
                    Image("geoIcon")
                    
                    Text(cardInfo.city)
                        .font(Design.Fonts.medium14)
                }
                
                Spacer()
                
                Text("от \(cardInfo.minDays)")
                    .font(Design.Fonts.medium14)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("Вариантов размещения: \(cardInfo.rooms.count)")
                Text("Стоимость: \(cardInfo.priceFrom) - \(cardInfo.priceTo ?? 0)₽")
            }
            .font(Design.Fonts.medium14)
            .foregroundColor(Design.Colors.lightGray)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(in: RoundedRectangle(cornerRadius: 20))
        .defaultShadow()
    }
}

struct LivingBookCardView_Previews: PreviewProvider {
    static var previews: some View {
        LivingBookCardView(cardInfo: Living.testArray[0])
    }
}
