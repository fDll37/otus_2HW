//
//  ContentView.swift
//  2HW
//
//  Created by Данил Менделев on 24.09.2022.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject private var modelRAM = CharacterViewModel()
    @State var chose = 0

    
    var body: some View {
        NavigationControllerView(transition: .custom(.scale, .slide)) {
            VStack{
                Picker("LocalizedStringKey", selection: $chose) {
                    Text("Chars").tag(0)
                    Text("Episodes").tag(1)
                }
                .pickerStyle(.segmented)
                if chose == 0 {
                    DetailView()
                } else {
                    EpisodsView()
                }
            }
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
