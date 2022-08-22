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
        Button("Press to dismiss") {
            dismiss()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
