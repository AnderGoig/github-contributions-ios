//
//  ArrayExtensions.swift
//  InterfaceKit
//
//  Created by Ander Goig on 19/10/2020.
//

// MARK: - Methods

extension Array {

    func element(at index: Int) -> Element? {
        index >= 0 && index < endIndex ? self[index] : nil
    }

}
