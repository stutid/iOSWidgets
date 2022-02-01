//
//  ContentView.swift
//  WidgetTutorial
//
//  Created by Stuti Dobhal on 03.12.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Text("Welcome to Widgets Demo!")
                .font(.title)
                .padding(.bottom, 5.0)

            Text("You can now add small, medium and large widgets from widget gallery!!")
                .font(.body)
        }
        .padding(25.0)
        .multilineTextAlignment(.center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
