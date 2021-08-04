import requests
import numpy as np
import random
import math
from time import time
import mysql.connector

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
            
def recorrer(cpi,estado,idh,idsp):  
    if len(cpi.shape)>1:
        recorrer(cpi[0],estado+"_1",idh,idsp)
        recorrer(cpi[1],estado+"_2",idh,idsp)
        recorrer(cpi[2],estado+"_3",idh,idsp)
    else:
        for i in range(3):
            cursor1=conexion1.cursor()
            sql="insert into cpts(id_hijo,estado,id_padres,estados_padres,probabilidad) values (%s,%s,%s,%s,%s)"
            datos=(idh ,i+1 ,idsp,estado,float(cpi[i]))
            cursor1.execute(sql, datos)
            print(idh,i+1,idsp,estado,cpi[i])
cptA=[]
URL = "http://67.205.132.145/arbol/simulador/caminos"
evaluaciones=5000
r = requests.get(url = URL)
data = r.json()
nodos = data['nodos']
caminos = data['caminos']
temas = data['temas']
ramas = data['ramas']

numeros = []
letras = []


nodosSinRamas = []
for i in range( len(nodos) ):
    es_rama = False
    for j in range(len(ramas)):
        if nodos[i] == ramas[j]["id"]:
            es_rama = True
            break
    if not es_rama:
        nodosSinRamas.append(nodos[i]);
  
nodos = nodosSinRamas;

for i in range( len(nodos) ):
    for j in range( len(temas)):
        if(temas[j]['id'] == nodos[i]):
            letras.append(temas[j]['nombre'])
    numeros.append(i)
indices = dict(zip(letras,numeros))
padres = []
padres_ids = []
mylist = [1, 2,  3]
for i in range(len(nodos)):
    es_rama = False
    for j in range(len(ramas)):
        if nodos[i] == ramas[j]["id"]:
            es_rama = True
            break
    if not es_rama: 
        padres_nodo = []
        padres_nodo_id = []
        padres_nodo.append(letras[i])
        padres_nodo_id.append(nodos[i])       
        for j in range(len(caminos)):
            for k in range( len(caminos[j]) ):
                if(caminos[j][k] == nodos[i] and k > 0 ):
                  
                    repetido = 0
                    for l in range( len(padres_nodo) ):
                        
                        try:
                            if padres_nodo[l]  == letras[nodos.index(caminos[j][k-1])]:
                                repetido = 1
                                break
                                
                        except Exception:
                            repetido = 1
                            break
    
                        
                            
                    if repetido == 0:
                        es_rama2 = False
                        for l in range(len(ramas)):
                            if caminos[j][k-1] == ramas[l]["id"]:
                                es_rama2 = True
                                break
                        if not es_rama2:
                            padres_nodo.append( letras[nodos.index(caminos[j][k-1])] )
                            padres_nodo_id.append( caminos[j][k-1] )
        #print(padres_nodo)
        padres.append(padres_nodo)
        padres_ids.append(padres_nodo_id)
cPadres=len(padres)

hijos=[]
spadres=[]
hijosid=[]
spadresid=[]
for i in range(cPadres):
    hijos.append(padres[i][0])
    hijosid.append(padres_ids[i][0])
    if len(padres[i])>0:
        spadres.append(padres[i][1::])
        spadresid.append(padres_ids[i][1::])
    else:
        spadresid.append([])
PA =     [20,60,20]

dataset = []
with open("dataset.csv") as fname:
    lineas = fname.readlines()
    for linea in lineas:
        a= linea.split(sep=',')
        b=[]
        for i in range(len(a)-1):
            b.append(int(a[i]))
        dataset.append(b)
print(len(hijos))


print("dataset ",len(dataset[0]))
 
evaluaciones=len(dataset)
start_time = time() 
for ind in range(len(hijos)):       
    hijo=hijos[ind]
    padres=spadres[ind]
    cPadresA=int(len(padres))
    #print(hijo,cPadresA)
    if cPadresA>0:     
        datasetp=[]
        for i in range(evaluaciones):
            dp=[]
            for j in range(cPadresA):
                #print("indice ",indices[padres[j]])
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
        for i in range(dimensiones):
            arreglo = [arreglo, arreglo, arreglo]
        cpi = np.array(arreglo)
        for i in range(evaluaciones):
            asignar(datasetp[i],cpi)
        dividir(cp,cpi)
        p=[0,0,0,0]
        cptA.append(cpi)
    else:
        pt=np.zeros(3)
        for i in range(3):
            for j in range(evaluaciones):
                if dataset[j][indices[hijo]]==i+1:
                    pt[i]+=1
        pt=pt[:]/evaluaciones
        cptA.append(pt) 
 
for i in range(len(cptA)):
    print(hijos[i],"",spadres[i])
    idsp=""
    for j in range(len(spadresid[i])):
        idsp=idsp+"_"+str(spadresid[i][j])
    conexion1=mysql.connector.connect(user='root', password='PROYECTO1KMS', host='localhost', database='kms')   
    recorrer(cptA[i],"",hijosid[i],idsp)
    conexion1.commit()
    conexion1.close() 
elapsed_time = time() - start_time    
print("Tiempo transcurrido: ",elapsed_time," segundos")
 