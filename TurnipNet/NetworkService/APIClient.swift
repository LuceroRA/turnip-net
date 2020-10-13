//
//  APIClient.swift
//  TurnipNet
//
//  Created by Rodrigo Lucero on 10/13/20.
//

import Foundation
import Combine

// This is a generic API Client that will handle all requests.
// The client will process any request and attempt to decode the response to the given type. 
struct APIClient {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
