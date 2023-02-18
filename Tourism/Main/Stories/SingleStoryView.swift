import SwiftUI

struct SingleStoryView: View {
    @State private var offset: CGSize = .zero
    
    @ObservedObject var viewModel: StoriesViewModel
    
    let dismiss: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { gr in
                ZStack(alignment: .top) {
                    // block to display content
                    Text("0")
                        .frame(width: gr.size.width, height: gr.size.height, alignment: .center)
                        .onTapGesture {
                            dismiss()
                        }
                    // loading bars
                    HStack(alignment: .center, spacing: 4) {
                        ForEach(0..<viewModel.timer.itemsCount) { x in
                            LoadingRectangle(progress: min(max((CGFloat(viewModel.timer.progress) - CGFloat(x)), 0.0), 1.0))
                                .frame(width: nil, height: 2, alignment: .leading)
                        }
                    }.padding()
                    // clear fields to handle forward and backward
                    HStack(alignment: .center, spacing: 0) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.timer.previousStory()
                            }
                        Spacer(minLength: gr.size.width / 3)
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.timer.nextStory()
                            }
                    }
                }
                .background(Color.red)
                .cornerRadius(10)
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            withAnimation(.linear(duration: 0.2)) {
                                offset = gesture.translation
                            }
                        }
                        .onEnded { _ in
                            if abs(offset.height) > 100 {
                                dismiss()
                            } else {
                                offset = .zero
                            }
                        }
                )
                .onAppear {
                    viewModel.timer.start()
                    print("story shown")
                }
                .onDisappear {
                    viewModel.timer.cancellable?.cancel()
                }
            }
        }
    }
}

struct SingleStoryView_Previews: PreviewProvider {
    static var previews: some View {
        screenFactory.newsScreen(news: News.testArray, firstNewsIndex: 0, dismiss: {})
    }
}
