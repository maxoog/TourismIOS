import SwiftUI

struct FullScreenEventsView: View {
    let event: Event
    
    let service: SearchService
    
    @State var price: Int = 0
    
    var body: some View {
        VStack {
            Image("testImage")
//                .resizable()
            
            Text(event.name)
            
            Text("Стоимость поездки: \(price)")
        }
        .onAppear {
//            service.getTrainPrice(for: TrainRequest(frm: "Москва", to: event.region, date: "18.02.2023")) { newPrice in
//                price = newPrice
//            }
        }
    }
}

struct FullScreenEventsView_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.eventFullScreen(event: Event.testArray[0])
    }
}
