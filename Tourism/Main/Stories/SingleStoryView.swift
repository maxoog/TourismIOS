import SwiftUI

struct SingleStoryView: View {
    @State private var offset: CGSize = .zero
    
    @ObservedObject var viewModel: StoriesViewModel
    @ObservedObject var timer: StoryTimer
    
    @GestureState private var isDetectingLongPress = false
    
    let dismiss: () -> Void
    
    init(viewModel: StoriesViewModel, index: Int, dismiss: @escaping () -> Void) {
        viewModel.timer.progress += Double(index)
        viewModel.timer.dismiss = dismiss
        self.timer = viewModel.timer
        self.viewModel = viewModel
        self.dismiss = dismiss
    }
    
    var body: some View {
        ZStack {
            GeometryReader { gr in
                ZStack(alignment: .top) {
                    // block to display content
                    SingleNewsView(news: viewModel.news[Int(viewModel.timer.progress)])
                    
                    // loading bars
                    
                    // clear fields to handle forward and backward
                    HStack(alignment: .center, spacing: 0) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.timer.previousStory()
                            }
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                viewModel.timer.nextStory()
                            }
                    }
                    
                    VStack(spacing: 12) {
                        HStack(alignment: .center, spacing: 4) {
                            ForEach(0..<viewModel.timer.itemsCount) { x in
                                LoadingRectangle(progress: min(max((CGFloat(viewModel.timer.progress) - CGFloat(x)), 0.0), 1.0))
                                    .frame(width: nil, height: 2, alignment: .leading)
                            }
                        }.padding()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                dismiss()
                            } label: {
                                Image("close")
                                    .frame(width: 30, height: 30)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .padding(.trailing, 16)
                                    .contentShape(Rectangle().size(.init(width: 40, height: 40)))
                            }
                        }
                    }
                    .padding(.top, 40)
//                    .highPriorityGesture(
//                        LongPressGesture(minimumDuration: 1)
//                            .updating($isDetectingLongPress, body: { currentState, gestureState, transaction in
//                                timer.pause()
//                                gestureState = currentState
//                                transaction.animation = Animation.easeIn(duration: 2.0)
//                            })
//                            .onEnded({ _ in
//                                timer.start()
//                            })
//                    )
                }
                .background(Color.black)
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
