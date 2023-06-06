//
//  NetworkingManager.swift
//  PlaceholderSession
//
//  Created by Maxos on 6/6/23.
//

import Foundation

enum NetworkingManager {
    
    static func fetchData(completion: @escaping (Result<[UsersModel], Error>) -> Void) {
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                do {
                    let result = try JSONDecoder().decode([UsersModel].self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
}
