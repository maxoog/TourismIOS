import SwiftUI

struct FullScreenEventsView: View {
    let event: Event
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FullScreenEventsView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenEventsView(event: Event.testArray[0])
    }
}
