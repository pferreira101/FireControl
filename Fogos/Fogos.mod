/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Pedro
 * Creation Date: Nov 27, 2018 at 6:56:55 PM
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
	 		
	 		if((i-j) == a && dv!=1) {
	 			d[i][j] = norte[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + norte[dv][resto] + " -- norte("+dv+","+resto+")"); 		
	 		}
	 		else if((i-j) == -1 && resto!=a)  { 
	 			d[i][j] = este[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + este[dv][resto] + " -- este("+dv+","+resto+")"); 		
	 		}
	 		else if((i-j) == -a && dv!=a)  {
	 			d[i][j] = sul[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + sul[dv][resto] + " -- sul("+dv+","+resto+")");
	 		}
	 		else if((i-j) == 1 && resto!=1)  {
	 			d[i][j] = oeste[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + oeste[dv][resto] + " -- oeste("+dv+","+resto+")");
	 		}
	 		else {
	 			d[i][j] = 99999;	 		
	 			writeln("ARCO " + i +"-" + j + " ---- Não existe");
	 		}	 	
	 	}	
	 }	  
 }

 dvar int x[1..n][1..n];
  
 minimize sum(i in 1..n, j in 1..n) d[i][j]*x[i][j];
 
 subject to {
 	forall(i in 1..n) x[i][i] == 0;
 	sum(j in 2..n) (x[1][j] - x[j][1]) == n-1;
 	forall(i in 2..n) sum(j in 2..n) (x[i][j] - x[i][j]) == -1;
 	// forall(i in 1..n, j in 1..n) x[i][j] >= 0;
 } 
 
 