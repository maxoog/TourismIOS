import SwiftUI

struct TabBarView: View {
    @ObservedObject var tabBarViewModel: NavigationController = NavigationController.shared
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(TabBarItem.allCases, id: \.self) { item in
                    Spacer()
                    Button {
                        withAnimation(.spring()) {
                            tabBarViewModel.activeTab = item
                        }
                    } label: {
                        VStack(spacing: 5) {
                            Image(tabBarViewModel.getIconName(for: item))
                                .renderingMode(.template)
                            Text(item.rawValue)
                                .font(.caption)
                        }
                        .foregroundColor(tabBarViewModel.activeTab == item ? Design.Colors.mainGreen : Design.Colors.lightGray)
                        .padding(.top, 10)
                        .padding(.bottom, 35)
                        .padding(.horizontal, 10)
                    }
                    
                    if (item != .profile) {
                        Spacer()
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 85)
        .background(.white)
        .offset(y: tabBarViewModel.hidden ? 100 : 0)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
