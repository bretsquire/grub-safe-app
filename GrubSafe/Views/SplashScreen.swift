//
//  SplashScreen.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/10/22.
//

import SwiftUI

struct SplashScreen: View {
    var duration = 5.0
    var repeating = false
    let uZoomFactor: CGFloat = 2.5
    @State var uScale: CGFloat = 1
    @State var textScale: CGFloat = 1
    @State var textOpacity = 0.0
    @State var textColor = Color.black
    @State var backgndColor = Color.black

    var body: some View {
        ZStack {
            Text("GrubSafe")
            .font(.largeTitle)
            .foregroundColor(textColor)
            .opacity(textOpacity)
            .scaleEffect(textScale)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgndColor)
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            self.handleAnimations()
        }
    }
}

extension SplashScreen {
    func handleAnimations() {
        runAnimation()
        if repeating {
            restartAnimation()
        }
    }

    func runAnimation() {
        let deadline: DispatchTime = .now()
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            withAnimation(Animation.easeIn(duration: duration)) {
                self.textScale = self.uZoomFactor
                self.textOpacity = 1
                self.textColor = .black
                self.backgndColor = .white
            }
        }
    }

    func restartAnimation() {
        let deadline: DispatchTime = .now() + duration + 1.0
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.textScale = 1
            self.textOpacity = 0
            self.textColor = .black
            self.backgndColor = .black
            self.handleAnimations()
        }
    }
}

struct SplashScreen_Previews : PreviewProvider {
    static var previews: some View {
        SplashScreen(repeating: true)
    }
}
