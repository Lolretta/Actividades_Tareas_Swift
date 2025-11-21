//
//  Pokemon_ViewModel.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import Foundation
import SwiftUI

@MainActor
class PokemonViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    @Published var searchResults: [Pokemon] = []
    
    @Published var favoriteIDs: Set<Int> = []
    private let favoritesKey = "favoritePokemonIDs"
    
    private let service = PokeAPIService.shared
    private var allPokemonEntries: [PokeAPIService.PokemonListItem] = []
    
    init() {
        loadFavorites()
    }
    
    func isFavorite(_ pokemon: Pokemon) -> Bool {
        favoriteIDs.contains(pokemon.id)
    }
    
    func toggleFavorite(for pokemon: Pokemon) {
        if favoriteIDs.contains(pokemon.id) {
            favoriteIDs.remove(pokemon.id)
        } else {
            favoriteIDs.insert(pokemon.id)
            
            if !pokemons.contains(where: { $0.id == pokemon.id }) {
                pokemons.append(pokemon)
            }
        }
        saveFavorites()
    }
    
    var favoritePokemons: [Pokemon] {
        pokemons.filter { favoriteIDs.contains($0.id) }
    }
    
    func loadInitialPokemons() async {
        let language = currentAppLanguage()
        
        let baseIds = [1, 4, 7, 25, 447, 151]
        let ids = Array(Set(baseIds).union(favoriteIDs))
        
        var loaded: [Pokemon] = []
        
        for id in ids {
            do {
                let apiPokemon = try await service.fetchPokemon(id: id)
                let species = try await service.fetchPokemonSpecies(id: id)
                
                let pokemon = try await mapAPIPokemonToPokemon(
                    apiPokemon: apiPokemon,
                    species: species,
                    language: language
                )
                
                loaded.append(pokemon)
            } catch {
                print("Error al cargar el pokemon \(id): \(error)")
            }
        }
        
        self.pokemons = loaded
        
        do {
            self.allPokemonEntries = try await service.fetchAllPokemonList()
        } catch {
            print("Error al cargar la lista completa de pokémon: \(error)")
        }
    }
    
    func searchPokemons(by prefix: String) async {
        let text = prefix
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
        
        if text.isEmpty {
            await MainActor.run {
                self.searchResults = []
            }
            return
        }
        
        if allPokemonEntries.isEmpty {
            do {
                allPokemonEntries = try await service.fetchAllPokemonList()
            } catch {
                print("Error al cargar la lista completa en search: \(error)")
            }
        }
        
        let matchingEntries = allPokemonEntries.filter { entry in
            entry.name.lowercased().hasPrefix(text)      // prefijo, no "contiene"
        }
        
        let limitedEntries = Array(matchingEntries.prefix(20))
        
        let language = currentAppLanguage()
        var results: [Pokemon] = []
        
        for entry in limitedEntries {
            guard let id = pokemonID(from: entry.url) else { continue }
            
            do {
                let apiPokemon = try await service.fetchPokemon(id: id)
                let species = try await service.fetchPokemonSpecies(id: id)
                
                let pokemon = try await mapAPIPokemonToPokemon(
                    apiPokemon: apiPokemon,
                    species: species,
                    language: language
                )
                
                results.append(pokemon)
            } catch {
                print("Error al cargar pokemon \(entry.name): \(error)")
            }
        }
        
        await MainActor.run {
            self.searchResults = results
        }
    }
    
    private func mapAPIPokemonToPokemon(
        apiPokemon: PokeAPIService.APIPokemon,
        species: PokeAPIService.APIPokemonSpecies,
        language: AppLanguage
    ) async throws -> Pokemon {
        
        let nombre = localizedPokemonName(
            species: species,
            apiPokemon: apiPokemon,
            language: language
        )
        
        let tipos = apiPokemon.types.map { entry in
            localizedTypeName(from: entry.type.name, language: language)
        }
        
        let altura = Float(apiPokemon.height) / 10.0
        let peso = Float(apiPokemon.weight) / 10.0
        let rareza: String
        if species.is_legendary {
            rareza = (language == .spanish) ? "Legendario" : "Legendary"
        } else if species.is_mythical {
            rareza = (language == .spanish) ? "Mitico" : "Mythical"
        } else {
            rareza = (language == .spanish) ? "Comun" : "Common"
        }
        
        let baseStats = mapStats(from: apiPokemon.stats)
        let movesToLoad = Array(apiPokemon.moves.prefix(6))
        var movsDict: [String: Movs] = [:]
        
        for entry in movesToLoad {
            do {
                let apiMove = try await service.fetchMove(byName: entry.move.name)
                let moveName = localizedMoveName(from: apiMove, language: language)
                let moveData = mapAPIMoveToMovs(apiMove, language: language)
                
                movsDict[moveName] = moveData
            } catch {
                print("Error al cargar el movimiento \(entry.move.name): \(error)")
            }
        }
        
        let spriteURL = apiPokemon.sprites.other?.officialArtwork?.front_default ?? apiPokemon.sprites.front_default ?? ""
        
        return Pokemon(
            id: apiPokemon.id,
            image: spriteURL,
            name: nombre,
            tipo: tipos,
            rareza: rareza,
            altura: altura,
            peso: peso,
            BaseStats: [baseStats],
            MaxStats: [Stats.maxStatsGlobal],
            movs: movsDict
        )
    }
    
    private func mapStats(
        from apiStats: [PokeAPIService.APIPokemon.APIStat]
    ) -> Stats {
        var hp = 0
        var attack = 0
        var defense = 0
        var specialAttack = 0
        var specialDefense = 0
        var speed = 0
        
        for stat in apiStats {
            switch stat.stat.name {
            case "hp":
                hp = stat.base_stat
            case "attack":
                attack = stat.base_stat
            case "defense":
                defense = stat.base_stat
            case "special-attack":
                specialAttack = stat.base_stat
            case "special-defense":
                specialDefense = stat.base_stat
            case "speed":
                speed = stat.base_stat
            default:
                break
            }
        }
        
        return Stats(
            hp: hp,
            attack: attack,
            defense: defense,
            specialAttack: specialAttack,
            specialDefense: specialDefense,
            speed: speed
        )
    }
    
    private func pokemonID(from url: String) -> Int? {
        let trimmed = url.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let parts = trimmed.split(separator: "/")
        if let last = parts.last, let id = Int(last) {
            return id
        }
        return nil
    }
    
    private func loadFavorites() {
        if let saved = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] {
            favoriteIDs = Set(saved)
        }
    }
    
    private func saveFavorites() {
        let array = Array(favoriteIDs)
        UserDefaults.standard.set(array, forKey: favoritesKey)
    }
    
}
