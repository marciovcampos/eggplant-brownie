//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Marcio Vinicius Campos da Silveira on 10/06/20.
//  Copyright © 2020 MarcioVCampos. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AddRefeicaoDelegate {
    
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDao().recupera()
    }

     // MARK: - UITableViewDataSource
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return refeicoes.count
     }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let linha = indexPath.row

         let refeicao = refeicoes[linha]

         let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
         cell.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_ :)))
        cell.addGestureRecognizer(longPress)

         return cell
     }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        RefeicaoDao().save(refeicoes)
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: {
                    alerta in
                    self.refeicoes.remove(at: indexPath.row)
                    RefeicaoDao().save(self.refeicoes)
                    self.tableView.reloadData()
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionarRefeicao" {
            if let viewController =  segue.destination as? ViewController{
                viewController.delegate = self
                   }
        }
    }
    
}
