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
                .opacity(Constants.Onboarding.dismissHandleOpacity)
                .frame(width: Constants.Onboarding.dismissHandleWidth, height: Constants.Onboarding.dismissHandleHeight)
                .padding(.top, Constants.Onboarding.dismissHandleTopPadding)
            Text("GrubSafe")
                .font(.largeTitle)
                .padding(.top, Constants.Onboarding.rowsTopPadding)
            Text("A minimal contact restaurant app for safe and healthy dining.")
                .font(.title3)
                .padding(.top, Constants.Onboarding.rowsTopPadding)
                .padding(.horizontal, Constants.Onboarding.descriptionHorizontalPadding)
            VStack(alignment: .leading) {
                FeaturesRow(text: "View the full menu.")
                FeaturesRow(text: "Select and order your meals.")
                FeaturesRow(text: "Add photos of your meals.")
                FeaturesRow(text: "Write reviews of your meals.")
            }
            Spacer()
            Button("Press to dismiss") {
                dismiss()
            }
        }
    }
}

struct FeaturesRow: View {
    let text: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .font(.body)
                .padding(.trailing)
            Text(text)
                .font(.body)
        }
        .padding(.top, Constants.Onboarding.rowsTopPadding)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        OnboardingView()
            .preferredColorScheme(.dark)
        OnboardingView()
            .previewLayout(.fixed(width: 568, height: 320))
        OnboardingView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
