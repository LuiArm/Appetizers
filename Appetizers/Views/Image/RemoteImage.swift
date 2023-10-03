//
//  RemoteImage.swift
//  Appetizers
//
//  Created by luis armendariz on 9/28/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    //Downloads image and will broadcast once it is downloaded
    @Published var image: Image? = nil
    
    
    //make network call
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                //setting swiftui image from uikit image
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    //optional image because we may not have an image
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}



struct AppetizerRemoteImage: View {
    
    // watching this image loader, and iniatilizing new image loader
    @StateObject var imageLoader = ImageLoader()
    
    //string passed in depending on appetizer
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { // on appear calls image loader . load to pass in url to make network call
                imageLoader.load(fromURLString: urlString)
            }
    }
    
}
