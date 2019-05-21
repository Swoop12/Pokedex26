//
//  ViewController.swift
//  Pokedex26
//
//  Created by DevMountain on 5/21/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {
    
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var pokeSearchBar : UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonController.fetchPokemonWith(name: "charizard") { (pokemon) in
            if let imageUrl = pokemon?.imageUrl {
                self.fetchAndSetImageFor(url: imageUrl)
            }
            DispatchQueue.main.async {
                self.nameLabel.text = pokemon?.name
                self.idLabel.text = "\(pokemon?.id ?? 0)"
                self.weightLabel.text = "\(pokemon?.weight ?? 0)"
            }
        }
        
    }
    
    func fetchAndSetImageFor(url: String) {
        PokemonController.fetchImageAt(urlString: url) { (image) in
            DispatchQueue.main.async {
                self.pokeImageView.image = image
            }
        }
    }


}

