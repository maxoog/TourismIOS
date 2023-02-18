import SwiftUI

struct LivingsListView: View {
    let livings: [Living]
    let onTap: (Living) -> Void
    
    var body: some View {
        VStack {
            ForEach(livings, id: \.id) { info in
                Button {
                    onTap(info)
                } label: {
                    LivingCardView(cardInfo: info)
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
