//
//  RemoteImage.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 26/07/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func loadImageFromServer(imageUrl : String) {
        NetworkManager.shared.downloadImage(fromURLString: imageUrl) { uiImage in
            guard let uiImage = uiImage else {  return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage: View {
    var image:Image?
    var body: some View {
        image?.resizable().aspectRatio(contentMode: .fit) ?? Image("food-placeholder").resizable().aspectRatio(contentMode: .fit)
    }
}

struct AppetizerImage: View {
    @StateObject var imageLoader = ImageLoader()
    let imageUrl: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.loadImageFromServer(imageUrl: imageUrl)
            }
    }
}
