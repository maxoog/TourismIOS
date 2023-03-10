import SwiftUI

struct FullScreenEventsView: View {
    let event: Event
    let service: SearchService
    let dismiss: () -> Void
    
    @State var trainPrice: Int = 0
    @State var planePrice: Int = 0
    @State var currentIndex: Int = 1
    @State var showSharingSheet: Bool = false
    
    let count: Int = 4
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                Spacer(minLength: 320)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("geoIcon")
                            
                            VStack {
                                Text("\(event.region)")
                                    .font(Design.Fonts.medium14)
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image("planeIcon")
                                
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom) {
                                        Text("от")
                                            .font(Design.Fonts.medium14)
                                            .opacity(0.5)
                                        Text("\(planePrice)₽")
                                            .font(Design.Fonts.bold)
                                    }
                                    Text("авиасейлс")
                                        .font(Design.Fonts.medium11)
                                        .opacity(0.5)
                                }
                                .foregroundColor(Design.Colors.darkBlue)
                                
                                Spacer()
                                
                                Image("backIcon")
                                    .rotationEffect(.degrees(180))
                            }
                            HStack {
                                Image("trainIcon")
                                    .padding(.trailing, 12)
                                
                                VStack(alignment: .leading) {
                                    HStack(alignment: .bottom) {
                                        Text("от")
                                            .font(Design.Fonts.medium14)
                                            .opacity(0.5)
                                        Text("\(trainPrice)₽")
                                            .font(Design.Fonts.bold)
                                    }
                                    Text("ржд")
                                        .font(Design.Fonts.medium11)
                                        .opacity(0.5)
                                }
                                .foregroundColor(Design.Colors.darkBlue)
                                
                                Spacer()
                                
                                Image("backIcon")
                                    .rotationEffect(.degrees(180))
                            }
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .defaultShadow()
                    
                    HStack {
                        Text("Стоимость:")
                            .font(Design.Fonts.bold)

                        Spacer()

                        Text(event.price == "0" ? "Бесплатно" : "\(event.price)₽")
                            .font(Design.Fonts.bold12)
                            .foregroundColor(Design.Colors.lightViolet)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .defaultShadow()
                    
                    VStack(alignment: .leading) {
                        Text("Описание")
                            .font(Design.Fonts.bold)
                            .padding(.bottom, 10)
                        Text(event.description)
                            .font(Design.Fonts.medium14)
                            .foregroundColor(.black.opacity(0.6))
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .defaultShadow()
                }
                
                Spacer(minLength: 120)
            }
            
            VStack {
                GeometryReader { gr in
                    ZStack(alignment: .top) {
                        TabView {
                            ForEach(event.photos, id: \.self) { photoUrl in
                                ZStack(alignment: .bottom) {
                                    AsyncImage(url: URL(string: photoUrl)) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                                .frame(width: gr.size.width, height: 300)
                                                .clipped()
                                                .background(Design.Colors.lightGray)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: gr.size.width, height: 300)
                                                .clipped()
                                        case .failure:
                                            Image(systemName: "photo")
                                                .frame(width: gr.size.width, height: 300)
                                                .clipped()
                                                .background(Design.Colors.lightGray)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .edgesIgnoringSafeArea(.top)
                                    
                                    LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                                        .frame(height: 100)
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image("backIcon")
                                        .padding(5)
                                        .background(.white, in: Circle())
                                }
                                
                                Spacer()
                                
                                Text("\(currentIndex) / \(count)")
                                    .font(Design.Fonts.medium11)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 10)
                                    .background(.black.opacity(0.3), in: RoundedRectangle(cornerRadius: 20))
                                
                                Spacer()
                                
                                ShareLink(item: "https://xn--d1agcrrehbhc.xn--p1ai/events/WkC61h8Pj1") {
                                    Image("shareIcon")
                                        .padding(5)
                                        .background(.white, in: Circle())
                                }
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text(event.timeRange)
                                    .font(Design.Fonts.medium12)
                                    .foregroundColor(.white)
                                
                                Text(event.name)
                                    .font(Design.Fonts.bold16)
                                    .foregroundColor(.white)
                            }
                        }
                        .zIndex(2)
                        .padding(.top, 60)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                .edgesIgnoringSafeArea(.top)
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Оставить заявку")
                            .foregroundColor(.black)
                            .font(Design.Fonts.semiBoldMedium)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Design.Gradients.buttonGradient, in: RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 30)
                .background(.white)
                .frame(maxWidth: .infinity)
            }
        }
        .background(Design.Colors.back)
        .edgesIgnoringSafeArea([.top, .bottom])
        .onAppear {
            service.getTrainPrice(for: TrainRequest(frm: "Москва", to: event.region, date: "18.02.2023")) { newPrice in
                trainPrice = newPrice
            }
            service.getPlanePrice(for: PlaneRequest(frm: "Москва", to: event.region)) { newPrice in
                planePrice = newPrice
            }
        }
    }
}

struct FullScreenEventsView_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.eventFullScreen(event: Event.testArray[0], dismiss: {})
    }
}
