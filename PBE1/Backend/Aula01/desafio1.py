# Enunciado em Python: Escreva um programa em Python que receba o numero
# de dias que um carro foi alugado e a quantidade de Km rodados.
# - O aluguel custa R$ 90,00 por dia.
# - Se o cliente rodou ate 100 km no total, paga R$ 0,20 por Km rodado.
# - Se rodou mais de 100 km, paga R$ 0,15 por Km rodado.
# Exiba o valor total a pagar formatado com duas casas decimais.
# - O que avalia no aluno: Variaveis, conversao de tipos (float/int), condicionais
# (if/else) e calculos matematicos.

diasAlugado = int(input("Quantos dias o carro permaneceu alugado? "))
quantidadeKm = float(input("Quantos Km foram rodados? "))

aluguelDia = 90.00

if quantidadeKm < 100:
    valorKm = 0.2
else:
    valorKm = 0.15

finalKm = valorKm*quantidadeKm
finalDia = aluguelDia*diasAlugado

finalValor = finalDia+finalKm

print(f"O valor final do resultante do seu aluguel foi de R${finalValor:.2f}")