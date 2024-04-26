//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Belli on 22/4/24.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
