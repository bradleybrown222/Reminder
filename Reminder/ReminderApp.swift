//
//  ReminderApp.swift
//  Reminder
//
//  Created by Bradley Brown on 3/20/22.
//

import SwiftUI

@main
struct ReminderApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
