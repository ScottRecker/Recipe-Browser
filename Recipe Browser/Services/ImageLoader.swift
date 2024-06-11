//
//  ImageDownloader.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/11/24.
//

import SwiftUI
import OSLog

@Observable
class ImageLoader {
    let logger = Logger(subsystem: "com.recker.Recipe-Browser", category: "ImageLoader")

    var uiImage: UIImage?
    private static let cache = NSCache<NSString, UIImage>()
    
    func fetchImage(url: String) async throws {
        guard let url = URL(string: url) else {
            throw NetworkError.malformedUrl
        }

        let request = URLRequest(url: url)

        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString) {
            uiImage = cachedImage
            logger.debug("🔵 Fetched cached image \(url)")
        } else {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse("Unexpected httpResponse status code")
            }

            guard let image = UIImage(data: data) else {
                throw NetworkError.unsupportedImage
            }

            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            uiImage = image
            logger.debug("🔴 Fetched image \(url)")
        }
    }
}
