import requests
import numpy as np
import random
import mysql.connector
cnx = mysql.connector.connect(user='root', password='PROYECTO1KMS', host='localhost', database='kms')
cursor1=cnx.cursor()
cursor1.execute("select * from relacion_primarias;")
relaciones = cursor1.fetchall()
for i in range(len(relaciones)):
  cursor1.execute("select id2 from temas where id= "+str(relaciones[i][3])+";")
  tema = cursor1.fetchall()
  tema=tema[0][0]
  print(relaciones[i][3],relaciones[i][4],tema)
  if relaciones[i][4] == tema:
    print("bien")
  else:
    print("mal")
    break
  