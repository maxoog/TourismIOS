import SwiftUI

struct CustomNavigationView: View {
    @ObservedObject var navigationController: NavigationController = NavigationController.shared
    
    var body: some View {
        VStack(alignment: .leading) {
                HStack {
                    Text("Привет, Мария!")
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
