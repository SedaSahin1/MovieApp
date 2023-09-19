//
//  ViewModel.swift
//  movieapp
//
//  Created by Seda Şahin on 17.09.2023.
//

import Foundation

public class ViewModel: NSObject {
    deinit {
        let type = Swift.type(of: self)
        print("\(type) DEALLOCATED")
    }
    var updateUI: (() -> Void)?
}
