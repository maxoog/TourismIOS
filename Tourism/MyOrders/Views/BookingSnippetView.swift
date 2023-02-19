//
//  LivingBookCardView.swift
//  Tourism
//
//  Created by Maksim Zenkov on 18.02.2023.
//

import SwiftUI

enum BookStatus {
    case review
    case approved
    case rejected
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
                Image(photo ?? "testImage")
                    .resizable()
                
                VStack(alignment: .leading) {
                    HStack {
                        statusView
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("points")
                        }
                        .contentShape(Circle())

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
            .padding(.horizontal)
            .padding(.bottom, 16)
            .padding(.top, 8)
        }
        .background(in: RoundedRectangle(cornerRadius: 20))
        .defaultShadow()
    }
    
    var statusView: some View {
        HStack {
            Circle()
                .frame(width: 7, height: 7)
                .foregroundColor(status == .review ? Design.Colors.yellow : Design.Colors.mainGreen)
            Text(status == .review ? "На рассмотрении" : "Подтверждено")
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
