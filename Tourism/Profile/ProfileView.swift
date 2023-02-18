import SwiftUI

struct ProfileView: View {
    @ObservedObject var navigationController: NavigationController = NavigationController.shared
    
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var imageSize = 150.0
    @State var secondaryOpacity = 1.0
    
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
        ZStack {
            ScrollViewSharingOffset(offsetChanged: { offset in
                let percent = (offset.y + 60) / 60
                secondaryOpacity = percent
            }) {
                Spacer(minLength: 300)
                
                VStack {
                    // MARK: - Savings
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
                    
                    // MARK: - Achivements
                    VStack {
                        HStack {
                            Text("Достижения")
                                .font(Design.Fonts.semiBold)
                            
                            Spacer()
                            
                            Text("Показать все")
                                .font(Design.Fonts.bold11)
                                .foregroundColor(Design.Colors.lightGray)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.userAchivements, id: \.self) { item in
                                    VStack {
                                        Image(systemName: "person")
                                            .padding(20)
                                        
                                        Group {
                                            if item.current == item.avaliable {
                                                Text("Получено!")
                                                    .font(Design.Fonts.bold11)
                                                    .foregroundColor(Design.Colors.lightGray)
                                            } else {
                                                GeometryReader { gr in
                                                    ZStack(alignment: .leading) {
                                                        RoundedRectangle(cornerRadius: 5)
                                                            .fill(.white)
                                                            .frame(maxWidth: gr.size.width)
                                                            .frame(height: 4)
                                                        
                                                        RoundedRectangle(cornerRadius: 5)
                                                            .fill(Design.Colors.mainGreen)
                                                            .frame(height: 4)
                                                            .frame(maxWidth: gr.size.width * CGFloat(item.current) / CGFloat(item.avaliable))
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    .frame(width: 100)
                                    .padding()
                                    .background(Design.Colors.lightViolet.opacity(0.2), in: RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .defaultShadow()
                    .padding()
                    
                    //                Spacer(minLength: viewModel.userProfile == nil ? 250 : 100)
                    
                    //                Button("Войти") {
                    //                    viewModel.loginRequested()
                    //                }
                    //                .foregroundColor(.black)
                    //                .frame(width: 180, height: 56)
                    //                .background(.blue)
                    //                .cornerRadius(20)
                    
                    Button("Выйти") {
                        viewModel.logoutRequested()
                    }
                    .foregroundColor(.black)
                    .frame(width: 180, height: 56)
                    .background(.blue)
                    .cornerRadius(20)
                    
                    Spacer(minLength: 300)
                }
                .sheet(isPresented: $viewModel.showAuthView) {
                    screenFactory.vkAuthView(onAuthorize: {})
                }
            }
            
            // MARK: - Profile Info
            VStack {
                ZStack(alignment: .top) {
                    ProfileHeaderView(profile: testProfile, imageSize: imageSize)
                    .opacity(secondaryOpacity)
                    
                    ShortProfileHeaderView(profile: testProfile, imageSize: imageSize * 0.4)
                    .opacity(1 - secondaryOpacity)
                }
                
                Spacer()
            }
        }
        .onAppear {
            navigationController.showTitle = false
        }
        .onDisappear {
            navigationController.showTitle = true
        }
        .frame(maxWidth: .infinity)
        .background(Design.Colors.back)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: .init(authService: .init(client: .init()), profileService: .init(client: .init())))
    }
}
