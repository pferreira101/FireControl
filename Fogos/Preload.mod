 int a = ...;
 int n = a*a;
 
 int norte[1..a][1..a] = ...;
 int este[1..a][1..a] = ...;
 int sul[1..a][1..a] = ...;
 int oeste[1..a][1..a] = ...;
 
 int d[1..n][1..n];
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