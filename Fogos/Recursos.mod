 int a = ...;
 int n = a*a;
 int c[1..n][1..n] = ...;

 int b = ...;
 int delta = ...;
 int ignicao = ...;
 int objetivo = ...;
 

 dvar boolean x[1..n];
 dvar int t[1..n];
 
 maximize t[objetivo];
 
 subject to{
 	t[ignicao] == 0;
 	forall(i in 1..n, j in 1..n) t[j] <= t[i] + c[i][j] + delta*x[i];
 	sum(i in 1..n) x[i] <= b;
 	forall(i in 1..n) t[i] >= 0;
 }