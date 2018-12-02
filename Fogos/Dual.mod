/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Pedro
 * Creation Date: Dec 2, 2018 at 5:36:57 PM
 *********************************************/

 int a = ...;
 int b = ...;
 int n = a * b;

 
 int norte[1..a][1..b] = ...;
 int este[1..a][1..b] = ...;
 int sul[1..a][1..b] = ...;
 int oeste[1..a][1..b] = ...;
 
 int d[1..n][1..n];
 execute {
	 for(var i = 1; i<=n; i++) {
	 	for(var j = 1; j<=n; j++){
	 		var dv = Opl.ceil(i/a);
	 		var resto = i%a;
	 		if(resto == 0) resto = a;
	 		
	 		if((i-j) == a && dv!=1) d[i][j] = norte[dv][resto]
	 		else if((i-j) == -1 && resto!=a) d[i][j] = este[dv][resto];
	 		else if((i-j) == -a && dv!=a) d[i][j] = sul[dv][resto];
	 		else if((i-j) == 1 && resto!=1) d[i][j] = oeste[dv][resto];
	 		else d[i][j] = 99999;	 		
 	
	 	}	
	 }	  
 }
 
 dvar int x[1..n];
 
 maximize sum(i in 1..n) x[i];
 
 subject to {
 	x[1] <= 0;
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