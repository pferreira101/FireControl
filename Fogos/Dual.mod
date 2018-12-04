/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Pedro
 * Creation Date: Dec 2, 2018 at 5:36:57 PM
 *********************************************/

 int a = ...;
 int n = a * a;
 
 int d[1..n][1..n] = ...;
 
 dvar int x[1..n];
 
 maximize sum(i in 1..n) x[i];
 
 subject to {
 	x[1] == 0;
 	forall(i in 1..n, j in 2..n) x[j] - x[i] <= d[i][j];
 	forall(i in 1..n) x[i] >= 0;
 } 
 
 /*
 
 ESTA ERA A RESOLUÇÃO QUE EU TINHA.  A QUE FUNCIONA LI NUM ARTIGO 
 minimize sum(i in 1..n) x[i];
 
 subject to{
 	forall(j in 2..n) x[j] >= d[1][j];
 	forall(i in 1..n, j in 2..n) x[j] >= d[i][j] + x[i];
 	forall(i in 1..n) x[i] >= 0;
 } 	
 */