//
//  ArrayExtensions.swift
//  InterfaceKit
//
//  Created by Ander Goig on 19/10/2020.
//

extension Array {
    // MARK: - Methods

    func element(at index: Int) -> Element? {
        index >= 0 && index < endIndex ? self[index] : nil
    }
}
