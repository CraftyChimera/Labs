import random
from math import exp
import time
from copy import deepcopy

N_QUEENS = 8
TEMPERATURE = 4000


def threat_calculate(n):
    if n < 2:
        return 0
    if n == 2:
        return 1
    return ((n - 1) * n) // 2


def create_board(n):
    chess_board = {}
    temp = list(range(n))
    random.shuffle(temp)
    column = 0

    while len(temp) > 0:
        row = random.choice(temp)
        chess_board[column] = row
        temp.remove(row)
        column += 1
    return chess_board


def cost(chess_board):
    threat = 0
    m_chessboard = {}
    a_chessboard = {}

    for column in chess_board:
        temp_m = column - chess_board[column]
        temp_a = column + chess_board[column]
        if temp_m not in m_chessboard:
            m_chessboard[temp_m] = 1
        else:
            m_chessboard[temp_m] += 1
        if temp_a not in a_chessboard:
            a_chessboard[temp_a] = 1
        else:
            a_chessboard[temp_a] += 1

    for i in m_chessboard:
        threat += threat_calculate(m_chessboard[i])

    for i in a_chessboard:
        threat += threat_calculate(a_chessboard[i])

    return threat


def simulated_annealing():
    answer = create_board(N_QUEENS)

    cost_answer = cost(answer)

    t = TEMPERATURE
    sch = 0.99

    while t > 0:
        t *= sch
        successor = deepcopy(answer)
        while True:
            index_1 = random.randrange(0, N_QUEENS - 1)
            index_2 = random.randrange(0, N_QUEENS - 1)
            if index_1 != index_2:
                break
        successor[index_1], successor[index_2] = successor[index_2],successor[index_1]
        
        delta = cost(successor) - cost_answer
        
        if delta < 0 or random.uniform(0, 1) < exp(-delta / t):
            answer = deepcopy(successor)
            cost_answer = cost(answer)
            print(cost_answer, '\t', t)
        if cost_answer == 0:
            print_chess_board(answer)
            break


def print_chess_board(board):
    store = {}
    for column, row in board.items():
        store[row] = column

    for i in range(N_QUEENS):
        x = []
        for j in range(N_QUEENS):
            if store[i] == j:
                x.append('Q')
            else:
                x.append('-')
        print(x)

simulated_annealing()