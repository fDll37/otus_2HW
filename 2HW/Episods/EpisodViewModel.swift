//
//  EpisodViewModel.swift
//  2HW
//
//  Created by Данил Менделев on 30.09.2022.
//

import Foundation
import NetworkLayer


class EpisodeViewModel: ObservableObject {
    @Published var episodes: [Episode] = []
    @Published var isLoading = false
    
    private var page = 1
    private var maxPage = 20

    func fetchEpisodes() {
        guard isLoading == false else { return }
        guard page < maxPage else { return }
        
        isLoading = true
        CharacterAPI.getEpisodes(page: page) { data, error in
            if error == nil {
                self.page += 1
                self.maxPage = data?.info.pages ?? 0
                self.episodes.append(contentsOf: data?.results ?? [])
            } else {
                print("error: \(error)")
            }
            self.isLoading = false
        }
    }
}
