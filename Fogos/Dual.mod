 int a = ...;
 int n = a * a;
 
 int c[1..n][1..n] = ...;
 
 dvar float+ t[1..n];
 
 maximize sum(i in 1..n) t[i];
 
 subject to {
 	t[1] == 0;
 	forall(i in 1..n, j in 2..n) t[j] <= t[i] + c[i][j];
 	forall(i in 1..n) t[i] >= 0;
 } 