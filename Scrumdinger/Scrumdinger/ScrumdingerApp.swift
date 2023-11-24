//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 17/11/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
