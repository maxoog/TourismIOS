import SwiftUI

struct MyOrdersView: View {
    @ObservedObject var viewModel: MyOrdersViewModel
    
    let testProfile: Profile = .init(
        photo: "https://sun9-24.userapi.com/impg/71B6IoIm3guSZDbN564XtCb02_wbXtHqyUFe5g/aFN48TBNwps.jpg?size=640x640&quality=95&sign=271d2c2aec97187bc97dcd8ec71a90fb&type=album",
        firstName: "Максим",
        lastName: "Зенков",
        patr: "Александрович",
        mail: "maxood@yandex.ru",
        city: "Санкт-Петербург",
        university: "ИТМО",
        levelName: "Крузенштерн",
        phone: "+7(933)-993-65-90",
        levelCapacity: 140,
        currentLevelPoints: 59,
        currentLevel: 8,
        goldRingsCount: 3754
    )
    
    var body: some View {
        List {
            Section(header: Text("Ваши Заявки")) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Вы уже накопили:")
                            .font(Design.Fonts.semiBold)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image("infoIcon")
                                .foregroundColor(Design.Colors.lightGray)
                        }
                    }
                    
                    HStack {
                        Image("goldRingIcon")
                        
                        Text("\(testProfile.goldRingsCount)")
                            .font(Design.Fonts.extraBold24)
                            .foregroundColor(Design.Colors.darkBlue)
                        
                        Text("золотых кольца")
                            .font(Design.Fonts.bold14)
                            .foregroundColor(Design.Colors.lightGray)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Потратить")
                            .foregroundColor(Design.Colors.darkBlue)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Design.Gradients.buttonGradient, in: RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding()
                .background(.white, in: RoundedRectangle(cornerRadius: 20))
                .defaultShadow()
                .padding(.horizontal)
            }
            .listRowSeparator(.hidden, edges: .all)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .padding(.top, 40)
        .refreshable {
            viewModel.refresh()
        }
        .navigationTitle("Мои бронирования")
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
