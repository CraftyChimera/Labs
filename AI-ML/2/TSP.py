n=int(input("Number of vertices: "))

adj=[]
for i in range(n):
	row=input(f"Enter row {i}: ")
	temp=row.split(" ")
	temp_int=[]
	for x in temp:
		temp_int.append(int(x))
	adj.append(temp_int)

def nearest_tsp(n:int):
	visited = set()
	path = "0"
	cost = 0
	search=[]
	curr = 0
	visited.add(0)
	
	for i in range(n):
		search.append(i)
		
	while len(visited) != n:
		min_co = None
		min_distance=10000000
		for el in search:
			if el not in visited:
				if adj[curr][el] < min_distance:
					min_distance = adj[curr][el]
					min_co = el

		path += f"->{min_co}"
		cost += adj[curr][min_co]

		print(path)
		print(cost)

		curr=min_co
		visited.add(curr)
	
	path += "->0"
	cost += adj[curr][0]

	return (path,cost)

(path,cost)=nearest_tsp(n)
print(path)
print(cost)
