//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 21/11/23.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .frame(maxWidth: .infinity)
            .background(theme.maincolor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(4)
    }
}

#Preview {
    ThemeView(theme: .blue)
}
