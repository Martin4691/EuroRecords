//
//  FetchManagers.swift
//  EuroResults
//
//  Created by Martín on 30/8/22.
//

import Foundation
import UIKit


public class FetchsModels {
    
    var queryModel: QueryModel = QueryModel(page: 0, perPage: 0, total: 0, data: [])
    var resultModel: Resultado = Resultado(bolas: [], estrellas: [])
    var raffleNumber: Int = 1
    var yearNumber: Int = 2004
    
    // Historical Number of Total Raffles:
    var year2004: Int = 47
    var year2005: Int = 52
    var year2006: Int = 52
    var year2007: Int = 52
    var year2008: Int = 52
    var year2009: Int = 52
    var year2010: Int = 53
    var year2011: Int = 86
    var year2012: Int = 104
    var year2013: Int = 105
    var year2014: Int = 104
    var year2015: Int = 104
    var year2016: Int = 105
    var year2017: Int = 104
    var year2018: Int = 104
    var year2019: Int = 104
    var year2020: Int = 105
    var year2021: Int = 103
    var year2022: Int = 54
    
    
    
    
    //MARK: Call:
    static func fetchRaffleInfo(yearSelected: Int, raffleNumber: Int, success succeed: (@escaping (QueryModel?) -> ()), failure failed: (@escaping () -> ())) {
        
        let url: String = "https://www.pronostigol.es/api/euromillones/tickets?"
        let params: [String: Any] = [
            "year" : String(yearSelected),
            "raffle" : String(raffleNumber),
            "page" : "1",
            "per_page" : "1",
            "sort_type" : "asc",
            "sort_property" : "date"
        ]
        
        AF.request(url, method: .get, parameters: params).validate().responseDecodable(of: QueryModel.self) { response in
            guard let raffleResponse = response.value else { return }
            succeed(raffleResponse)
        }
    }
    
    
    
    /*
    
    //MARK: Raffles per Style **TO DO: Dates more accuracy**
     func style1() {
        // 2004 - May 2011
        getRaffles(year: 2004) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2004")
        }
        getRaffles(year: 2005) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2005")
        }
        getRaffles(year: 2006) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2006")
        }
        getRaffles(year: 2007) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2007")
        }
        getRaffles(year: 2008) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2008")
        }
        getRaffles(year: 2009) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2009")
        }
        getRaffles(year: 2010) {_ in
            print("msm: Esta buscando y agregando los resultados del año 20010")
        }
        getRaffles(year: 2011) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2011")
        }
    }
    
    func style2() {
        // May 2011 - Sept. 2016
        
        getRaffles(year: 2012) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2012")
        }
        getRaffles(year: 2013) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2013")
        }
        getRaffles(year: 2014) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2014")
        }
        getRaffles(year: 2015) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2015")
        }
    }
    
    func style3() {
        // Sept. 2016 - Now
        getRaffles(year: 2016) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2016")
        }
        getRaffles(year: 2017) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2017")
        }
        getRaffles(year: 2018) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2018")
        }
        getRaffles(year: 2019) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2019")
        }
        getRaffles(year: 2020) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2020")
        }
        getRaffles(year: 2021) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2021")
        }
        getRaffles(year: 2022) {_ in
            print("msm: Esta buscando y agregando los resultados del año 2022")
        }
    }
    
    */
    
    
    
}


