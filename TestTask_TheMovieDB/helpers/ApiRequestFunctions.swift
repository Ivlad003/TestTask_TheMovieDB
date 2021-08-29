//
//  ApiRequestFunctions.swift
//  ApiRequestFunctions
//
//  Created by kosmodev on 29.08.2021.
//

import Foundation

func sendRequest(_ url: String, parameters: [String: String], completion: @escaping (PageWithMovies?, Error?) -> Void) {
    var components = URLComponents(string: url)!
    components.queryItems = parameters.map { (key, value) in
        URLQueryItem(name: key, value: value)
    }
    components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
    let request = URLRequest(url: components.url!)
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let data = data,                              // is there data
            let response = response as? HTTPURLResponse,  // is there HTTP response
            200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
            error == nil                                  // was there no error
        else {
            completion(nil, error)
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let result = try! decoder.decode(PageWithMovies.self, from: data)
        
        completion(result, nil)
    }
    task.resume()
}
