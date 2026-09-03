// WavesOnSphere_2.0

int Nmax = 1000 ; float M = 500 ; float H = 0.99999 ; 

float X[] = new float[Nmax+1] ; float Y[] = new float[Nmax+1] ; float Z[] = new float[Nmax+1] ;
float VX[] = new float[Nmax+1] ; float dVX[] = new float[Nmax+1] ;
float VY[] = new float[Nmax+1] ; float dVY[] = new float[Nmax+1] ;
float VZ[] = new float[Nmax+1] ; float dVZ[] = new float[Nmax+1] ;
float L ; float R = 2*sqrt((4*PI*(200*200)/Nmax)/(2*sqrt(3))) ;
int N ; int NN ; float KX ; float KY ; float KZ ;
float KVX ; float KdVX ;
float KVY ; float KdVY ; 
float KVZ ; float KdVZ ; 


void setup(){
  
  size(600,600) ;
  background(0,0,0) ;
  noSmooth() ;
  strokeWeight(1) ;
  stroke(255,255,255) ;
  noFill() ;
  
  for ( N = 0 ; N <= Nmax ; N++ ){
    X[N] = random(-300,+300) ;
    Y[N] = random(-300,+300) ;
    Z[N] = random(-300,+300) ;
    if ( Z[N] > 250 ){
       L = sqrt((X[N]*X[N])+(Y[N]*Y[N])) ;
       dVX[N] = dVX[N] + (Y[N]/L) ;
       dVY[N] = dVY[N] - (X[N]/L) ;
    }
  }
  
} // setup()



