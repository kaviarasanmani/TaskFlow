////
////  TodoListApp.swift
////  TodoList
////
////  Created by kavi17311 on 21/08/24.
////
//
//
//import SwiftUI
//
//@main
//struct TodoListSUIApp: App {
//    @StateObject private var listViewModel = ListVIewModel()
//    @State private var isSplashScreenFinished = false
//
//    var body: some Scene {
//        WindowGroup {
//            ZStack {
//                if isSplashScreenFinished {
//                    // Main content view after splash screen
//                    NavigationView {
//                        ListView()
//                            .navigationViewStyle(.stack)
//                    }
//                    .environmentObject(listViewModel)
//                } else {
//                    SplashScreenView(isFinished: $isSplashScreenFinished)
//                }
//            }
//        }
//    }
//}

import SwiftUI

@main
struct TodoListSUIApp: App {
    @StateObject private var listViewModel = ListVIewModel()
    @State private var isSplashScreenFinished = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                if isSplashScreenFinished {
                    // Main content view after splash screen
                    NavigationView {
                        ListView()
                            .navigationViewStyle(.stack)
                    }
                    .environmentObject(listViewModel)
                } else {
                    SplashScreenView(isFinished: $isSplashScreenFinished)
                }
            }
        }
    }
}

struct SplashScreenView: View {
    @Binding var isFinished: Bool

    @State private var startAnimation = false
    @State private var bowAnimation = false
    @State private var showBGGlow = false
    @State private var glow = false
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color(red: 255/255, green: 118/255, blue: 49/255),
                Color(red: 255/255, green: 75/255, blue: 35/255)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()

            VStack {
                Spacer()

                Image(.poorvikaLogo1024)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2.0)) {
                            logoScale = 1.0
                            logoOpacity = 1.0
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isFinished = true
                            }
                        }
                    }

                Spacer()
            }
        }
    }
}
