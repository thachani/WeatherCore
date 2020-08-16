//
//  NetworkManager.swift
//  WeatherCore
//
//  Created by Tarek HACHANI on 16/08/2020.
//  Copyright © 2020 Tarek-HACHANI. All rights reserved.
//

import Foundation

public enum NetworkTaskError: Error {
    case badRequest(description: String)
    case badStatusCode(description: String)
    case badData
    case unknown

    var localizedDescription: String {
        switch self {
        case .badRequest(let description):
            return description
        case .badStatusCode(let description):
            return description
        case .badData:
            return "invalide Json "
        case .unknown:
            return "erreur inconnue"
        }
    }
}

enum NetworkTaskResult<T> {
    case success(result: T)
    case failure(error: NetworkTaskError)
}

typealias NetworkTaskCompletion = (NetworkTaskResult<Data>) -> Void

class NetworkManager {

    // MARK: -

    static let shared = NetworkManager()
    var session: URLSession?

    // MARK: -

    func setConfiguration(configuration: URLSessionConfiguration? = nil) {
        guard let configuration = configuration else {
            setDefaultConfiguration()
            return
        }
        self.session = URLSession(configuration: configuration)
    }

    func perform(_ request: URLRequest, completion: @escaping NetworkTaskCompletion) {
        setConfiguration()
        let task = session?.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error: .badRequest(description: error.localizedDescription)))
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)  else {
                completion(.failure(error: .badStatusCode(description: "invalid status code")))
                return
            }
            guard let data = data else {
                completion(.failure(error: .badData))
                return
            }
            completion(.success(result: data))
        }
        task?.resume()
    }

    // MARK: - Privates

    private func setDefaultConfiguration() {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        config.timeoutIntervalForRequest = 60
        config.timeoutIntervalForResource = 60

        self.session = URLSession(configuration: config)
    }
}

