import SwiftUI

struct EventCardView: View {
    let cardInfo: Event
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                ZStack(alignment: .bottom) {
                    Image("icpc")
                        .resizable()
                        .frame(maxWidth: .greatestFiniteMagnitude)
                        .frame(height: 200)
                    
                    LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                        .frame(height: 50)
                }
                .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    HStack {
                        if cardInfo.hasVolunteering {
                            Text("Волонтерство")
                                .font(Design.Fonts.medium11)
                                .padding(5)
                                .foregroundColor(Design.Colors.darkBlue)
                                .padding(.horizontal, 20)
                                .background(Design.Colors.mainGreen)
                                .cornerRadius(9)
//                                .background(Design.Gradients.titleGradient, in: RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Spacer()
                        
                        LikeView(isLiked: false, color: .white)
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

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(cardInfo: Event.testArray[0])
    }
}
