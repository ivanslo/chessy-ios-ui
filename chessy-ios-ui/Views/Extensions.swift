//
//  Extensions.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 04/10/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation

extension Comparable {
    func clamped(_ f: Self, _ t: Self) -> Self {
        var r = self
        if r < f { r = f }
        if r > t { r = t }
        return r
    }
}
