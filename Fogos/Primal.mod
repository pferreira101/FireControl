 int a = ...;
 int n = a * a;
 int c[1..n][1..n] = ...;
 



 dvar float+ x[1..n][1..n];
  
 minimize sum(i in 1..n, j in 1..n) c[i][j]*x[i][j];

  subject to {
 	sum(j in 2..n) (x[1][j] - x[j][1]) == n-1;
 	forall(i in 2..n) d: sum(j in 1..n) (x[i][j] - x[j][i]) == -1;
 	forall(i in 1..n, j in 1..n) x[i][j] >= 0;
 } 

 
 