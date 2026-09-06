function seed1(D,A,x,y){
  if (D >1.0){
    var r = random(0,1.0); 
    
    if (r >= 0.02){
      ellipse(x,y,D,D);
      var newx = x + cos(A)* D ;
      var newy = y + sin(A)* D ;
      seed1(D*0.99, A- aOA, newx,newy);
    } else {
      ellipse(x,y,D,D);
       newx = x + cos(A) ;
      newy = y + sin(A);   
      seed2(D*0.99, A+aOA, newx, newy);
      seed1(D*0.60, A+ aOB, newx, newy);
      seed2(D*0.50, A- aOB, newx, newy);
    }
  }
}

function seed2(D,A,x,y){
  if (D >1.0){
    var r = random(0,1.0); 
    
    if (r > 0.5){
      A= -A
      ellipse(x,y,D,D);
      var newx = x + sin(A)* D ;
      var newy = y + cos(A)* D ;
      seed1(D*0.99, A- aOA, newx, newy);
    } else {
      ellipse(x,y,D,D);
       newx = x + sin(A) ;
       newy = y + cos(A);   
      seed1(D*0.99, A+ aOA, newx, newy);
      seed2(D*0.60, A+ aOB, newx, newy);
      seed1(D*0.50, A- aOB, newx, newy);
    }
  }
}
