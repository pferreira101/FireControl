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
 

 
 dvar boolean x[1..n];
 dvar int t[1..n];
 
 maximize t[cel_obj];
 
 subject to{
 	t[cel_igni] == 0;
 	forall(i in 1..n, j in 1..n) t[j] <= t[i] + d[i][j] + delta*x[i];
 	sum(i in 1..n) x[i] <= b;
 	forall(i in 1..n) t[i] >= 0;
 }