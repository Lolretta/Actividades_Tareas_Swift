//
//  LocalizationHelpers.swift
//  Pokedex
//
//  Created by Lolretta on 21/11/25.
//

import Foundation

// Idioma de la app según el sistema
enum AppLanguage {
    case spanish
    case english
}

func currentAppLanguage() -> AppLanguage {
    // iOS 16 en adelante
    if #available(iOS 16.0, *) {
        if let code = Locale.current.language.languageCode?.identifier {
            if code.hasPrefix("es") {
                return .spanish
            } else {
                return .english
            }
        }
    }
    
    // Si algo falla (o iOS mas antiguo), usamos ingles por defecto
    return .spanish
}

// Nombre de tipos en español e inglés
let typeNamesES: [String: String] = [
    "fire": "Fuego",
    "water": "Agua",
    "grass": "Planta",
    "electric": "Eléctrico",
    "steel": "Acero",
    "dragon": "Dragón",
    "flying": "Volador",
    "normal": "Normal",
    "fighting": "Lucha",
    "dark": "Siniestro",
    "poison": "Veneno",
    "bug": "Bicho",
    "psychic": "Psíquico",
    "ghost": "Fantasma",
    "fairy": "Hada",
    "ice": "Hielo",
    "ground": "Tierra",
    "rock": "Roca"
]

let typeNamesEN: [String: String] = [
    "fire": "Fire",
    "water": "Water",
    "grass": "Grass",
    "electric": "Electric",
    "steel": "Steel",
    "dragon": "Dragon",
    "flying": "Flying",
    "normal": "Normal",
    "fighting": "Fighting",
    "dark": "Dark",
    "poison": "Poison",
    "bug": "Bug",
    "psychic": "Psychic",
    "ghost": "Ghost",
    "fairy": "Fairy",
    "ice": "Ice",
    "ground": "Ground",
    "rock": "Rock"
]

// Convierte el tipo de la API ("fire") a "Fuego" o "Fire"
func localizedTypeName(from apiType: String, language: AppLanguage) -> String {
    switch language {
    case .spanish:
        return typeNamesES[apiType, default: apiType.capitalized]
    case .english:
        return typeNamesEN[apiType, default: apiType.capitalized]
    }
}

// Nombre del Pokémon en español o inglés según species.names
func localizedPokemonName(
    species: PokeAPIService.APIPokemonSpecies,
    apiPokemon: PokeAPIService.APIPokemon,
    language: AppLanguage
) -> String {
    let langKey = (language == .spanish) ? "es" : "en"
    
    if let entry = species.names.first(where: { $0.language.name == langKey }) {
        return entry.name
    } else {
        return apiPokemon.name.capitalized
    }
}

// Nombre de movimiento según idioma
func localizedMoveName(
    from apiMove: PokeAPIService.APIMove,
    language: AppLanguage
) -> String {
    let langKey = (language == .spanish) ? "es" : "en"
    if let entry = apiMove.names.first(where: { $0.language.name == langKey }) {
        return entry.name
    } else {
        return apiMove.name.capitalized
    }
}

// Convierte el movimiento de la API a tu struct Movs
func mapAPIMoveToMovs(_ apiMove: PokeAPIService.APIMove, language: AppLanguage) -> Movs {
    let moveTypeName = localizedTypeName(from: apiMove.type.name, language: language)
    
    return Movs(
       type: moveTypeName,
       power: apiMove.power ?? 0,
       accuracy: apiMove.accuracy ?? 0
    )
}
