//
//  PokedexViewController.swift
//  Pokedex26ObjC
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var pokeSearchbar: UISearchBar!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    
    fileprivate func fetchAndSetUI(pokemonName: String) {
        TRAPokemonController.fetchPokemon(withName: pokemonName) { (pokemon) in
            DispatchQueue.main.async {
                guard let pokemon = pokemon else { return }
                self.fetchAndSetImage(for: pokemon)
                self.nameLabel.text = pokemon.name
                self.idLabel.text = "ID: \(pokemon.identifier)"
                self.weightLabel.text = "Weight: \(pokemon.weight)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchbar.delegate = self
        fetchAndSetUI(pokemonName: "charizard")
    }
    
    func fetchAndSetImage(for pokemon: TRAPokemon) {
        TRAPokemonController.fetchImage(withUrlString: pokemon.imageUrl) { (image) in
            DispatchQueue.main.async {
                self.pokeImageView.image = image
            }
        }
    }
}


extension PokedexViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchAndSetUI(pokemonName: searchText.lowercased())
    }
}
