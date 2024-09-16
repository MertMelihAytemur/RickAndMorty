//
//  CharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Mert Melih Aytemur on 16.09.2024.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let speciesLabel = UILabel()
    let characterImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(speciesLabel)
        contentView.addSubview(characterImageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            characterImageView.widthAnchor.constraint(equalToConstant: 50),
            characterImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            speciesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            speciesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            speciesLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            speciesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    
    func configure(with viewModel: CharacterCellViewModel) {
        nameLabel.text = viewModel.name
            speciesLabel.text = viewModel.species
            
        if let url = URL(string: viewModel.image) {
                characterImageView.kf.setImage(with: url)
            } else {
                characterImageView.image = UIImage(named: "placeholder")
            }
    }
}
