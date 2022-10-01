//
//  CustomDetailView.swift
//  2HW
//
//  Created by Данил Менделев on 24.09.2022.
//
import NetworkLayer
import SwiftUI

struct CustomDetailView: View {
    
    @Binding var character: CharacterModel
    @EnvironmentObject var navModel: NavigationControllerViewModel
    
    var body: some View {
        VStack(alignment: .center){
            Text(character.name)
            Text(character.gender)
            Text(character.status)
            Text("Tap me! \n You are get super detail information about \(character.name)")
                .padding()
                .onTapGesture {
                    navModel.push(newView: SuperDetailView(character: $character))
                }
            Button {
                navModel.pop()
            } label: {
                Text("Back")
            }
        }
    }
}

