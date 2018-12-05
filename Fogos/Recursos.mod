/*********************************************
 * OPL 12.8.0.0 Model
 * Author: perei
 * Creation Date: 03/12/2018 at 15:43:39
 *********************************************/
 
 int a = 3;//...;
 int n = a*a;
 int d[1..n][1..n];// = ...;
 
 int norte[1..a][1..a] = ...;
 int este[1..a][1..a] = ...;
 int sul[1..a][1..a] = ...;
 int oeste[1..a][1..a] = ...;

 execute {
	 for(var i = 1; i<=n; i++) {
	 	for(var j = 1; j<=n; j++){
	 		var dv = Opl.ceil(i/a);
	 		var resto = i%a;
	 		if(resto == 0) resto = a;
	 		
	 		if((i-j) == a && dv!=1) d[i][j] = norte[dv][resto];
	 		else if((i-j) == -1 && resto!=a) d[i][j] = este[dv][resto];
	 		else if((i-j) == -a && dv!=a) d[i][j] = sul[dv][resto];
	 		else if((i-j) == 1 && resto!=1) d[i][j] = oeste[dv][resto];
	 		else d[i][j] = 99999; 	
	 	}	
	 }	  
 }
 
 
 int b = ...;
 int delta = ...;
 int cel_igni = ...;
 int cel_obj = ...;
 

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
 	forall(s in 1..n, i in 1..n) y[s][i] >= (tmax - t[s][i])/tmax;
 	sum(i in 1..n) x[i] <= b;
 }
 /*
 dvar boolean x[1..n];
 dvar int t[1..n];
 
 maximize t[cel_obj];
 
 subject to{
 	t[cel_igni] == 0;
 	forall(i in 1..n, j in 1..n) t[j] <= t[i] + d[i][j] + delta*x[i];
 	sum(i in 1..n) x[i] <= b;
 	forall(i in 1..n) t[i] >= 0;
 }*/