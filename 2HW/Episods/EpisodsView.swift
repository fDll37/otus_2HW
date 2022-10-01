//
//  EpisodsView.swift
//  2HW
//
//  Created by Данил Менделев on 30.09.2022.
//

import SwiftUI

struct EpisodsView: View {
    @ObservedObject private var episodesRAM = EpisodeViewModel()
    @EnvironmentObject var navModel: NavigationControllerViewModel
    
    var body: some View {
        List{
            ForEach(episodesRAM.episodes, id: \.id) { episode in
                HStack{
                    Text(episode.name)
                        .onAppear {
                            if episodesRAM.episodes.needToFetch(episodesRAM.episodes[episode.id - 1]) {
                                episodesRAM.fetchEpisodes()
                            }
                        }
//                    Text(character.status)
                }
                .onTapGesture {
                    navModel.push(newView: DetailEpisodsView( episode: $episodesRAM.episodes[episode.id - 1]))
                }
            }
        }
        .onAppear {
            episodesRAM.fetchEpisodes()
        }
    }
}
