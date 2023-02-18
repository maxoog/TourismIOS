import SwiftUI

struct ProfileView: View {
    @ObservedObject var navigationController: NavigationController = NavigationController.shared
    
    @ObservedObject var viewModel: ProfileViewModel
    
    @State var imageSize = 150.0
    @State var secondaryOpacity = 1.0
    
    let profile: Profile = .init(
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
        ScrollViewSharingOffset(offsetChanged: { offset in
//            let percent = (offset.y + 60) / 60
//            secondaryOpacity = percent
//            imageSize = min(max(80, imageSize * percent), 150)
        }) {
            // MARK: - Profile Info
            VStack {
//                if let profile = viewModel.userProfile {
//                    ProfileHeaderView(profile: profile)
//                }
                HStack {
                    AsyncImage(url: URL(string: profile.photo)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: imageSize, height: imageSize)
                                .scaledToFit()
                                .clipShape(Circle())
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            // Since the AsyncImagePhase enum isn't frozen,
                            // we need to add this currently unused fallback
                            // to handle any new cases that might be added
                            // in the future:
                            EmptyView()
                        }
                    }
                    .padding(.trailing, 20)
                    .aspectRatio(1, contentMode: .fit)
                    
                    VStack(alignment: .leading) {
                        Text(profile.mail)
                            .font(Design.Fonts.semiBoldSmall)
                            .foregroundColor(Design.Colors.lightViolet)
//                            .opacity(secondaryOpacity)
                        Text("\(profile.lastName) \(profile.firstName)")
                            .font(Design.Fonts.bold)
                        Text(profile.patr)
                            .font(Design.Fonts.bold)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Image("hatIcon")
                                Text(profile.university)
                                    .foregroundColor(Design.Colors.lightGray)
                                    .font(Design.Fonts.semiBoldMedium)
                            }
                            HStack {
                                Image("phoneIcon")
                                Text(profile.phone)
                                    .foregroundColor(Design.Colors.lightGray)
                                    .font(Design.Fonts.semiBoldMedium)
                            }
                            HStack {
                                Image("locationIcon")
                                Text(profile.city)
                                    .foregroundColor(Design.Colors.lightGray)
                                    .font(Design.Fonts.semiBoldMedium)
                            }
                        }
//                        .opacity(secondaryOpacity)
                        
                        VStack {
                            HStack {
                                Text("lvl. \(profile.currentLevel)")
                                    .foregroundColor(Design.Colors.lightGray)
                                    .font(Design.Fonts.semiBoldMedium)
                                
                                Text("\(profile.levelName)")
                                    .font(Design.Fonts.semiBoldMedium)
                                
                                Spacer()
                                
                                Text("\(profile.currentLevelPoints) / \(profile.levelCapacity)")
                                    .foregroundColor(Design.Colors.lightGray)
                                    .font(Design.Fonts.semiBoldMedium)
                            }
                            
                            GeometryReader { gr in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Design.Colors.mainGreen.opacity(0.1))
                                        .frame(maxWidth: gr.size.width)
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Design.Colors.mainGreen)
                                        .frame(maxWidth: gr.size.width * CGFloat(profile.currentLevelPoints) / CGFloat(profile.levelCapacity))
                                }
                            }
                        }
                    }
                }
                .padding(.top, 70)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.leading)
                .background(.white, in: RoundedRectangle(cornerRadius: 20))
                .defaultShadow()
                .padding(.bottom)
                
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
                        
                        Text("\(profile.goldRingsCount)")
                            .font(Design.Fonts.extraBold24)
                            .foregroundColor(Design.Colors.darkBlue)
                        
                        Text("анальных кольца")
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
            }
            .sheet(isPresented: $viewModel.showAuthView) {
                screenFactory.vkAuthView(onAuthorize: {})
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
