from time import sleep

# --------------------------------------------------------------------------------------

# Desafio 1
# Escreva um programa em Python que receba o número de dias que um carro foi alugado e a quantidade de Km rodados.
# - O aluguel custa R$90,00 por dia;
# - Se o cliente rodou até 100 km no total, paga R$0,20 por km rodado;
# - Se rodou mais que 100 km, paga R$0,15 por km rodado; 
# Exiba o valor total a pagar formatado com duas casas decimais.

print("===== Desafio 1 =====")

aluguel_dia = 90.0
mais_100 = 0.15
menos_100 = 0.20

dias_alugado = int(input("Insira a quantidade de dias em que o carro permaneceu alugado: "))
km_rodado = float(input("Insira a quantidade de Km rodados: "))

valor_dias = aluguel_dia * dias_alugado

if km_rodado <= 100:
    valor_km = km_rodado * menos_100
else:
    valor_km = km_rodado * mais_100

valor_final = valor_km + valor_dias

print(f"O valor final a ser pago é de R${valor_final:.2f}!")
sleep(1)

# Dado o seguinte código inicial com uma lista de
# números:
# numeros = [12, 5, 8, 21, 14, 3, 10, 7]
# Escreva um programa que:
# 1. Percorra a lista e crie uma nova lista contendo apenas os números pares.
# 2. Calcule e exiba a média desses números pares.
# - O que avalia no aluno: Laços de repetição (for), listas, método .append(),
# acúmulo de valores e o operador de resto de divisão %.

print("===== Desafio 2 =====")

numeros = [12, 5, 8, 21, 14, 3, 10, 7]
pares = []
soma = 0
i = 0

for num in numeros:
    teste_par = num % 2
    if teste_par == 0:
        pares.append(num)
        soma += num
        i += 1
    else:
        pass

media = soma / i
print(f"Da lista {numeros}, os números pares são {pares}! E a média deles é de {media}")
sleep(1)

# -------------------------------------------------------------------------------------- 

# Desafio 3: Funções e Dicionários (O Desconto no Produto)
# Enunciado em Python: Crie um dicionário representando um produto: produto =
# {&quot;nome&quot;: &quot;Teclado Mecânico&quot;, &quot;preco&quot;: 200.0, &quot;estoque&quot;: 15}
# 1. Crie uma função chamada aplicar_desconto que receba o dicionário do
# produto
# e a porcentagem de desconto (ex: 10 para 10%).
# 2. A função deve atualizar o preço do produto dentro do dicionário e exibir a
# mensagem: &quot;O produto [NOME] agora custa R$ [NOVO_PRECO]!”

print("===== Desafio 3 =====")

produto = {"nome": "Teclado Mecânico", "preço": 200.0, "estoque": 15}

def aplicar_desconto():

    desconto = float(input("Informe quanto deseja ser aplicado de desconto: "))
    valor_produto = produto.get("preço")
    valor_final =  valor_produto - ((desconto/100) * valor_produto)

    return valor_final

novo_valor = aplicar_desconto()
produto["preço"] = novo_valor
nome_produto = produto.get("nome")
print(f"O produto {nome_produto} agora custa {produto['preço']}!")

# --------------------------------------------------------------------------------------

print("===== Desafio 3 - Professor =====")

produto = {"nome": "Teclado Mecânico", "preço": 200.0, "estoque": 15}

def aplicar_desconto(item, porcentagem):
    item["preco"] -= item["preco"] * (porcentagem/100)
    print(f"O produto {item["nome"]} agora custa R$ {item["preco"]:.2f}")

aplicar_desconto(produto, 10)