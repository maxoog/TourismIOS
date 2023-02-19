import SwiftUI

struct ProfileView: View {
    @ObservedObject var navigationController: NavigationController = NavigationController.shared
    
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var imageSize = 120.0
    @State var secondaryOpacity = 1.0
    
    @State var isFullTitle: Bool = true
    
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
                
                if percent > 0.4 {
                    withAnimation(.spring()) {
                        isFullTitle = true
                    }
                } else {
                    withAnimation(.spring()) {
                        isFullTitle = false
                    }
                }
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
                        
                        VStack {
                            ForEach(viewModel.userAchivements, id: \.self) { item in
                                AchivementCard(cardInfo: item)
                                    .frame(maxWidth: .infinity)
                                    .padding(.trailing)
                                    .background(Design.Colors.lightViolet.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
                                    .padding(.bottom)
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
                    .foregroundColor(Color.red)
                    .frame(width: 180, height: 56)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: 2)
                    )
                    
                    Spacer(minLength: 100)
                }
                .sheet(isPresented: $viewModel.showAuthView) {
                    screenFactory.vkAuthView(onAuthorize: {})
                }
            }
            
            // MARK: - Profile Info
            VStack {
                ZStack(alignment: .top) {
                    ShortProfileHeaderView(profile: testProfile, imageSize: imageSize * 0.5)
                        .zIndex(1)
                    if isFullTitle {
                        ProfileHeaderView(profile: testProfile, imageSize: imageSize)
                            .zIndex(2)
                            .transition(.asymmetric(insertion: .push(from: .top), removal: .move(edge: .top)).animation(.easeInOut(duration: 0.3)))
                    }
                }
                
                Spacer()
            }
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
