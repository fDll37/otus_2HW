//
//  SuperDetailView.swift
//  2HW
//
//  Created by Данил Менделев on 30.09.2022.
//

import NetworkLayer
import SwiftUI

struct SuperDetailView: View {
    @Binding var character: CharacterModel
    @EnvironmentObject var navModel: NavigationControllerViewModel
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: character.image ?? ""))
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
//
//struct SuperDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SuperDetailView()
//    }
//}
