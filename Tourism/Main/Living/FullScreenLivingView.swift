import SwiftUI

struct FullScreenLivingView: View {
    let living: Living
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FullScreenLivingView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenLivingView(living: Living.testArray[0])
    }
}
