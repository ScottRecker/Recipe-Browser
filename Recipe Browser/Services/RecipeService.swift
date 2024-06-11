//
//  RecipeService.swift
//  Recipe Browser
//
//  Created by Scott Recker on 6/9/24.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case malformedUrl
    case decodingError(_ description: String)
    case invalidResponse(_ description: String)
    case unsupportedImage
    case unknown(_ description: String)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .malformedUrl:
            return "Unable to create URL"
        case .decodingError(let description):
            return description
        case .invalidResponse(let description):
            return description
        case .unsupportedImage:
            return "Unable to find image"
        case .unknown(let description):
            return description
        }
    }
}

struct RecipeService {
    private static let dessertListURL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    private static let mealURL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php")

    static func getMealPreviews() async throws -> [MealPreview] {
        guard let dessertListURL else { throw NetworkError.malformedUrl }
        do {
            let data = try await fetchData(url: dessertListURL)
            let mealList = try JSONDecoder().decode(MealsResponse.self, from: data)
            return mealList.meals
        } catch {
            throw NetworkError.decodingError(error.localizedDescription)
        }
    }
    
    static func getMealDetails(mealId: String) async throws -> Meal {
        guard var mealURL else { throw NetworkError.malformedUrl }
        let queryItem = URLQueryItem(name: "i", value: mealId)
        mealURL.append(queryItems: [queryItem])
        do {
            let data = try await fetchData(url: mealURL)
            let response = try JSONDecoder().decode(Meals.self, from: data)
            return response.meals[0]
        } catch {
            throw NetworkError.decodingError(error.localizedDescription)
        }

    }

    static func loadImage(url: URL) async throws -> Image {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            guard let uiImage = UIImage(data: data) else {
                throw NetworkError.unsupportedImage
            }

            return Image(uiImage: uiImage)
        } catch {
            throw NetworkError.invalidResponse(error.localizedDescription)
        }
    }

    private static func fetchData(url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode >= 200 || httpResponse.statusCode < 300 else {
                throw NetworkError.invalidResponse("Incorrect http status code")
            }
            return data
        } catch {
            throw NetworkError.unknown(error.localizedDescription)
        }

    }
}
