//
//  LeadingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 18/11/23.
//

import SwiftUI

struct LeadingIconLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.icon
                .fontWeight(.bold)
            configuration.title
        
        }
    }
}


extension LabelStyle where Self == LeadingIconLabelStyle{
    static var leadingStyle: Self { Self() }
}
