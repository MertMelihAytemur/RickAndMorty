//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by Mert Melih Aytemur on 16.09.2024.
//

import Foundation
import Kingfisher

class CharacterListViewModel {
    
    private var apiService = APIService()
    private var characters = [Character]()
    private var currentPage = 1
    private var totalPages = 1
    
    var isLoading: Bool = false {
        didSet {
            updateLoadingState?(isLoading)
        }
    }
    
    var updateLoadingState: ((Bool) -> Void)?
    
    var reloadTableView: (() -> Void)?
    
    var characterCellViewModels = [CharacterCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    func loadCharacters() {
        guard !isLoading, currentPage <= totalPages else { return }
        
        isLoading = true
        
        apiService.fetchCharacters(page: currentPage) { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let characterResponse):
                self.totalPages = characterResponse.info.pages
                self.currentPage += 1
                self.characters.append(contentsOf: characterResponse.results)
                self.createCellViewModels()
            case .failure(let error):
                print("Error fetching characters: \(error.localizedDescription)")
            }
        }
    }
    
    private func createCellViewModels() {
        characterCellViewModels = characters.map { character in
            CharacterCellViewModel(name: character.name, species: character.species, image: character.image)
        }
    }
}

struct CharacterCellViewModel {
    let name: String
    let species: String
    let image: String
}
