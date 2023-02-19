import SwiftUI

struct CustomNavigationView: View {
    @ObservedObject var navigationController: NavigationController = NavigationController.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            if navigationController.activeTab == .search {
                HStack {
                    Text("Привет, Максим!")
                        .padding(.leading, 20)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Design.Gradients.titleGradient)
                    Spacer()
                }
                .padding(.top, 70)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity)
                .background(.white, in: RoundedRectangle(cornerRadius: 20))
                .edgesIgnoringSafeArea(.top)
                .defaultShadow()
                .offset(y: navigationController.hidden ? -200 : 0)
                .offset(y: navigationController.activeTab == .search ? 0 : -200)
            } else if navigationController.activeTab == .booking {
                HStack {
                    Text("Ваши бронирования")
                        .padding(.leading, 16)
                        .font(Design.Fonts.bold24)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top, 70)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity)
                .background(.white, in: RoundedRectangle(cornerRadius: 20))
                .edgesIgnoringSafeArea(.top)
                .defaultShadow()
            }
            
            Spacer()
            
            TabBarView()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}
