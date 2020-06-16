//
//  Item.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 29/04/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {

    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: Init
    
    init(nome: String, calorias: Double){
        self.nome = nome
        self.calorias = calorias
    }
    
    // MARK: NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }

}
