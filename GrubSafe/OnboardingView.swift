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
            Text("GrubSafe")
                .font(.largeTitle)
            Text("A minimal contact restaurant app for safe and healthy dining.")
                .font(.title3)
                .padding()
            VStack(alignment: .leading) {
                FeatureRow(text: "View the full menu.")
                FeatureRow(text: "Select and order your meals.")
                FeatureRow(text: "Add photos of your meals.")
                FeatureRow(text: "Write reviews of your meals.")
            }
            Spacer()
            Button("Press to dismiss") {
                dismiss()
            }
            
        }
    }
}

struct FeatureRow: View {
    let text: String
    var body: some View {
        HStack {
            Image(systemName: "checkmark")
                .font(.body)
                .padding()
            Text(text)
                .font(.body)
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
