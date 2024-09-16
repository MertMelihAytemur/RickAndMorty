//
//  ApiService.swift
//  RickAndMorty
//
//  Created by Mert Melih Aytemur on 16.09.2024.
//

import Alamofire

class APIService {
    func fetchCharacters(page: Int, completion: @escaping (Result<RickAndMortyResponse, Error>) -> Void) {
        let url = "https://rickandmortyapi.com/api/character?page=\(page)"
        
        AF.request(url).responseDecodable(of: RickAndMortyResponse.self) { response in
            switch response.result {
            case .success(let characterResponse):
                print("Success fetching characters:")
                completion(.success(characterResponse))
            case .failure(let error):
                print("Error fetching characters: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
