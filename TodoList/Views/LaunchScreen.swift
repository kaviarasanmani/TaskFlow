//////
//////import SwiftUI
//////
//////struct SplashScreen: View {
//////    @Binding var isFinished: Bool
//////
//////    @State private var startAnimation = false
//////    @State private var bowAnimation = false
//////    @State private var showPlus = false
//////    @State private var showBGGlow = false
//////    @State private var glow = false
//////
//////    var body: some View {
//////        ZStack {
//////            BackgroundColorView()
//////
//////            if !isFinished {
//////                GeometryReader { proxy in
//////                    SplashContentView(
//////                        size: proxy.size,
//////                        startAnimation: $startAnimation,
//////                        bowAnimation: $bowAnimation,
//////                        showPlus: $showPlus,
//////                        showBGGlow: $showBGGlow,
//////                        glow: $glow
//////                    )
//////                }
//////                .onAppear(perform: performAnimations)
//////            }
//////        }
//////    }
//////
//////    private func performAnimations() {
//////        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//////            startBowAnimation()
//////            startGlowAnimation()
//////            startTextAnimation()
//////            startPlusAnimation()
//////            startBackgroundGlowAnimation()
//////        }
//////    }
//////
//////    private func startBowAnimation() {
//////        withAnimation(.linear(duration: 2)) {
//////            bowAnimation.toggle()
//////        }
//////    }
//////
//////    private func startGlowAnimation() {
//////        withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
//////            glow.toggle()
//////        }
//////    }
//////
//////    private func startTextAnimation() {
//////        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//////            withAnimation(.spring()) {
//////                startAnimation.toggle()
//////            }
//////        }
//////    }
//////
//////    private func startPlusAnimation() {
//////        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//////            withAnimation(.spring()) {
//////                showPlus.toggle()
//////            }
//////        }
//////    }
//////
//////    private func startBackgroundGlowAnimation() {
//////        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
//////            withAnimation(.linear(duration: 0.5)) {
//////                showBGGlow.toggle()
//////            }
//////            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//////                withAnimation(.linear(duration: 0.4)) {
//////                    showBGGlow.toggle()
//////                }
//////                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//////                    withAnimation {
//////                        isFinished.toggle()
//////                    }
//////                }
//////            }
//////        }
//////    }
//////}
//////
//////struct BackgroundColorView: View {
//////    var body: some View {
//////        Color("BG")
//////            .ignoresSafeArea()
//////    }
//////}
//////
//////struct SplashContentView: View {
//////    let size: CGSize
//////    @Binding var startAnimation: Bool
//////    @Binding var bowAnimation: Bool
//////    @Binding var showPlus: Bool
//////    @Binding var showBGGlow: Bool
//////    @Binding var glow: Bool
//////
//////    var body: some View {
//////        ZStack {
//////            AnimatedCircle(size: size, bowAnimation: $bowAnimation, glow: $glow)
//////            HStack(spacing: 10) {
//////                TaskFlowText(startAnimation: $startAnimation)
////////                PlusSymbol(showPlus: $showPlus, showBGGlow: $showBGGlow)
//////            }
//////            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//////        }
//////    }
//////}
//////
//////struct AnimatedCircle: View {
//////    let size: CGSize
//////    @Binding var bowAnimation: Bool
//////    @Binding var glow: Bool
//////
//////    var body: some View {
//////        Circle()
//////            .trim(from: 0, to: bowAnimation ? 0.3 : 0)
//////            .stroke(
//////                LinearGradient(
//////                    gradient: Gradient(colors: [
//////                        Color("Gradient5").opacity(0.5),
//////                        Color("BG"),
//////                    ]),
//////                    startPoint: .leading,
//////                    endPoint: .trailing
//////                ),
//////                style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
//////            )
//////            .overlay(
//////                GlowTextView(glow: $glow)
//////                    .offset(x: (size.width / 1.7) / 2)
//////                    .rotationEffect(.degrees(bowAnimation ? 540 : 0))
//////                    .opacity(bowAnimation ? 1 : 0)
//////            )
//////            .frame(width: size.width / 1.7, height: size.width / 1.8)
//////            .rotationEffect(.degrees(-200))
//////            .offset(y: 10)
//////    }
//////}
//////
//////struct GlowTextView: View {
//////    @Binding var glow: Bool
//////
//////    var body: some View {
//////                Text("🚀")
//////                    .foregroundColor(Color.white)
//////                    .frame(width: 30, height: 30)
////////                    .overlay(
////////                        Circle()
////////                            .fill(Color.white.opacity(glow ? 2.0 : 0.1))
////////                            .frame(width: 20, height: 20)
////////                    )
////////                    .blur(radius: 2.5)
//////
//////    }
//////}
//////
//////struct TaskFlowText: View {
//////    @Binding var startAnimation: Bool
//////
//////    var body: some View {
//////        Text("TaskFlow ")
//////            .font(.title)
//////            .foregroundColor(.white)
//////            .opacity(startAnimation ? 1 : 0)
//////    }
//////}
//////
////////struct PlusSymbol: View {
////////    @Binding var showPlus: Bool
////////    @Binding var showBGGlow: Bool
////////
////////    var body: some View {
////////        Text("🚀")
////////            .font(.system(size: 40))
////////            .foregroundColor(.white)
////////            .background(
////////                ZStack {
////////                    Circle()
////////                        .fill(Color.white.opacity(0.25))
////////                        .frame(width: 35, height: 35)
////////                        .blur(radius: 2)
////////                    Circle()
////////                        .fill(Color.white.opacity(0.2))
////////                        .frame(width: 20, height: 20)
////////                        .blur(radius: 2)
////////                }
////////                .opacity(showBGGlow ? 1 : 0)
////////            )
////////            .scaleEffect(showPlus ? 1 : 0)
////////    }
////////}
////
////
////import SwiftUI
////
////struct SplashScreen: View {
////    @Binding var isFinished: Bool
////    
////    @State private var startAnimation = false
////    @State private var bowAnimation = false
////    @State private var showBGGlow = false
////    @State private var glow = false
////    
////    var body: some View {
////        ZStack {
////            BackgroundColorView()
////            
////            if !isFinished {
////                GeometryReader { proxy in
////                    let size = proxy.size
////                    
////                    SplashContentView(size: size,
////                                      startAnimation: $startAnimation,
////                                      bowAnimation: $bowAnimation,
////                                      showBGGlow: $showBGGlow,
////                                      glow: $glow)
////                }
////                .onAppear(perform: performAnimations)
////            }
////        }
////    }
////    
////    private func performAnimations() {
////        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
////            withAnimation(.linear(duration: 2)) {
////                bowAnimation.toggle()
////            }
////            withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
////                glow.toggle()
////            }
////            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
////                withAnimation(.spring()) {
////                    startAnimation.toggle()
////                }
////            }
////            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
////                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
////                    withAnimation(.linear(duration: 0.5)) {
////                        showBGGlow.toggle()
////                    }
////                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
////                        withAnimation(.linear(duration: 0.4)) {
////                            showBGGlow.toggle()
////                        }
////                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
////                            withAnimation {
////                                isFinished.toggle()
////                            }
////                        }
////                    }
////                }
////            }
////        }
////    }
////}
////
////struct BackgroundColorView: View {
////    var body: some View {
////        Color("BG")
////            .ignoresSafeArea()
////    }
////}
////
////struct SplashContentView: View {
////    let size: CGSize
////    @Binding var startAnimation: Bool
////    @Binding var bowAnimation: Bool
////    @Binding var showBGGlow: Bool
////    @Binding var glow: Bool
////    
////    var body: some View {
////        ZStack {
////            AnimatedCircle(size: size, bowAnimation: $bowAnimation, glow: $glow)
////            
////            HStack(spacing: 10) {
////                TaskFlowText(startAnimation: $startAnimation)
////            }
////            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
////        }
////    }
////}
////
////struct AnimatedCircle: View {
////    let size: CGSize
////    @Binding var bowAnimation: Bool
////    @Binding var glow: Bool
////    
////    var body: some View {
////        Circle()
////            .trim(from: 0, to: bowAnimation ? 0.2 : 0)
////            .stroke(
////                LinearGradient(
////                    gradient: Gradient(colors: [
////                        Color("Gradient5").opacity(0.5),
////                        Color("BG"),
////                    ]),
////                    startPoint: .leading,
////                    endPoint: .trailing
////                ),
////                style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
////            )
////            .overlay(
////                GlowTextView(glow: $glow)
////                    .offset(x: (size.width / 1.7) / 2)
////                    .rotationEffect(.degrees(bowAnimation ? 520 : 0))
////                    .opacity(bowAnimation ? 1 : 0)
////            )
//////            .frame(width: size.width / 1.7, height: size.width / 1.8)
////            .rotationEffect(.degrees(-200))
////            .offset(y: size.height * 0.1) // Adjust the vertical offset to align with the text
////    }
////}
////
////
////
////
////struct GlowTextView: View {
////    @Binding var glow: Bool
////    
////    var body: some View {
////        Image(.poorvikaLogo835)
//////            .frame(width: 20, height: 20)
//////            .resizable()
//////            .aspectRatio(contentMode: .fit)
////            .foregroundColor(Color.white)
////            .scaleEffect(glow ? 1.2 : 1) // Adjust the scale effect based on the glow animation
////            .animation(.linear(duration: 2).repeatForever(autoreverses: true), value: glow)
////    }
////}
//////struct GlowTextView: View {
//////    @Binding var glow: Bool
//////    
//////    var body: some View {
//////        Text("🚀")
//////            .foregroundColor(Color.white)
//////            .font(.largeTitle)
////////            .frame(width: 150, height: 150)
//////
//////    }
//////}
////
////struct TaskFlowText: View {
////    @Binding var startAnimation: Bool
////    
////    var body: some View {
////        Text("Poorvika")
////            .font(.largeTitle)
////            .foregroundColor(.white)
////            .opacity(startAnimation ? 1 : 0)
////
////    }
////}
//
////.
//struct SplashScreenView: View {
//    @Binding var isFinished: Bool
//    
//    @State private var startAnimation = false
//    @State private var bowAnimation = false
//    @State private var showBGGlow = false
//    @State private var glow = false
//    
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [
//                Color(red: 255/255, green: 118/255, blue: 49/255),
//                Color(red: 255/255, green: 75/255, blue: 35/255)
//            ]), startPoint: .top, endPoint: .bottom)
//            .ignoresSafeArea()
//
//            VStack {
//                Spacer()
//
//                Image(p)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 150, height: 150)
//                    .scaleEffect(logoScale)
//                    .opacity(logoOpacity)
//                    .onAppear {
//                        withAnimation(.easeInOut(duration: 1.0)) {
//                            logoScale = 1.0
//                            logoOpacity = 1.0
//                        }
//
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                            withAnimation(.easeInOut(duration: 0.5)) {
//                                isFinished = true
//                            }
//                        }
//                    }
//
//                Spacer()
//            }
//        }
//    }
//}
