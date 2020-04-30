import UIKit

var str = "Hello, playground"


let nome = "churros"
let felicidade: Int = 5
let calorias: Double = 79.5
let vegetal: Bool = false


func alimentoConsumido(){
    print("o alimento consumido foi: \(vegetal)")
}

alimentoConsumido()



class Refeicao {
    var nome: String
    let felicidade: String
    
    init(nome: String, felicidade: String){
        self.nome = nome
        self.felicidade = felicidade
    }
}

print(refeicao.nome)



