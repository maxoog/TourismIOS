import SwiftUI

struct LivingsListView: View {
    let livings: [Living]
    let shortCards: Bool
    let onTap: (Living) -> Void
    
    init(livings: [Living], shortCards: Bool = false, onTap: @escaping (Living) -> Void) {
        self.livings = livings
        self.shortCards = shortCards
        self.onTap = onTap
    }
    
    var body: some View {
        VStack {
            ForEach(livings, id: \.id) { info in
                Button {
                    onTap(info)
                } label: {
                    if shortCards {
                    LivingBookCardView(cardInfo: info)
                    } else {
                        LivingCardView(cardInfo: info)
                    }
                }
                .buttonStyle(.plain)
                .padding(.bottom)
            }
        }
    }
}

struct LivingsListView_Previews: PreviewProvider {
    static var previews: some View {
        LivingsListView(livings: Living.testArray, onTap: {_ in})
    }
}
