import random
import math


def getPathCost(adjMat, path):
    pathCost = adjMat[path[0]-1][path[-1]-1]
    for i in range(len(path)-1):
        pathCost += adjMat[path[i]-1][path[i+1]-1]
    return pathCost


def getRandomPath(adjMat):
    nodes = list(range(1, len(adjMat)+1))
    path = []
    while len(nodes) > 0:
        path.append(nodes[random.randint(0, len(nodes)-1)])
        nodes.remove(path[-1])
    pathCost = getPathCost(adjMat, path)
    return (pathCost, path)


def getRandomNeighbour(adjMat, path):
    a = random.randint(0, len(path)-1)
    b = random.randint(0, len(path)-1)
    while a == b:
        b = random.randint(0, len(path)-1)
    path[a], path[b] = path[b], path[a]
    pathCost = getPathCost(adjMat, path)
    return (pathCost, path)


def simulatedanalling(adjMat):
    maxIterations = 100
    temperature = 1
    beta = 0.99
    cost, path = getRandomPath(adjMat)
    costs = [cost]
    temperatures = [temperature]
    for i in range(maxIterations):
        temperature = temperature * beta
        randomNeighbourCost, randomNeighbourPath = getRandomNeighbour(
            adjMat, path[:])
        deltaE = randomNeighbourCost - cost
        if deltaE < 0 or random.uniform(0, 1) < math.exp(-deltaE/temperature):
            path = randomNeighbourPath
            cost = randomNeighbourCost
            print(cost, '\t', path, '\t', temperature)
            costs.append(cost)
            temperatures.append(temperature)
    return (temperatures, costs, path)


graph = [
    [0, 300, 25, 12],
    [332, 0, 44, 55],
    [2543, 431, 0, 83],
    [12, 54, 853, 0]
]
x, y, optimalPath = simulatedanalling(graph)
print('Optimal Path: ', optimalPath, 'Optimal Cost: ', y[-1])
