//
//  DetailEpisodsView.swift
//  2HW
//
//  Created by Данил Менделев on 30.09.2022.
//

import SwiftUI
import NetworkLayer

struct DetailEpisodsView: View {
    @Binding var episode: Episode
    @EnvironmentObject var navModel: NavigationControllerViewModel
    
    var body: some View {
        VStack(alignment: .center){
            Text(episode.name)
            Text(episode.episode)
            Text("Tap me! \n You are get super detail information about \(episode.name)")
                .padding()
                .onTapGesture {
                    navModel.push(newView: SuperDetailEpisodsView(episode: $episode))
                }
            Button {
                navModel.pop()
            } label: {
                Text("Back")
            }
        }
    }
}

