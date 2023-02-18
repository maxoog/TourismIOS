
import SwiftUI

struct ShortProfileHeaderView: View {
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
                    EmptyView()
                }
            }
            .padding(.trailing, 20)
            .aspectRatio(1, contentMode: .fit)
            
            Text("\(profile.lastName) \(profile.firstName)")
                .font(Design.Fonts.bold)
            
            Spacer()
        }
        .frame(height: 70)
        .padding(.top, 60)
        .padding(.bottom, 10)
        .padding(.horizontal, 20)
        .background(.white, in: RoundedRectangle(cornerRadius: 20))
        .defaultShadow()
        .padding(.bottom)
    }
}

struct ShortProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ShortProfileHeaderView(profile: .init(
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
        ), imageSize: 150)
    }
}
