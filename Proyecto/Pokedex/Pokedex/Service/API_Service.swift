//
//  API_Service.swift
//  Pokedex
//
//  Created by Lolretta on 20/11/25.
//

import Foundation

final class PokeAPIService {
    static let shared = PokeAPIService()
    private init() {}
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2")!
    
    struct APIPokemon: Decodable {
        
        struct APISprite: Decodable {
            struct Other: Decodable {
                struct OfficialArtwork: Decodable {
                    let front_default: String?
                }
                let officialArtwork: OfficialArtwork?
                
                enum CodingKeys: String, CodingKey {
                    case officialArtwork = "official-artwork"
                }
            }
            
            let front_default: String?
            let other: Other?
        }
        
        struct APIStat: Decodable {
            struct StatInfo: Decodable {
                let name: String
            }
            let base_stat: Int
            let stat: StatInfo
        }
        
        struct APIType: Decodable {
            struct TypeInfo: Decodable {
                let name: String
            }
            let type: TypeInfo
        }
        
        struct APIMoveEntry: Decodable {
            struct MoveInfo: Decodable {
                let name: String
                let url: String
            }
            let move: MoveInfo
        }
        
        let id: Int
        let name: String
        let height: Int
        let weight: Int
        let sprites: APISprite
        let stats: [APIStat]
        let types: [APIType]
        let moves: [APIMoveEntry]
    }
    
    struct APIPokemonSpecies: Decodable {
        struct NameEntry: Decodable {
            struct Language: Decodable {
                let name: String
            }
            let name: String
            let language: Language
        }
        
        let names: [NameEntry]
        let is_legendary: Bool
        let is_mythical: Bool
        let capture_rate: Int
    }
    
    struct APIMove: Decodable {
        struct MoveType: Decodable {
            let name: String
        }
        
        struct MoveNameEntry: Decodable {
            struct Language: Decodable {
                let name: String
            }
            let name: String
            let language: Language
        }
        
        let name: String
        let power: Int?
        let accuracy: Int?
        let type: MoveType
        let names: [MoveNameEntry]
    }
    
    struct PokemonListResponse: Decodable {
        let count: Int
        let results: [PokemonListItem]
    }
    
    struct PokemonListItem: Decodable {
        let name: String
        let url: String
    }
    
    
    func fetchPokemon(id: Int) async throws -> APIPokemon {
        let url = baseURL.appendingPathComponent("pokemon/\(id)")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(APIPokemon.self, from: data)
    }
    
    func fetchPokemonSpecies(id: Int) async throws -> APIPokemonSpecies {
        let url = baseURL.appendingPathComponent("pokemon-species/\(id)")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(APIPokemonSpecies.self, from: data)
    }
    
    func fetchMove(byName name: String) async throws -> APIMove {
        let url = baseURL.appendingPathComponent("move/\(name)")
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(APIMove.self, from: data)
    }
    
    func fetchAllPokemonList() async throws -> [PokemonListItem] {
        var components = URLComponents(
            url: baseURL.appendingPathComponent("pokemon"),
            resolvingAgainstBaseURL: false
        )!
        
        components.queryItems = [
            URLQueryItem(name: "limit", value: "10000"),
            URLQueryItem(name: "offset", value: "0")
        ]
        
        let url = components.url!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(PokemonListResponse.self, from: data)
        return response.results
    }
    
}
