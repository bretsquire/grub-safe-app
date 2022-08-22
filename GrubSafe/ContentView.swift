//
//  ContentView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var onboardingIsVisable = false
    let userName = "[userName]"
    var body: some View {
        VStack {
            HStack {
                Text("Welcome, \(userName).")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
                Button {
                    onboardingIsVisable.toggle()
                } label: {
                    Image(systemName: "person.crop.circle.badge.questionmark.fill")
                        .font(.title)
                }
                .padding()
                .sheet(isPresented: $onboardingIsVisable) {
                    OnboardingView()
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
