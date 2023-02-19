import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    @State var offset: CGFloat = 0
    private var size: CGSize
    
    init(viewModel: OnboardingViewModel, size: CGSize) {
        self.viewModel = viewModel
        self.size = size
    }
    
    var intros = [
        OnboardingViewModel.State.travel,
        OnboardingViewModel.State.meet,
        OnboardingViewModel.State.action
    ]
    
    var body: some View {
        ZStack {
            Design.Colors.mainGreen
                .ignoresSafeArea()
            VStack {
                OffsetPageTabView(offset: $offset) {
                    HStack(spacing: 0) {
                        ForEach(intros) { intro in
                            slide(intro)
                                .frame(width: size.width)
                        }
                    }
                }
                HStack {
                    Spacer()
                    footer(state: viewModel.state)

                }
            }
        }
        .ignoresSafeArea()
    }
                        
    private func slide(_ state: OnboardingViewModel.State) -> some View {
        ZStack {
            Design.Colors.mainGreen
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 24) {
                if state == .travel {
                    image(name: "travel")
                    header(text: "Выбирай события", description: "Подавай заявку на экскурсии, лекции, хакатоны, конференции, волонтёрские проекты - найдётся событие на любой вкус")
                } else if state == .meet {
                    image(name: "open")
                    header(text: "Бронируй жильё", description: "Живи по доступным ценам на море или в горах, в городе или на базе отдыха, с друзьями или без, на день или на неделю. Отслеживай в реальном времени бронирования во вкладке “Мои бронирования” и получай push-уведомление о смене его статуса")
                } else if state == .action {
                    image(name: "action")
                    header(text: "Путешествуй по России", description: "Получи возможность посетить более чем 100 городов России, принять участие в уникальных событиях и открыть для себя много нового!")
                }
            }
            .padding(.top, 8)
        }
    }
    
    private func header(text: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(text)
                    .foregroundColor(.white)
                    .font(Design.Fonts.bold24)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 30)
                Spacer()
            }
            
            Text(description)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
    }
    
    private func image(name: String) -> some View {
        VStack {
            Image(name)
                .frame(width: size.width)
//                .scaleEffect(1.05)
            Spacer()
        }
    }
    
    private func footer(state: OnboardingViewModel.State) -> some View {
        VStack(spacing: 32) {
            
            HStack {
                progressView()
                Spacer()
                nextButton()
            }
            .frame(height: 54)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
    }
    
    private func nextButton() -> some View {
        Button {
            let index = getIndex() + 1
            
            if index == 3 {
                viewModel.dismiss()
            } else {
                offset = CGFloat(index) * size.width
            }
        } label: {
            if getIndex() != 2 {
                ZStack {
                    Design.Gradients.buttonGradient
                        .frame(width: 54, height: 54)
                        .backgroundStyle(Design.Gradients.buttonGradient)
                    Image("arrow")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                }
                .cornerRadius(27)
            } else {
                Text("Начать")
                    .foregroundColor(.black)
                    .font(Design.Fonts.semiBoldMedium)
                    .padding()
                    .frame(width: 200, height: 44)
                    .background(Design.Gradients.buttonGradient, in: RoundedRectangle(cornerRadius: 12))
            }
        }
        .buttonStyle(GrowingButton())
        .animation(.easeInOut, value: getIndex())
    }
    
    func buttonColor() -> Color {
        let index = getIndex()
        if index == 0 {
            return .init(uiColor: .init(red: 0.75, green: 0.78, blue: 0.98, alpha: 1))
        } else if index == 2 {
            return .init(uiColor: .init(red: 0.96, green: 0.75, blue: 0.76, alpha: 1))
        } else {
            return .init(uiColor: .init(red: 0.29, green: 0.28, blue: 0.58, alpha: 1))
        }
    }
    
    private func progressView() -> some View {
        HStack(spacing: 12) {
            ForEach(0..<3) { index in
                Capsule()
                    .fill(.white)
                    .frame(width: getIndex() == index ? 20: 7, height: 7, alignment: .leading)
            }
        }
        .overlay(
            Capsule()
                .fill(.white)
                .frame(width: 20, height: 7)
                .offset(x: getIndicatorsOffset())
            ,alignment: .leading
        )
    }
    
    func getIndicatorsOffset() -> CGFloat {
        let progress = offset / size.width
        
        let maxWidth: CGFloat = 12 + 7
        
        return progress * maxWidth
    }
    
    func getIndex() -> Int {
        let progres = round(offset / size.width)
        
        let index = min(Int(progres), intros.count - 1)
        return index
    }
}
