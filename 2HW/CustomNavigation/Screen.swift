//
//  Screen.swift
//  2HW
//
//  Created by Данил Менделев on 24.09.2022.
//

import Foundation
import SwiftUI

struct Screen: Identifiable, Equatable {
    let id: String
    let screenView: AnyView

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
