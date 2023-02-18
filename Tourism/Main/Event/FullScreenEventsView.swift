import SwiftUI

struct FullScreenEventsView: View {
    let event: Event
    let service: SearchService
    let dismiss: () -> Void
    
    @State var price: Int = 0
    
    var body: some View {
        ZStack {
            ScrollView {
                Spacer(minLength: 400)
                
                VStack {
                    Text(event.region)
                    
                    Text(event.price)
                    
                    Text(event.description)
                }
            }
            
            VStack {
                GeometryReader { gr in
                    ZStack(alignment: .top) {
                        Image("testImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: gr.size.width, height: 300)
//                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                            .zIndex(1)
                        
                        VStack {
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image("backIcon")
                                        .padding()
                                        .background(.white, in: Circle())
                                }
                                
                                Spacer()
                                
                                Text("1 / 13")
                                    .font(Design.Fonts.medium11)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(.black.opacity(0.3), in: RoundedRectangle(cornerRadius: 10))
                                
                                Spacer()
                                
                                Button {
                                    dismiss()
                                } label: {
                                    Image("shareIcon")
                                        .padding()
                                        .background(.white, in: Circle())
                                }
                            }
                            
                            Spacer()
                            
                            HStack {
                                Text("-")
                                
                                Spacer()
                                
                                Text("+")
                            }
                        }
                        .zIndex(2)
                        .padding(.top, 60)
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    }
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                .edgesIgnoringSafeArea(.top)
                
                Spacer()
                
                Text("Оставить заявку")
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
//            service.getTrainPrice(for: TrainRequest(frm: "Москва", to: event.region, date: "18.02.2023")) { newPrice in
//                price = newPrice
//            }
        }
    }
}

struct FullScreenEventsView_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.eventFullScreen(event: Event.testArray[0], dismiss: {})
    }
}
