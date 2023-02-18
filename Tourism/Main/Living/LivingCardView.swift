import SwiftUI

struct LivingCardView: View {
    let cardInfo: Living
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image("testImage")
                    .resizable()
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("favouriteIcon")
                                .padding(7)
                                .background(.ultraThinMaterial, in: Circle())
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text(cardInfo.dormitoryName)
                        .fontWeight(.semibold)
                        .padding(10)
                }
                .foregroundColor(.white)
            }
            
            HStack {
                HStack {
                    Image("geoIcon")
                    
                    Text(cardInfo.dormitoryName)
                        .font(.caption)
                }
                
                Spacer()
                
                Text("от \(cardInfo.minDays)")
                    .font(.caption)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            
            VStack(alignment: .leading) {
                Text("Вариантов размещения: \(cardInfo.rooms.count)")
                Text("Стоимость: \(cardInfo.priceFrom) - \(cardInfo.priceTo ?? 0)₽")
            }
            .font(.caption)
            .opacity(0.5)
            .padding(.horizontal, 10)
            .padding(.bottom)
        }
        .background(in: RoundedRectangle(cornerRadius: 20))
        .defaultShadow()
    }
}

struct LivingCardView_Previews: PreviewProvider {
    static var previews: some View {
        LivingCardView(cardInfo: Living.testArray[0])
    }
}
