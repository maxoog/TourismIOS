import SwiftUI

struct EventCardView: View {
    let cardInfo: Event
//    @Binding var liked: Bool
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image("testImage")
                    .resizable()
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        LikeView(isLiked: false)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text(cardInfo.name)
                        .fontWeight(.semibold)
                        .padding(10)
                }
                .foregroundColor(.white)
            }
            
            HStack {
                HStack {
                    Image("geoIcon")
                    
                    Text(cardInfo.region)
                        .font(.caption)
                }
                
                Spacer()
                
                Text(cardInfo.timeRange)
                    .font(.caption)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            Text("Стоимость: \(cardInfo.price)₽")
                .font(.caption)
                .opacity(0.5)
                .padding(.horizontal, 10)
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
