//
//  Clubhouse2App.swift
//  Shared
//
//  Created by Jared on 3/15/21.
//

import Amplify
import AmplifyPlugins
import SwiftUI

@main
struct Clubhouse2App: App {
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
    
    private func configureAmplify() {
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())

        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()
            print("Initialized Amplify");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
    }
}
