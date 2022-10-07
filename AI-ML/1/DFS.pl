connected(1,7,1). 
connected(1,8,1). 
connected(1,3,1). 
connected(7,4,1). 
connected(7,20,1). 
connected(7,17,1). 
connected(8,6,1). 
connected(3,9,1). 
connected(3,12,1). 
connected(9,19,1). 
connected(4,42,1). 
connected(20,28,1). 
connected(17,10,1).
 
connected2(X, Y, D) :- 
	connected(X, Y, D). 

connected2(X, Y, D) :- 
	connected(Y, X, D). 

next_node(Cur, Next, Path) :-  
	connected2(Cur, Next, _),  not(member(Next, Path)). 

depth_first(Start, Goal, Path):- 
	depth_first( Start, Goal, [Start], Path). 
	
depth_first(Goal, Goal, _, [Goal]). 

depth_first(Start, Goal, Vis, [Start|Path]) :-    
	next_node(Start, Next_node, Vis), 
	write(Vis), nl,
	depth_first(Next_node, Goal, [Next_node|Vis], Path). 
