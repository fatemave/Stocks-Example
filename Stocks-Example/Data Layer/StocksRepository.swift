//
//  StocksRepository.swift
//  Stocks-Example
//
//  Created by user on 01.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import GKUseCase
import GKNetwork

public class StocksRepository: Repository {
    
    public lazy var stocksRemoteInterface: StocksRemoteWorkerInterface = StocksRemoteWorker()
    
    init() {
        super.init(modelName: "Stocks_Example")
    }

    public override func execute<T>(_ request: URLRequest, response: T.Type, completion: ((Any?, HTTPURLResponse?, Error?) -> Void)? = nil) where T : Decodable, T : Encodable {
        self.stocksRemoteInterface.execute(request, model: response) { (result, response, error) in
            if let arrayResult = result as? [RemoteMappable] {
                let mappedResult = arrayResult.map({ $0.mapResponseToDomain() })
                
                guard let completion = completion else { return }
                completion(mappedResult, response, error)
            } else if let singleResult = result as? RemoteMappable {
                let mappedResult = singleResult.mapResponseToDomain()
                
                guard let completion = completion else { return }
                completion(mappedResult, response, error)
            } else {
                guard let completion = completion else { return }
                completion(nil, response, error)
            }
        }
    }

}
