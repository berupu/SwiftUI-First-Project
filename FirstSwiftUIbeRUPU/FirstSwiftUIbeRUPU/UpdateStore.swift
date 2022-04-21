//
//  UpdateStore.swift
//  FirstSwiftUIbeRUPU
//
//  Created by be RUPU on 16/12/21.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    
    var updates: [Update] {
        didSet {
            didChange.send()
        }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
    
    
}
