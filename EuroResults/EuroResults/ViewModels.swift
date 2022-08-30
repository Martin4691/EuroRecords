//
//  ViewModels.swift
//  EuroResults
//
//  Created by Martín on 30/8/22.
//

import Foundation
import UIKit

// Modelo para cada estilo
struct HistoricalStyleModel {
    var stylerAnalized: [Resultado]
}

// Modelo para Todos
struct AllTimeRafflesModel {
    var historical: [Resultado]
}

// Modelo para año
struct HistoricalRafflesYearModel {
    var yearAnalized: [Resultado]
}

// MARK: - QueryModel
struct QueryModel: Codable {
    let page, perPage, total: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let resultado: Resultado
    let id: String
    let anyo: Int
    let fecha: String
    let sorteo: Int
    
    enum CodingKeys: String, CodingKey {
        case resultado
        case id = "_id"
        case anyo, fecha, sorteo
    }
}

// MARK: - Resultado
struct Resultado: Codable {
    let bolas, estrellas: [Bola]
}

// MARK: - Bola
struct Bola: Codable {
    let id: String
    let numero: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case numero
    }
}
