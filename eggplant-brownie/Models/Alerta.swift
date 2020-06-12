//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 12/06/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe(){
        let alerta = UIAlertController(title: "Desculpe", message: "não foi possível atualizar a tabela", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
