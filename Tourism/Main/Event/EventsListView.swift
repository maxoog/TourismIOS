import SwiftUI

struct EventsListView: View {
    let events: [Event]
    let onTap: (Event) -> Void
    
    var body: some View {
        VStack {
            ForEach(events, id: \.id) { info in
                Button {
                    onTap(info)
                } label: {
                    EventCardView(cardInfo: info)
                }
                .buttonStyle(.plain)
                .padding(.bottom)
            }
        }
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView(events: Event.testArray, onTap: {_ in})
    }
}
