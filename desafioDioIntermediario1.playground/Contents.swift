import UIKit



enum TipoAlimento {
    case fruta
    case vegetal
    case carne
    case laticinio
}


struct ItemAlimentar {
    var nome: String
    var tipo: TipoAlimento

    func descricao() -> String {
        return "Alimento: \(nome), Tipo: \(tipo)"
    }
}


class ListaDeCompras {
    var itens: [ItemAlimentar] = []

    func adicionarItem(_ item: ItemAlimentar) {
        itens.append(item)
    }

    func mostrarListaDeCompras() {
        for item in itens {
            print(item.descricao())
        }
    }

    func filtrarItensPorTipo(_ tipoItem: TipoAlimento) -> [ItemAlimentar] {
        return itens.filter { $0.tipo == tipoItem }
    }

    func realizarTarefaConcorrente(completion: @escaping () -> Void) {
        DispatchQueue.global().async {
            // Simulando uma tarefa concorrente
            Thread.sleep(forTimeInterval: 2)
            print("Tarefa concorrente concluída")
            completion()
        }
    }
}


let listaDeCompras = ListaDeCompras()
let maca = ItemAlimentar(nome: "Maçã", tipo: .fruta)
let cenoura = ItemAlimentar(nome: "Cenoura", tipo: .vegetal)
let carneBovina = ItemAlimentar(nome: "Carne Bovina", tipo: .carne)
let leite = ItemAlimentar(nome: "Leite", tipo: .laticinio)

listaDeCompras.adicionarItem(maca)
listaDeCompras.adicionarItem(cenoura)
listaDeCompras.adicionarItem(carneBovina)
listaDeCompras.adicionarItem(leite)

listaDeCompras.mostrarListaDeCompras()

let itensFrutas = listaDeCompras.filtrarItensPorTipo(.fruta)
print("\nItens de Frutas:")
listaDeCompras.mostrarListaDeCompras()

// Chamada de tarefa concorrente com closure
listaDeCompras.realizarTarefaConcorrente {
    print("Tarefa concorrente finalizada")
}

// sleep apenas para evitar que o playground termine antes da tarefa)
sleep(3)


