import SwiftUI

struct ProfileHeaderView: View {
    let profile: Profile
    let imageSize: CGFloat
    
    var body: some View {
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
            .frame(width: imageSize, height: imageSize)
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
                                .frame(height: 8)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Design.Colors.mainGreen)
                                .frame(maxWidth: gr.size.width * CGFloat(profile.currentLevelPoints) / CGFloat(profile.levelCapacity))
                                .frame(height: 8)
                        }
                    }
                }
            }
        }
        .frame(height: 190)
        .padding(.top, 70)
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
        .multilineTextAlignment(.leading)
        .background(.white, in: RoundedRectangle(cornerRadius: 20))
        .defaultShadow()
        .padding(.bottom)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(
            profile: .init(
                photo: "https://sun9-24.userapi.com/impg/71B6IoIm3guSZDbN564XtCb02_wbXtHqyUFe5g/aFN48TBNwps.jpg?size=640x640&quality=95&sign=271d2c2aec97187bc97dcd8ec71a90fb&type=album",
                firstName: "Максим",
                lastName: "Зенков",
                patr: "Александрович",
                mail: "maxood@yandex.ru",
                city: "Санкт-Петербург",
                university: "ИТМО",
                levelName: "",
                phone: "+7(933)-993-65-90",
                levelCapacity: 140,
                currentLevelPoints: 59,
                currentLevel: 8,
                goldRingsCount: 3754
            ),
            imageSize: 150
        )
    }
}
