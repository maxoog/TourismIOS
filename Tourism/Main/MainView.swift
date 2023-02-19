import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 80)
                
                // MARK: - News stories
                NewsCarouselView(news: viewModel.news, onNewsIndexTap: viewModel.showStories)
                
                // MARK: - Toggle search type
                VStack(alignment: .leading) {
                    Picker("", selection: $viewModel.activeSection) {
                        ForEach(MainViewModel.ListType.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.top, 15)
                .padding(.horizontal, 20)
                
                FiltersCarouselView(section: viewModel.activeSection, valounteer: $viewModel.volounteerFilter)
                
                // MARK: - Avaliable cards
                VStack(alignment: .leading) {
                    if viewModel.activeSection == .eventSection {
                        HStack {
                            Text("Найдено вариантов:")
                                .foregroundColor(Design.Colors.darkBlue)
                            
                            Text("\(viewModel.events.count)")
                                .foregroundColor(Design.Colors.mainGreen)
                        }
                        .font(Design.Fonts.bold)
                        .padding(.leading, 20)
                        .padding(.bottom)
                        
                        EventsListView(events: viewModel.events, onTap: viewModel.eventTap)
                            .padding(.horizontal, 20)
                    } else {
                        HStack {
                            Text("Найдено вариантов:")
                                .foregroundColor(Design.Colors.darkBlue)
                            
                            Text("\(viewModel.livings.count)")
                                .foregroundColor(Design.Colors.mainGreen)
                        }
                        .font(Design.Fonts.bold)
                        .padding(.leading, 20)
                        .padding(.bottom)
                        
                        LivingsListView(livings: viewModel.livings, onTap: viewModel.livingTap(living:))
                            .padding(.horizontal, 20)
                    }
                }
            }
            
            Spacer(minLength: 100)
        }
        .fullScreenCover(item: $viewModel.showedEvent, onDismiss: viewModel.dismissAllCards) { event in
            screenFactory.eventFullScreen(event: event, dismiss: { viewModel.showedEvent = nil })
        }
        .fullScreenCover(item: $viewModel.showedLiving, onDismiss: viewModel.dismissAllCards) { living in
            FullScreenLivingView(living: living)
        }
        .fullScreenCover(item: $viewModel.showStoriesFromIndex, content: { index in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                screenFactory.newsScreen(
                    news: viewModel.news,
                    firstNewsIndex: index,
                    dismiss: viewModel.dismissStories
                )
            }
            .transition(.opacity.animation(.easeInOut(duration: 0.2)))
            .ignoresSafeArea()
        })

        .background(Design.Colors.back)
        .onAppear {
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.white
            UISegmentedControl.appearance().backgroundColor = UIColor(Design.Colors.pickerBg)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Design.Colors.darkBlue)], for: .normal)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Design.Colors.darkBlue)], for: .selected)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
