//
//  SuperDetailEpisodsView.swift
//  2HW
//
//  Created by Данил Менделев on 30.09.2022.
//

import SwiftUI
import NetworkLayer

struct SuperDetailEpisodsView: View {
    @Binding var episode: Episode
    @EnvironmentObject var navModel: NavigationControllerViewModel
    
    var body: some View {
        VStack{
            Text(String(episode.id))
            Text(episode.episode)
            Text(episode.name)
            Text(episode.airDate ?? "")
            Text(episode.created ?? "")
            Text(episode.url)
            HStack{
                Button {
                    navModel.pop()
                } label: {
                    Text("Back")
                }
                Button {
                    navModel.pop(destination: .root)
                } label: {
                    Text("Home")
                }
            }
        }
    }
}

