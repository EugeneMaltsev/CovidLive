//
//  ContentView.swift
//  Shared
//
//  Created by Eugene Maltsev on 20.01.2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        Text(covid.getAPI())
            .font(.title)
            .padding(0.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
