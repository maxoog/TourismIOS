import SwiftUI

struct MyOrdersView: View {
    @ObservedObject var viewModel: MyOrdersViewModel
    
    var body: some View {
        ZStack {
            Design.Colors.back
                .ignoresSafeArea()
            
            List {
                VStack(alignment: .leading) {
                    Picker("", selection: $viewModel.activeSection) {
                        ForEach(MainViewModel.ListType.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                    .frame(maxWidth: .greatestFiniteMagnitude)
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal, 16)
                .listRowSeparator(.hidden, edges: .all)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(.vertical, 16)
                .background(Design.Colors.back)
                
                VStack(alignment: .leading) {
                    if viewModel.activeSection == .eventSection {
                        EventsListView(events: viewModel.bookingEvents, shortCards: true,  onTap: viewModel.eventTap)
                            .padding(.horizontal, 16)
                            .background(Design.Colors.back)
                    } else {
                        LivingsListView(livings: viewModel.livings, shortCards: true,  onTap: viewModel.livingTap)
                            .padding(.horizontal, 16)
                            .background(Design.Colors.back)
                    }
                    Spacer(minLength: 50)
                }
                .listRowSeparator(.hidden, edges: .all)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .scrollIndicators(.hidden, axes: [.vertical])
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .padding(.top, 64)
            .refreshable {
                viewModel.refresh()
            }
            .fullScreenCover(item: $viewModel.showedEvent, onDismiss: viewModel.dismissAllCards) { event in
                screenFactory.eventFullScreen(event: event, dismiss: { viewModel.showedEvent = nil })
            }
            .fullScreenCover(item: $viewModel.showedLiving, onDismiss: viewModel.dismissAllCards) { living in
                screenFactory.livingFullScreen(living: living, dismiss: { viewModel.showedLiving = nil })
            }
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
