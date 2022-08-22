//
//  ContentView.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/21/22.
//

import SwiftUI

struct ContentView: View {
    let userName = "[userName]"
    var body: some View {
        VStack {
            HStack {
                Text("Welcome, \(userName).")
                    .font(.title3)
                    .bold()
                    .padding()
                Spacer()
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
