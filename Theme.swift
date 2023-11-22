//
//  theme.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 17/11/23.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable{
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    case blue
    
    var accentColor: Color{
        switch self{
        case .bubblegum, .buttercup, .indigo, .lavender, .magenta, .navy, .orange, .oxblood, .blue, .purple, .teal:
            return .white
        case .periwinkle, .poppy, .seafoam, .sky, .tan, .yellow:
            return .black
        }
    }
    
    var maincolor: Color{
         Color(rawValue)
    }
    
    var name: String{
        rawValue.capitalized
    }
    
    var id: String{
        name
    }
}

