//
//  Collection + pading.swift
//  2HW
//
//  Created by Данил Менделев on 30.09.2022.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func needToFetch<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        let distance = self.distance(from: itemIndex, to: endIndex)

        return distance == 2
    }
}
