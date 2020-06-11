//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 11/06/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

protocol  AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text,
            let calorias = caloriasTextField.text else {
            return
        }
        
        guard let numeroCalorias = Double(calorias) else {
            return
        }
        
        let item = Item(nome: nome, calorias: numeroCalorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    
}
