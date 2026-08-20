numeros = [12,5,8,21,14,3,10,17]
pares = []
numPares = 0
soma = 0
for i in numeros:
    divisao = i%2
    if divisao == 0:
        pares.append(i)
        numPares+=1
        soma = soma + i
    else:
        pass

media = soma/numPares
print(f"Os numeros pares são {pares} e a media deles é de {media}")
