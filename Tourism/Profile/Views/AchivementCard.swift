//
//  AchivementCard.swift
//  Tourism
//
//  Created by Данила Семисчастнов on 18.02.2023.
//

import SwiftUI

struct AchivementCard: View {
    let cardInfo: Achivement
    
    @State var progress: CGFloat = 0
    
    var body: some View {
        HStack {
            ZStack {
                Image(cardInfo.icon)
                
                ActivityRingView(progress: $progress)
                    .padding()
            }
            
            VStack(alignment: .leading) {
                Text(cardInfo.title)
                    .font(Design.Fonts.bold14)
                    .foregroundColor(Design.Colors.darkBlue)
                
                Text(cardInfo.description)
                    .font(Design.Fonts.medium11)
                    .foregroundColor(Design.Colors.lightGray)
                    .padding(.bottom, 10)
                
                Text("+ \(cardInfo.reward) очков опыта")
                    .font(Design.Fonts.bold12)
                    .foregroundColor(Design.Colors.lightViolet)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.spring()) {
                    progress = CGFloat(cardInfo.current) / CGFloat(cardInfo.avaliable)
                }
            }
        }
    }
}

struct AchivementCard_Previews: PreviewProvider {
    static var previews: some View {
        AchivementCard(cardInfo: Achivement(
            title: "Фантастические места",
            description: "Посетите главные природные достопримечательности России",
            icon: "achivementIcon",
            current: 4,
            avaliable: 10,
            reward: 240
        ))
    }
}
