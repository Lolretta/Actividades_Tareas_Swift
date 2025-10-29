//
//  Pokemon_ViewModel.swift
//  Pokedex
//
//  Created by Lolretta on 29/10/25.
//

import Foundation

struct PokemonViewModel{
    
    func dummyData() -> [Pokemon] {
        
        let pokemones: [Pokemon] = [
            Pokemon(id: 1, image: "charmander", name: "Charmander", tipo: ["Fuego"], rareza: "Comun",
                    BaseStats: [Stats(hp: 39, attack: 52, defense: 43, specialAttack: 60, specialDefense: 50, speed: 65)],
                    MaxStats: [Stats(hp: 188, attack: 94, defense: 81, specialAttack: 112, specialDefense: 92, speed: 121)],
                    movs: [
                        "Araniazo": Movs(type: "Normal", power: 40, accuracy: 100),
                        "Grunido": Movs(type: "Normal", power: 0, accuracy: 100),
                        "Ascuas": Movs(type: "Fuego", power: 40, accuracy: 100),
                        "Foco Energia": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Cola Ferrea": Movs(type: "Acero", power: 100, accuracy: 75),
                        "Garra Dragon": Movs(type: "Dragón", power: 80, accuracy: 100),
                        "Lanzallamas": Movs(type: "Fuego", power: 90, accuracy: 100),
                        "Ataque Ala": Movs(type: "Volador", power: 60, accuracy: 100),
                        "Danza Espada": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Giro Fuego": Movs(type: "Fuego", power: 35, accuracy: 85),
                        "Nitrocarga": Movs(type: "Fuego", power: 50, accuracy: 100),
                        "Punio Fuego": Movs(type: "Fuego", power: 75, accuracy: 100),
                        "Llamarada": Movs(type: "Fuego", power: 110, accuracy: 85)
                    ]
                   ),
            
            Pokemon(id: 2, image: "squirtle", name: "Squirtle", tipo: ["Agua"], rareza: "Comun",
                    BaseStats: [Stats(hp: 44, attack: 48, defense: 65, specialAttack: 50, specialDefense: 64, speed: 43)],
                    MaxStats: [Stats(hp: 198, attack: 90, defense: 121, specialAttack: 94, specialDefense: 119, speed: 81)],
                    movs:[
                        "Placaje": Movs(type: "Normal", power: 40, accuracy: 100),
                        "Latigo": Movs(type: "Normal", power: 0, accuracy: 100),
                        "Pistola Agua": Movs(type: "Agua", power: 40, accuracy: 100),
                        "Burbuja": Movs(type: "Agua", power: 40, accuracy: 100),
                        "Mordisco": Movs(type: "Siniestro", power: 60, accuracy: 100),
                        "Proteccion": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Cabezazo": Movs(type: "Normal", power: 70, accuracy: 100),
                        "Giro Rapido": Movs(type: "Normal", power: 50, accuracy: 100),
                        "Refugio": Movs(type: "Agua", power: 0, accuracy: 0),
                        "Hidropulso": Movs(type: "Agua", power: 60, accuracy: 100),
                        "Defensa Ferrea": Movs(type: "Acero", power: 0, accuracy: 0),
                        "Acua Jet": Movs(type: "Agua", power: 40, accuracy: 100),
                        "Hidrobomba": Movs(type: "Agua", power: 110, accuracy: 80)
                    ]
                   ),
            
            Pokemon(id: 3, image: "bulbasaur", name: "Bulbasaur", tipo: ["Planta", "Veneno"], rareza: "Comun",
                    BaseStats: [Stats(hp: 45, attack: 49, defense: 49, specialAttack: 65, specialDefense: 65, speed: 45)],
                    MaxStats: [Stats(hp: 200, attack: 91, defense: 91, specialAttack: 121, specialDefense: 121, speed: 83)],
                    movs: [
                        "Placaje": Movs(type: "Normal", power: 40, accuracy: 100),
                        "Gruñido": Movs(type: "Normal", power: 0, accuracy: 100),
                        "Látigo Cepa": Movs(type: "Planta", power: 45, accuracy: 100),
                        "Somnífero": Movs(type: "Planta", power: 0, accuracy: 75),
                        "Drenadoras": Movs(type: "Planta", power: 0, accuracy: 90),
                        "Hoja Afilada": Movs(type: "Planta", power: 55, accuracy: 95),
                        "Polvo Veneno": Movs(type: "Veneno", power: 0, accuracy: 75),
                        "Bomba Lodo": Movs(type: "Veneno", power: 90, accuracy: 100),
                        "Síntesis": Movs(type: "Planta", power: 0, accuracy: 0),
                        "Gigadrenado": Movs(type: "Planta", power: 75, accuracy: 100),
                        "Rayo Solar": Movs(type: "Planta", power: 120, accuracy: 100),
                        "Beso Drenaje": Movs(type: "Hada", power: 50, accuracy: 100)
                    ]
                   ),
            
            Pokemon(id: 4, image: "pikachu", name: "Pikachu", tipo: ["Eléctrico"], rareza: "Comun",
                    BaseStats: [Stats(hp: 35, attack: 55, defense: 40, specialAttack: 50, specialDefense: 50, speed: 90)],
                    MaxStats: [Stats(hp: 180, attack: 103, defense: 76, specialAttack: 94, specialDefense: 94, speed: 166)],
                    movs: [
                        "Impactrueno": Movs(type: "Eléctrico", power: 40, accuracy: 100),
                        "Gruñido": Movs(type: "Normal", power: 0, accuracy: 100),
                        "Ataque Rápido": Movs(type: "Normal", power: 40, accuracy: 100),
                        "Chispa": Movs(type: "Eléctrico", power: 65, accuracy: 100),
                        "Rayo": Movs(type: "Eléctrico", power: 90, accuracy: 100),
                        "Onda Trueno": Movs(type: "Eléctrico", power: 0, accuracy: 90),
                        "Puño Trueno": Movs(type: "Eléctrico", power: 75, accuracy: 100),
                        "Cola Férrea": Movs(type: "Acero", power: 100, accuracy: 75),
                        "Doble Equipo": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Rayo Carga": Movs(type: "Eléctrico", power: 50, accuracy: 90),
                        "Chispazo": Movs(type: "Eléctrico", power: 80, accuracy: 100),
                        "Placaje Eléctrico": Movs(type: "Eléctrico", power: 120, accuracy: 100),
                        "Voltiocambio": Movs(type: "Eléctrico", power: 70, accuracy: 100),
                        "Trueno": Movs(type: "Eléctrico", power: 110, accuracy: 70)
                    ]
                   ),
            
            Pokemon(id: 5, image: "mew", name: "Mew", tipo: ["Psíquico"], rareza: "Mitico",
                    BaseStats: [Stats(hp: 100, attack: 100, defense: 100, specialAttack: 100, specialDefense: 100, speed: 100)],
                    MaxStats: [Stats(hp: 310, attack: 236, defense: 236, specialAttack: 236, specialDefense: 236, speed: 236)],
                    movs: [
                        "Confusión": Movs(type: "Psíquico", power: 50, accuracy: 100),
                        "Viento Cortante": Movs(type: "Volador", power: 60, accuracy: 95),
                        "Rayo Hielo": Movs(type: "Hielo", power: 90, accuracy: 100),
                        "Rayo": Movs(type: "Eléctrico", power: 90, accuracy: 100),
                        "Llamarada": Movs(type: "Fuego", power: 110, accuracy: 85),
                        "Psíquico": Movs(type: "Psíquico", power: 90, accuracy: 100),
                        "Bola Sombra": Movs(type: "Fantasma", power: 80, accuracy: 100),
                        "Poder Oculto": Movs(type: "Normal", power: 60, accuracy: 100),
                        "Puño Fuego": Movs(type: "Fuego", power: 75, accuracy: 100),
                        "Puño Hielo": Movs(type: "Hielo", power: 75, accuracy: 100),
                        "Puño Trueno": Movs(type: "Eléctrico", power: 75, accuracy: 100),
                        "Descanso": Movs(type: "Psíquico", power: 0, accuracy: 0),
                        "Refugio": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Pulso Umbrío": Movs(type: "Siniestro", power: 80, accuracy: 100),
                        "Explosión": Movs(type: "Normal", power: 250, accuracy: 100)
                    ]
                   ),
            
            Pokemon(id: 6, image: "gengar", name: "Gengar", tipo: ["Fantasma", "Veneno"], rareza: "Poco comun",
                    BaseStats: [Stats(hp: 60, attack: 65, defense: 60, specialAttack: 130, specialDefense: 75, speed: 110)],
                    MaxStats: [Stats(hp: 230, attack: 121, defense: 112, specialAttack: 238, specialDefense: 141, speed: 203)],
                    movs: [
                        "Lengüetazo": Movs(type: "Fantasma", power: 30, accuracy: 100),
                        "Hipnosis": Movs(type: "Psíquico", power: 0, accuracy: 60),
                        "Tinieblas": Movs(type: "Fantasma", power: 0, accuracy: 100),
                        "Puño Sombra": Movs(type: "Fantasma", power: 60, accuracy: 100),
                        "Come Sueños": Movs(type: "Psíquico", power: 100, accuracy: 100),
                        "Bola Sombra": Movs(type: "Fantasma", power: 80, accuracy: 100),
                        "Psíquico": Movs(type: "Psíquico", power: 90, accuracy: 100),
                        "Bomba Lodo": Movs(type: "Veneno", power: 90, accuracy: 100),
                        "Onda Tóxica": Movs(type: "Veneno", power: 95, accuracy: 100),
                        "Rayo": Movs(type: "Eléctrico", power: 90, accuracy: 100),
                        "Rayo Hielo": Movs(type: "Hielo", power: 90, accuracy: 100),
                        "Foco Energía": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Sustituto": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Pulso Umbrío": Movs(type: "Siniestro", power: 80, accuracy: 100),
                        "Explosión": Movs(type: "Normal", power: 250, accuracy: 100)
                    ]
                   ),
            
            Pokemon(id: 7, image: "lucario", name: "Lucario", tipo: ["Lucha", "Acero"], rareza: "Raro",
                    BaseStats: [Stats(hp: 70, attack: 110, defense: 70, specialAttack: 115, specialDefense: 70, speed: 90)],
                    MaxStats: [Stats(hp: 250, attack: 202, defense: 130, specialAttack: 211, specialDefense: 130, speed: 166)],
                    movs: [
                        "Puño Meteoro": Movs(type: "Acero", power: 90, accuracy: 90),
                        "A Bocajarro": Movs(type: "Lucha", power: 120, accuracy: 100),
                        "Ataque Óseo": Movs(type: "Tierra", power: 25, accuracy: 90),
                        "Esfera Aural": Movs(type: "Lucha", power: 80, accuracy: 100),
                        "Pulso Umbrío": Movs(type: "Siniestro", power: 80, accuracy: 100),
                        "Pulso Dragón": Movs(type: "Dragón", power: 85, accuracy: 100),
                        "Velocidad Extrema": Movs(type: "Normal", power: 80, accuracy: 100),
                        "Puño Incremento": Movs(type: "Lucha", power: 40, accuracy: 100),
                        "Puño Trueno": Movs(type: "Eléctrico", power: 75, accuracy: 100),
                        "Puño Hielo": Movs(type: "Hielo", power: 75, accuracy: 100),
                        "Puño Fuego": Movs(type: "Fuego", power: 75, accuracy: 100),
                        "Colmillo Ígneo": Movs(type: "Fuego", power: 65, accuracy: 95),
                        "Tajo Umbrío": Movs(type: "Siniestro", power: 70, accuracy: 100),
                        "Cabeza de Hierro": Movs(type: "Acero", power: 80, accuracy: 100),
                        "Danza Espada": Movs(type: "Normal", power: 0, accuracy: 0),
                        "Pulso Aura": Movs(type: "Lucha", power: 80, accuracy: 100)
                    ]
                   )
        ]
        
        return pokemones
    }
}
