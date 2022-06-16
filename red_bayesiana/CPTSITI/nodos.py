import requests
import numpy as np
import random
print("Cargando nodos...")
URL = "http://164.92.156.81/arbol/caminoslibreria"
r = requests.get(url = URL)
print(r)
 
data = r.json()

print(data)