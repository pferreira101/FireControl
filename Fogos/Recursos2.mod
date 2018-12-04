/*********************************************
 * OPL 12.8.0.0 Model
 * Author: pedroferreira
 * Creation Date: 04/12/2018 at 22:38:24
 *********************************************/
 
 int a = ...;
 int n = a*a;
 int d[1..n][1..n] = ...;
 
  
 int b = ...;
 int delta = ...;
 int cel_igni = ...;
 int cel_obj = ...;
 

 
 dvar boolean x[1..n];
 dvar int t[1..n];
 
 maximize t[cel_obj];
 
 subject to{
 	t[cel_igni] == 0;
 	forall(i in 1..n, j in 1..n) t[j] <= t[i] + d[i][j] + delta*x[i];
 	sum(i in 1..n) x[i] <= b;
 }
