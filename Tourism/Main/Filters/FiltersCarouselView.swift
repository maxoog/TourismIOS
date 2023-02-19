//
//  FiltersCarouselView.swift
//  Tourism
//
//  Created by Maksim Zenkov on 19.02.2023.
//

import SwiftUI

struct FiltersCarouselView: View {
    let section: MainViewModel.ListType
    @Binding var valounteer: Bool
    
    var body: some View {
        let filters: [SearchFilter]
        if section == .eventSection {
            filters = SearchFilter.eventFilters
        } else {
            filters = SearchFilter.livingFilters
        }
        
        
        return
            ScrollView([.horizontal], showsIndicators: false) {
                HStack {
                    Spacer(minLength: 16)
                    ForEach(filters, id: \.id) { filter in
                        Button {
                            if filter == .volunteer {
                                withAnimation {
                                    valounteer.toggle()
                                }
                            }
                        } label: {
                            filterView(filter)
                        }
                        .buttonStyle(GrowingButton())
                    }
                    Spacer(minLength: 16)
                }
            }
            .padding(.vertical, 10)
            .defaultShadow()
    }
    
    private func filterView(_ filter: SearchFilter) -> some View {
        HStack(spacing: 8) {
            if filter == .volunteer {
                filterCheckMark
            }
            Text(filter.text)
                .foregroundColor(.black)
        }
        .frame(height: 40)
        .padding(.horizontal, 40)
        .background(.white)
        .cornerRadius(10)
    }
    
    private var filterCheckMark: some View {
        ZStack {
            Circle()
                .strokeBorder(.gray, lineWidth: 1)
                .background(Circle().fill(valounteer ? Design.Colors.mainGreen : Color.white))
                .frame(width: 20, height: 20)

            if valounteer {
                Image("checkMark")
                    .frame(width: 20, height: 20)
                    .scaleEffect(1.28)
                    .foregroundColor(.white)
                    .offset(x: 0, y: 3)
            }
        }
    }
}
