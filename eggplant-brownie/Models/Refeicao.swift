//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 29/04/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
    
    let nome: String
    let felicidade: Int
    let itens: Array<Item> = []
    
    init(nome: String, felicidade: Int){
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens {
            total += item.calorias
        }
        
        return total
    }

}
