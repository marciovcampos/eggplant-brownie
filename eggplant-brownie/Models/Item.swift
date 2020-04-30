//
//  Item.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 29/04/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }

}
