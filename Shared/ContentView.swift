//
//  ContentView.swift
//  Shared
//
//  Created by Eugene Maltsev on 20.01.2021.
//

import SwiftUI
  
  
struct ContentView: View {
    var body: some View {
        covid.getAPI(completionHandler2: { (covidProps: Array<CovidProperties>?) -> Void in
            DispatchQueue.main.async {
                
                     }
        })
        return Text("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
