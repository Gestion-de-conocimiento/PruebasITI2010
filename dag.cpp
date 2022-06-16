#include<iostream>
#include<stdlib.h>
#include<bits/stdc++.h>
#include <fstream>

using namespace std;
 
// DEPTH FIRST SEARCH WITH BACKTRACKING

// Nodos de las listas de adyacencia
typedef struct node {
    int name;
    struct node* next;
}node;
 
//Encabezado de las listas de adyacencia
typedef struct graph_node {
    int name;
    int visited;
    int parent;
    struct node* list;
}graph_node;
 
vector<int> nodes = {};

//Utilizado para anotar los caminos
int vertex_list[100];
int vertex_count = 0;
int NODES = 21;
//int NODES = 0;
string caminos = "";
 
void add_edge(int i,int j,graph_node g[]){
    node* temp = g[i].list;
    node* new_node = (node*) malloc(sizeof(node));
    new_node->name = j;
    new_node->next=NULL;
    if( temp==NULL){
        g[i].list = new_node;
        return;
    }else{
        g[i].list = new_node;
        new_node->next = temp;
        return;
    }
}

void printList(){
    caminos = caminos + "[";
    for(int i=0;i<vertex_count;i++){
    	if(i == vertex_count-1){
        	caminos = caminos + to_string(nodes.at(vertex_list[i]));
    	}else{
        	caminos = caminos + to_string(nodes.at(vertex_list[i]));
        	caminos = caminos + ",";
    	}
    }
    caminos = caminos + "],";
}
 
void findPaths(graph_node g[],int start) {
    vertex_list[vertex_count++] = start;
    g[start].visited = 1;
    node* temp = g[start].list;
    int flag = 0;
	
    // La bandera se usa para verificar el callejón sin salida del camino
    while(temp){
        if(g[temp->name].visited == 0){
            flag = 1;
            findPaths(g,temp->name);
        }
        temp = temp->next;
    }
    if(flag == 0) {
        printList();
    }
    g[start].visited = 0;
    vertex_count--;
}
 
int getIndex(vector<int> v, int K) {
    auto it = find(v.begin(), v.end(), K);
    
    if (it != v.end()) {
        int index = it - v.begin();
        return index;
    } else {
        return -1;
    }
}

void initGraph(graph_node g[]) {
    ifstream ficheroEntrada;
    string linea;
    ficheroEntrada.open("nodos");
    string delimitador = "-";
    string token;
    int leer_arreglo = 0;
    int leer_relacion = 0;
    
    while(!ficheroEntrada.eof()) {
        getline(ficheroEntrada, linea);
		
		if(linea.compare("") != 0 && leer_relacion == 1 && leer_arreglo == 0){
			size_t pos = linea.find(delimitador);
			token = linea.substr(0, pos);
			linea.erase(0, pos + delimitador.length());
			add_edge(getIndex(nodes,stoi(token)), getIndex(nodes,stoi(linea)),g);
		}else if( linea.compare("") != 0 && leer_arreglo == 1 && leer_relacion == 0){
			std::string s = linea;
			string delimiter = ",";
			size_t pos = 0;
			std::string p;
			while ((pos = s.find(delimiter)) != std::string::npos) {
				p = s.substr(0, pos);
				nodes.push_back(stoi(p));
				s.erase(0, pos + delimiter.length());
			}
			nodes.push_back(stoi(s));

			leer_arreglo = 0;
		}

		if(linea.compare("nodos") == 0){
			leer_arreglo = 1;
		}

		if(linea.compare("relaciones") == 0){
			leer_relacion = 1;
			sort(nodes.begin(), nodes.end());
		}
	
    }
    ficheroEntrada.close();
    
}
 
int main(int argc, char** argv) {
    NODES = atoi(argv[1]);
    graph_node graph[NODES];
    
    for(int i=0;i<NODES;i++){
        graph[i].name = i;
        graph[i].list = NULL;
        graph[i].visited = 0;
    }
    initGraph(graph);
    
    caminos = "{\"caminos\":[";
    findPaths(graph,0);
    
    //Borrar el ultimo caracter de caminos
    int total_caracteres = caminos.length()-1;
    caminos.erase(total_caracteres, 1);
    caminos = caminos + "]}";
    cout << caminos;
    
}