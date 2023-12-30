//
//  RemoteImage.swift
//  APIcall
//
//  Created by jay sabeen on 28/12/23.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromUrl urlstring: String) {
        GetApptizerAPI().downloadImage(fromUrl: urlstring) {
            uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(systemName: "takeoutbag.and.cup.and.straw.fill").resizable()
    }
}

struct ApptizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.load(fromUrl: urlString)
            }
    }
}

#Preview {
    ApptizerRemoteImage(urlString: "https://seanallen-course-backend.herokuapp.com/images/appetizers/buffalo-chicken-bites.jpg")
}
