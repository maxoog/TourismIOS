import SwiftUI

struct MyOrdersView: View {
    @ObservedObject var viewModel: MyOrdersViewModel
    
    var body: some View {
        List {
            Section(header: Text("Livings")) {
                ForEach(viewModel.livings) { living in
                    Text(living.meal)
                }
            }
            
            Section(header: Text("Events")) {
                ForEach(viewModel.events) { event in
                    Text(event.name)
                }
            }
        }
        .padding(.top, 30)
        .refreshable {
            viewModel.refresh()
        }
    }
}

struct MyOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        MyOrdersView(viewModel: .init(booksService: .init(client: .init())))
    }
}

extension String: Identifiable {
    public var id: Int {
        hashValue
    }
    
    
}
