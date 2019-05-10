//
//  PokeDetailViewController.swift
//  Pokedex
//
//  Created by Hector Steven on 5/10/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class PokeDetailViewController: UIViewController, UISearchBarDelegate {

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		searchBar.delegate = self
		setupViews()
    }
    
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let text = searchBar.text else { return }
		
		pokeController?.fetchPokemonData(text, completion: { error in
			if let error = error {
				print("error fetching \(error)")
				return
			} else {
				
				DispatchQueue.main.async {
					self.pokemon = self.pokeController?.currentPokemon
					
				}
			}
		})
	}
	@IBAction func catchPokemonButton(_ sender: Any) {
		guard let pokemon = pokemon else { return }
		pokeController?.catchPokemon(poke: pokemon)
		navigationController?.popViewController(animated: true)
	}
	
	func setupViews () {
		guard let pokemon = pokemon else {
			
			idvisibleLabel.isHidden = true
			typeVisibleLabel.isHidden = true
			abilitiesVisiblelable.isHidden = true
			catchButtonOutlet.isHidden = true
			return
		}
		idvisibleLabel.isHidden = false
		typeVisibleLabel.isHidden = false
		abilitiesVisiblelable.isHidden = false
		catchButtonOutlet.isHidden = false
		
		pokeLabel?.text = pokemon.name
		pokeidLabel?.text = String(pokemon.id)
		
		for types in pokemon.types {
			print(types.type.name)
			
		}
		print(pokemon.abilities.count)
	}
	
	@IBOutlet var catchButtonOutlet: UIButton!
	@IBOutlet var idvisibleLabel: UILabel!
	@IBOutlet var typeVisibleLabel: UILabel!
	@IBOutlet var abilitiesVisiblelable: UILabel!
	
	@IBOutlet var pokeLabel: UILabel!
	@IBOutlet var pokeidLabel: UILabel!
	@IBOutlet var pokeAbilitiesLabel: UILabel!
	@IBOutlet var pokeImageView: UIImageView!
	@IBOutlet var searchBar: UISearchBar!
	
	
	var pokeController: PokeController? {
		didSet {
			
		}
	}
	var pokemon: Pokemon? {
		didSet {
			
			setupViews()
		}
	}
}
