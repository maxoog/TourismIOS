import SwiftUI

struct EventsListView: View {
    let events: [Event]
    let shortCards: Bool
    let onTap: (Event) -> Void
    
    init(events: [Event], shortCards: Bool = false, onTap: @escaping (Event) -> Void) {
        self.events = events
        self.shortCards = shortCards
        self.onTap = onTap
    }
    
    var body: some View {
        VStack {
            ForEach(events, id: \.id) { info in
                Button {
                    onTap(info)
                } label: {
                    if shortCards {
                        let index = events.firstIndex(where: {
                            $0 == info
                        })
                        BookingSnippetView(
                            name: info.name,
                            status: Event.bookingStatusArray[index ?? 0],
                            city: info.region,
                            date: info.timeRange.components(separatedBy: "-")[0],
                            photo: info.photos[0]
                        )
                    } else {
                        EventCardView(cardInfo: info)
                    }
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
