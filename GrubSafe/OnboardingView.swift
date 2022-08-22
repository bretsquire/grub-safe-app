//
//  OnboardingView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/22/22.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.secondary)
                .opacity(0.15)
                .frame(width: 35, height: 5)
                .padding()
            Spacer()
            Button("Press to dismiss") {
                dismiss()
            }
            Spacer()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
