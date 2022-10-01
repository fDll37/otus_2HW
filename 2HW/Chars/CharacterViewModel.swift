//
//  CharacterViewModel.swift
//  2HW
//
//  Created by Данил Менделев on 25.09.2022.
//

import Foundation
import NetworkLayer


class CharacterViewModel: ObservableObject {
    @Published var characters: [CharacterModel] = []
    @Published var isLoading = false
    
    private var page = 1
    private var maxPage = 20
    
    func fetchChars() {
        guard isLoading == false else { return }
        guard page < maxPage else { return }
        
        isLoading = true
        CharacterAPI.charactersGet(page: page) { data, error in
            if error == nil {
                self.page += 1
                self.maxPage = data?.info.pages ?? 0
                self.characters.append(contentsOf: data?.results ?? [])
            } else {
                print("error: \(error)")
            }
            self.isLoading = false
        }
    }
}
