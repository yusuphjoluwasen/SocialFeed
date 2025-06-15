//
//  SplashView.swift
//  SocialFeed
//
//  Created by Guru King on 14/06/2025.
//
import SwiftUI

struct SplashView: View {
    @Bindable var presenter: SplashPresenter

    @State private var logoScale: CGFloat = 0.8
    @State private var fadeIn = false

    var body: some View {
        VStack {
            Image(systemName: StringConstants.splashImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .scaleEffect(logoScale)
                .opacity(fadeIn ? 1 : 0)

            Text(StringConstants.appName)
                .font(.largeTitle.bold())
                .scaleEffect(logoScale)
                .opacity(fadeIn ? 1 : 0)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.2)) {
                fadeIn = true
                logoScale = 1.1
            }
            presenter.start()
        }
    }
}

#Preview { SplashView(presenter: SplashPresenter(useCase: MockAuthUseCase(), onComplete: {})) }
