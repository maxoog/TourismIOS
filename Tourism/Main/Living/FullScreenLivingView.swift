import SwiftUI

struct FullScreenLivingView: View {
    let living: Living
    let service: SearchService
    let dismiss: () -> Void
    
    @State var trainPrice: Int = 0
    @State var planePrice: Int = 0
    @State var currentIndex: Int = 1
    @State var showSharingSheet: Bool = false
    
    let count: Int = 4
    
    var body: some View {
        ZStack {
            ScrollView {
                Spacer(minLength: 320)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("geoIcon")
                            
                            VStack {
                                Text("\(living.city)")
                                    .font(Design.Fonts.medium14)
                                Text("\(living.street), \(living.houseNumber)")
                                    .font(Design.Fonts.medium14)
                                    .foregroundColor(Design.Colors.lightGray)
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
//                        Text("Посмотреть на карте")
//                            .font(Design.Fonts.bold11)
//                            .foregroundColor(Design.Colors.lightGray)
                        
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
                    
                    VStack(alignment: .leading) {
                        Text("Стоимость билетов")
                            .font(Design.Fonts.bold)
                        
                        HStack {
                            Text("Поезд:")
                            Spacer()
                            Text(trainPrice == 0 ? "Не удалось найти билет" : "\(trainPrice)₽")
                                .foregroundColor(Design.Colors.lightViolet)
                        }
                        .font(Design.Fonts.bold12)
                        
                        HStack {
                            Text("Самолет:")
                            Spacer()
                            Text(planePrice == 0 ? "Не удалось найти билет" : "\(planePrice)₽")
                                .foregroundColor(Design.Colors.lightViolet)
                        }
                        .font(Design.Fonts.bold12)
                        
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
//                        Text(living.description)
//                            .font(Design.Fonts.medium14)
//                            .foregroundColor(.black.opacity(0.6))
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
                            ForEach(0..<count) { ind in
                                Image("testImage")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: gr.size.width, height: 300)
                                    .clipped()
                                    .edgesIgnoringSafeArea(.top)
                                    .zIndex(1)
                                    .onAppear {
                                        currentIndex = ind + 1
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
                                
                                ShareLink(item: "http://google.com") {
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
        .onAppear {
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
