import SwiftUI
import MapKit

struct FullScreenLivingView: View {
    let living: Living
    let service: SearchService
    let dismiss: () -> Void
    
    @State var trainPrice: Int = 0
    @State var planePrice: Int = 0
    @State var currentIndex: Int = 1
    @State var showSharingSheet: Bool = false
    
    @State var showMap: Bool = false
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State var location: MapMarker = MapMarker(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), tint: .red)
    
    let count: Int = 4
    
    var body: some View {
        ZStack {
            ScrollView {
                Spacer(minLength: 320)
                
                VStack(alignment: .leading) {
                    Button {
                        withAnimation(.spring()) {
                            showMap = true
                            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(living.coordinates[0]) ?? 0, longitude: Double(living.coordinates[1]) ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                            location = MapMarker(coordinate: CLLocationCoordinate2D(latitude: Double(living.coordinates[0]) ?? 0, longitude: Double(living.coordinates[1]) ?? 0), tint: .red)
                        }
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Image("geoIcon")
                                    .padding(.trailing)
                                
                                VStack(alignment: .leading) {
                                    Text("\(living.city)")
                                        .font(Design.Fonts.medium14)
                                        .foregroundColor(.black)
                                    Text("\(living.street), \(living.houseNumber)")
                                        .font(Design.Fonts.medium14)
                                        .foregroundColor(Design.Colors.lightGray)
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
                            
                            Text("Посмотреть на карте")
                                .font(Design.Fonts.bold11)
                                .foregroundColor(Design.Colors.lightGray)
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity)
                        .background(.white, in: RoundedRectangle(cornerRadius: 20))
                        .padding(.bottom, 10)
                        .padding(.horizontal)
                        .defaultShadow()
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Комнаты")
                            .font(Design.Fonts.bold)
                            .padding(.bottom, 10)
                        
                        ForEach(living.rooms, id: \.self) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(item.price)₽")
                                        .padding(.trailing)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.type)
                                            .font(Design.Fonts.bold14)
                                            .padding(.bottom, 5)
                                        Text(item.description)
                                            .font(Design.Fonts.bold11)
                                            .foregroundColor(Design.Colors.lightGray)
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Design.Colors.lightViolet.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .defaultShadow()
                    
                    VStack(alignment: .leading) {
                        Text("Условия")
                            .font(Design.Fonts.bold)
                            .padding(.bottom, 10)
                        
                        ForEach(living.services, id: \.self) { item in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(item.price)₽")
                                        .padding(.trailing)
                                    
                                    VStack {
                                        Text(item.name)
                                            .font(Design.Fonts.bold14)
                                            .padding(.bottom, 5)
                                        Text(item.description)
                                            .font(Design.Fonts.bold11)
                                            .foregroundColor(Design.Colors.lightGray)
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Design.Colors.lightViolet.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .defaultShadow()
                }
            }
            
            VStack {
                GeometryReader { gr in
                    ZStack(alignment: .top) {
                        TabView {
                            ForEach(living.photo, id: \.self) { photoUrl in
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
//                                Text(living.timeRange)
//                                    .font(Design.Fonts.medium12)
//                                    .foregroundColor(.white)
//
//                                Text(living.name)
//                                    .font(Design.Fonts.bold16)
//                                    .foregroundColor(.white)
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
        .fullScreenCover(isPresented: $showMap, content: {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            showMap = false
                        } label: {
                            Image(systemName: "xmark")
                                .padding()
                                .background(.ultraThinMaterial, in: Circle())
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .padding(.top, 60)
                .zIndex(2)
                
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [1]) { _ in
                    location
                }
                    .zIndex(1)
            }
            .ignoresSafeArea()
        })
        .onAppear {
            print(Double(living.coordinates[0]) ?? 0)
//            service.getTrainPrice(for: TrainRequest(frm: "Москва", to: living.city, date: "19.02.2023")) { newPrice in
//                trainPrice = newPrice
//            }
//            service.getPlanePrice(for: PlaneRequest(frm: "Москва", to: living.city)) { newPrice in
//                planePrice = newPrice
//            }
        }
    }
}

struct FullScreenLivingView_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.livingFullScreen(living: Living.testArray[0], dismiss: {})
    }
}
