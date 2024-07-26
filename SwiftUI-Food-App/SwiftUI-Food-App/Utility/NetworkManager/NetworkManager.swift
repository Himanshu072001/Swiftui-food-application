//
//  NetwrokManager.swift
//  SwiftUI-Food-App
//
//  Created by Himanshu Kesharwani on 25/07/24.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
    static let endPoint = "/appetizers"
    private let serverURL = baseURL + endPoint
    
    private init() {}
    
    
    func getAppetizers(completion: @escaping(Result<[Appetizer], APIError>) -> Void) {
        guard let url = URL(string: serverURL) else {
            completion(.failure(.invalidURL))
            return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data,
            response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                print("Data = \(data)")
                let decodedResponse = try decoder.decode(AppetizerResponse.self,
                                                         from: data)
                completion(.success(decodedResponse.request))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }

}
