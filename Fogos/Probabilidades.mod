/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Pedro
 * Creation Date: Dec 4, 2018 at 1:40:40 PM
 *********************************************/

 int a = ...;
 int n = a*a;
 int d[1..n][1..n] = ...;
 
  
 int b = ...;
 int delta = ...;
 float p_aux[1..a][1..a] = ...;
 int tmax = ...;
 
 float p[1..n];
 execute {
	 for(var i = 1, k = 1; i<=a; i++) {
	 	for(var j = 1; j<=a; j++, k++){
	 		p[k] = p_aux[i][j];	
	 	}	
	 }	  
 }
 
 
 dvar boolean x[1..n];
 dvar int t[1..n][1..n];
 dvar boolean y[1..n][1..n];
 
 minimize sum(s in 1..n, i in 1..n) p[s]*y[s][i];
 
 subject to{
 	forall(s in 1..n) t[s][s] == 0;
 	forall(s in 1..n, i in 1..n, j in 1..n) t[s][j] <= t[s][i] + d[i][j] + delta*x[i];
 	forall(s in 1..n, i in 1..n) y[s][i] * tmax >= tmax - t[s][i];
 	sum(i in 1..n) x[i] <= b;
 }