import requests
import numpy as np
import random
import math
from time import time
def asignar(indices,cp):
    if len(indices)>1:
        asignar(indices[1::],cp[indices[0]-1])
    else:
        cp[indices[0]-1]+=1

def dividir(cpc,cpic):
    if isinstance(cpc,np.ndarray):
        for i in range(3):
            dividir(cpc[i],cpic[i])
    else:
        if cpc>0:
            cpic/= cpc

def imprimir(cpi,padres,d,f):
    """
    #print(len(cpi.shape))
    if len(cpi.shape)>1:
        texto=str(padres[abs(len(cpi.shape)-d)])+"\n"
        #print(texto+"\n")
        f.write(texto.encode())
    """      
    if len(cpi.shape)>1:
        for i in range(3):
            imprimir(cpi[i],padres,d,f)
    else:
        #print(cpi)
        for i in range(3):
            texto=str(cpi[i])+","
            f.write(texto.encode())
        texto="\n"
        f.write(texto.encode())        

URL = "http://67.205.132.145/arbol/simulador/caminos"
evaluaciones=100000
r = requests.get(url = URL)
data = r.json()
nodos = data['nodos']
caminos = data['caminos']
temas = data['temas']
numeros = []
letras = []

for i in range( len(nodos) ):
    for j in range( len(temas)):
        if(temas[j]['id'] == nodos[i]):
            letras.append(temas[j]['nombre'])
    numeros.append(i)
indices = dict(zip(letras,numeros))

padres = []
mylist = [1, 2,  3]
for i in range( len(nodos) ):
    padres_nodo = []
    padres_nodo.append(letras[i])
    for j in range(len(caminos)):
        for k in range( len(caminos[j]) ):
            if(caminos[j][k] == nodos[i] and k > 0):
                repetido = 0
                for l in range( len(padres_nodo) ):
                    if padres_nodo[l]  == letras[nodos.index(caminos[j][k-1])]:
                        repetido = 1
                        break
                if repetido == 0:
                    padres_nodo.append( letras[nodos.index(caminos[j][k-1])] )
    padres.append(padres_nodo)
cPadres=len(padres)

hijos=[]
spadres=[]
for i in range(cPadres):
    hijos.append(padres[i][0])
    if len(padres[i])>0:
        spadres.append(padres[i][1::])
    else:
        spadres.append([])
#print(spadres) 

PA =     [20,60,20]
dataset = []
for i in range(evaluaciones):
    r=[]
    for j in range(len(indices)):
        A = random.choices(mylist, weights = PA)[0]
        r.append(A)
    dataset.append(r) 
 
for ind in range(cPadres):  
    start_time = time()        
    hijo=hijos[ind]
    padres=spadres[ind]


    cPadresA=int(len(padres))
    #print(hijo,padres,cPadresA)
    f = open ("Probabilidades/"+"CPT"+hijo+'.CSV','wb')
    if cPadresA >0:     
     
        datasetp=[]
        for i in range(evaluaciones):
            dp=[]
            for j in range(cPadresA):
                dp.append(dataset[i][indices[padres[j]]])
            dp.append(dataset[i][indices[hijo]])
            datasetp.append(dp)    
 
        arreglo = [0.0,0.0,0.0]
        dimensiones = cPadresA-1
        for i in range(dimensiones):
            arreglo = [arreglo, arreglo, arreglo]
        cp = np.array(arreglo)

        for i in range(evaluaciones):
            asignar(datasetp[i][0:cPadresA ],cp)
        
        arreglo = [0.0,0.0,0.0]
        dimensiones = cPadresA
        #print(dimensiones)
        for i in range(dimensiones):
            arreglo = [arreglo, arreglo, arreglo]
        cpi = np.array(arreglo)

        for i in range( evaluaciones):
            asignar(datasetp[i],cpi)
      
        dividir(cp,cpi)
        #print(cpi)
        #print()
        #print()
        imprimir(cpi,padres,len(cpi.shape),f)
    else:
        pt=np.zeros(3)
        for i in range(3):
            for j in range(evaluaciones):
                if dataset[j][indices[hijo]]==i+1:
                    pt[i]+=1
        pt=pt[:]/evaluaciones
        #print(pt)
        #print()
        #print()
        texto=str(pt)
        f.write(texto.encode())
    f.close() 
"""
for i in range(evaluaciones):
    print(i,",", end="")
    for j in range(len(indices)):
        print(dataset[i][j],",", end="")
    print()

cont=0
for i in indices:
    print(cont,i)
    cont+=1
"""