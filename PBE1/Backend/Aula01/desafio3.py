produto = {"nome": "Teclado Mecanico", "preco": 200.0, "estoque": 15}

def aplicar_desconto(valor):
    return valor*0.90

valorAtual = produto.get("preco")
valorNovo = aplicar_desconto(valorAtual)

produto["preco"] = valorNovo

print(f"O Produto {produto['nome']} agora custa R${produto['preco']} ")