void draw(){
  
  background(0,0,0) ;
  
  
  for ( N = 0 ; N <= Nmax ; N++ ){
     for ( NN = N+1 ; NN <= Nmax ; NN++ ){
        L = sqrt(((X[N]-X[NN])*(X[N]-X[NN]))+((Y[N]-Y[NN])*(Y[N]-Y[NN]))) ;
        L = sqrt(((Z[N]-Z[NN])*(Z[N]-Z[NN]))+(L*L)) ;
        if ( L < R ){
          X[N] = X[N] - ((X[NN]-X[N])*((R-L)/(2*L))) ;
          Y[N] = Y[N] - ((Y[NN]-Y[N])*((R-L)/(2*L))) ;
          Z[N] = Z[N] - ((Z[NN]-Z[N])*((R-L)/(2*L))) ;
          X[NN] = X[NN] + ((X[NN]-X[N])*((R-L)/(2*L))) ;
          Y[NN] = Y[NN] + ((Y[NN]-Y[N])*((R-L)/(2*L))) ;
          Z[NN] = Z[NN] + ((Z[NN]-Z[N])*((R-L)/(2*L))) ;
          dVX[N] = dVX[N] + ((VX[NN]-VX[N])/M) ;
          dVX[NN] = dVX[NN] - ((VX[NN]-VX[N])/M) ;
          dVY[N] = dVY[N] + ((VY[NN]-VY[N])/M) ;
          dVY[NN] = dVY[NN] - ((VY[NN]-VY[N])/M) ;
          dVZ[N] = dVZ[N] + ((VZ[NN]-VZ[N])/M) ;
          dVZ[NN] = dVZ[NN] - ((VZ[NN]-VZ[N])/M) ;
        }
        if ( Z[N] > Z[NN] ){
          KX = X[N] ; KY = Y[N] ; KZ = Z[N] ; KVX = VX[N] ; KdVX = dVX[N] ;
          KVY = VY[N] ; KdVY = dVY[N] ; KVZ = VZ[N] ; KdVZ = dVZ[N] ;
          X[N] = X[NN] ; Y[N] = Y[NN] ; Z[N] = Z[NN] ; VX[N] = VX[NN] ; dVX[N] = dVX[NN] ;  
          VY[N] = VY[NN] ; dVY[N] = dVY[NN] ; VZ[N] = VZ[NN] ; dVZ[N] = dVZ[NN] ;    
          X[NN] = KX ; Y[NN] = KY ; Z[NN] = KZ ; VX[NN] = KVX ; dVX[NN] = KdVX ; 
          VY[NN] = KVY ; dVY[NN] = KdVY ; VZ[NN] = KVZ ; dVZ[NN] = KdVZ ;  
        }
     }
     L = sqrt((X[N]*X[N])+(Y[N]*Y[N])) ;
     L = sqrt((Z[N]*Z[N])+(L*L)) ;
     X[N] = X[N] + (X[N]*(200-L)/(2*L)) ;
     Y[N] = Y[N] + (Y[N]*(200-L)/(2*L)) ;
     Z[N] = Z[N] + (Z[N]*(200-L)/(2*L)) ;
     KX = X[N]+VX[N] ; KY = Y[N]+VY[N] ; KZ = Z[N]+VZ[N] ;
     L = sqrt((KX*KX)+(KY*KY)) ;
     L = sqrt((KZ*KZ)+(L*L)) ;
     VX[N] = VX[N]-(KX*(L-200)/(2*L)) ;
     VY[N] = VY[N]-(KY*(L-200)/(2*L)) ;
     VZ[N] = VZ[N]-(KZ*(L-200)/(2*L)) ;
     KZ = Z[N] ; KX = X[N] ;
     Z[N] = (KZ*cos(float(300-mouseX)/10000))-(KX*sin(float(300-mouseX)/10000)) ;
     X[N] = (KZ*sin(float(300-mouseX)/10000))+(KX*cos(float(300-mouseX)/10000)) ;
     KZ = Z[N] ; KY = Y[N] ;
     Z[N] = (KZ*cos(float(300-mouseY)/10000))-(KY*sin(float(300-mouseY)/10000)) ;
     Y[N] = (KZ*sin(float(300-mouseY)/10000))+(KY*cos(float(300-mouseY)/10000)) ;
     KVZ = VZ[N] ; KVX = VX[N] ;
     VZ[N] = (KVZ*cos(float(300-mouseX)/10000))-(KVX*sin(float(300-mouseX)/10000)) ;
     VX[N] = (KVZ*sin(float(300-mouseX)/10000))+(KVX*cos(float(300-mouseX)/10000)) ;
     KVZ = VZ[N] ; KVY = VY[N] ;
     VZ[N] = (KVZ*cos(float(300-mouseY)/10000))-(KVY*sin(float(300-mouseY)/10000)) ;
     VY[N] = (KVZ*sin(float(300-mouseY)/10000))+(KVY*cos(float(300-mouseY)/10000)) ;
     KdVZ = dVZ[N] ; KdVX = dVX[N] ;
     dVZ[N] = (KdVZ*cos(float(300-mouseX)/10000))-(KdVX*sin(float(300-mouseX)/10000)) ;
     dVX[N] = (KdVZ*sin(float(300-mouseX)/10000))+(KdVX*cos(float(300-mouseX)/10000)) ;
     KdVZ = dVZ[N] ; KdVY = dVY[N] ;
     dVZ[N] = (KdVZ*cos(float(300-mouseY)/10000))-(KdVY*sin(float(300-mouseY)/10000)) ;
     dVY[N] = (KdVZ*sin(float(300-mouseY)/10000))+(KdVY*cos(float(300-mouseY)/10000)) ; 
     VX[N] = VX[N] + dVX[N] ; dVX[N] = dVX[N] * H ;
     VY[N] = VY[N] + dVY[N] ; dVY[N] = dVY[N] * H ; 
     VZ[N] = VZ[N] + dVZ[N] ; dVZ[N] = dVZ[N] * H ;
     L = sqrt((VX[N]*VX[N])+(VY[N]*VY[N])) ;
     L = sqrt((VZ[N]*VZ[N])+(L*L)) ;
     if ( L > 12.5 ){
       stroke(125+(Z[N]/2),125+(Z[N]/2),125+(Z[N]/2)) ;   
       line((X[N]+(VX[N]*(L-12.5)/L))*1.4+300,(Y[N]+(VY[N]*(L-12.5)/L))*1.4+300,X[N]*1.4+300,Y[N]*1.4+300) ;  
     }
  }
    
} // draw() 



void mousePressed(){
  
 for ( N = 0 ; N <= Nmax ; N++ ){
     if ( Z[N] > 180 ){
       L = sqrt((X[N]*X[N])+(Y[N]*Y[N])) ;
       dVX[N] = dVX[N] + (2.5*Y[N]/L) ;
       dVY[N] = dVY[N] - (2.5*X[N]/L) ;
     }
  }
     
} // mousePressed()