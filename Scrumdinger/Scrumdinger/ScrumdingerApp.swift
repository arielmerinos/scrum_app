//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ariel Merino on 17/11/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
