//
//  VisionPro1App.swift
//  VisionPro1
//
//  Created by Bobby Beckmann on 3/27/24.
//

import SwiftUI

@main
struct VisionPro1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
