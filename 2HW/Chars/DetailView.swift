//
//  DetailView.swift
//  2HW
//
//  Created by Данил Менделев on 24.09.2022.
//

import SwiftUI
import NetworkLayer

struct DetailView: View {
    @ObservedObject private var modelRAM = CharacterViewModel()
    @EnvironmentObject var navModel: NavigationControllerViewModel
    @State private var isLoading:Bool = false
    
    var body: some View {
        List{
            ForEach(modelRAM.characters, id: \.id) { character in
                HStack{
                    Text(character.name)
                        .onAppear {
                            if modelRAM.characters.needToFetch($modelRAM.characters[character.id - 1]) {
                                modelRAM.fetchChars()
                            }
                        }
                }
                //                .animation(.easeInOut, value: true)
                .onTapGesture {
                    navModel.push(newView: CustomDetailView( character: $modelRAM.characters[character.id - 1]))
                }
            }
        }
        .onAppear {
            modelRAM.fetchChars()
        }
    }
}

