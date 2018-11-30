/*********************************************
 * OPL 12.8.0.0 Model
 * Author: Pedro
 * Creation Date: Nov 27, 2018 at 6:56:55 PM
 *********************************************/

 int a = 7;
 int b = 7;
 int n = a * b;

 
 int norte[1..a][1..b] = ...;
 int este[1..a][1..b] = ...;
 int sul[1..a][1..b] = ...;
 int oeste[1..a][1..b] = ...;
 
 int d[1..n][1..n];
 execute {
	 for(var i = 1; i<=n; i++) {
	 	for(var j = 1; j<=n; j++){
	 		var dv = Opl.trunc(i/a)+1;
	 		if(dv == a+1) dv = a;
	 		var resto = j%a;
	 		if(resto == 0) resto = a;
	 		
	 		if((i-j) == a) {
	 			d[i][j] = norte[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + norte[dv][resto]); 		
	 		}
	 		else if((i-j) == -1)  { // não devia ser ao contrário??
	 			d[i][j] = oeste[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + oeste[dv][resto]); 		
	 		}
	 		else if((i-j) == -a)  {
	 			d[i][j] = sul[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + sul[dv][resto]); 		
	 		}
	 		else if((i-j) == 1)  {
	 			d[i][j] = este[dv][resto];
	 			writeln("ARCO " + i +"-" + j + " ---- Dist = " + este[dv][resto]); 		
	 		}
	 		else {
	 			d[i][j] = 99999999;	 		
	 			writeln("ARCO " + i +"-" + j + " ---- Não existe");  		
	 		}	 	
	 	}	
	 }	  
 }

 dvar int x[1..n][1..n];
  
 minimize sum(i in 1..n, j in 1..n) d[i][j]*x[i][j];
 
 subject to {
 	//forall(i in 1..a) x[i][i] == 0;
 	sum(j in 2..n) (x[1][j] - x[j][1]) == n-1;
 	forall(i in 2..n) sum(j in 2..n) (x[i][j] - x[i][j]) == -1;
 	forall(i in 1..n, j in 1..n) x[i][j] >= 0;
 } 
 
 