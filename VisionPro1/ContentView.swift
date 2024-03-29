//
//  ContentView.swift
//  VisionPro1
//
//  Created by Bobby Beckmann on 3/27/24.
//

import SwiftUI
import AVKit
import RealityKit
import RealityKitContent



struct ContentView: View {
    @State private var showVideoPlayer = false // State to control video player visibility
    @State private var showVoiceCallView = false // Add this line
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {

            Text("Welcome To Revmo")
            
                    
            HStack { // Container for buttons, placed in line with your design request
                // Left button with image
                Button(action: {
                    // Action for left button
                    self.showVideoPlayer = true
                }) {
                    Image(systemName: "film") // Use a system image or your custom image
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fit) // Keep the image's aspect ratio
                        .padding(30) // Increase padding to make the button larger
                        .frame(width: 100, height: 100) // Set the frame to be larger
                        .background(Color.blue) // Background color of the button
                        .foregroundColor(.white) // Image color
                        .clipShape(Circle()) // Make the button rounded
                }
                .sheet(isPresented: $showVideoPlayer) { // Present the video player as a sheet
                    VideoPlayerView(showVideoPlayer: $showVideoPlayer,videoName: "revmo_captions_cta_added (720p)", videoType: "mp4") // Your MP4 filename
                }

                Spacer() // This will push both buttons to the sides

                // Right button with image
                Button(action: {
                    // Action for right button
                    let webURL = URL(string: "revmo://")!
                                UIApplication.shared.open(webURL, options: [:], completionHandler: nil)

                }) {
                    Image(systemName: "phone") // Use a system image or your custom image
                        .resizable() // Make the image resizable
                        .aspectRatio(contentMode: .fit) // Keep the image's aspect ratio
                        .padding(30) // Increase padding to make the button larger
                        .frame(width: 100, height: 100) // Set the frame to be larger
                        .background(Color.green) // Background color of the button
                        .foregroundColor(.white) // Image color
                        .clipShape(Circle()) // Make the button rounded
                }
            }
            .frame(width: 360) // This frame width matches your toggle frame width
            .padding(24) // Padding to match your toggle's layout
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Makes sure the VStack fills the whole screen
            .background(
                Image("revmo") // Replace "YourBackgroundImageName" with the name of your image
                    .resizable() // This makes the image resizable
                    .aspectRatio(contentMode: .fit) // Fills the background, potentially cropping the image
                    .edgesIgnoringSafeArea(.all) // Makes sure the image extends to the edges of the display
            )
        }
        .padding()

    }
}
struct VideoPlayerView: View {
    @Binding var showVideoPlayer: Bool
    var videoName: String
    var videoType: String
    
    var body: some View {
        ZStack {
            // Overlay Close Button at the bottom over the video
            VStack {
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: videoType)!))
                .onAppear {
                    AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: videoType)!).play()
                }
                .edgesIgnoringSafeArea(.all) // Video player fills the entire screen

                Spacer() // Pushes everything to the bottom
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure ZStack fills the entire screen
    }
}




#Preview(windowStyle: .automatic) {
    ContentView()
}
