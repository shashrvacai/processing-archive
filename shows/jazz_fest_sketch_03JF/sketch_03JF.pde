import processing.sound.*;
//import spout.*;

Amplitude amp;
AudioIn in ;

//Spout spout;

ArrayList<star> starArray = new ArrayList<star>();
ArrayList<Vehicle> vehicles; 

DC dc ;
star neuerStern;

PVector pos, nOff, starcontrol, originePoint = new PVector(0, 0);
float  r, sep = 20, mF = 0, sz =  20, col = 0, fly = 2;
float [][] terrain;

int state, numberOfStars = 2000, newStars =20, cols, rows, scl= 20, w = 1800, h = 1800;
color BGCol = color(0), VehCol = color(255);  

void setup() {  
              //spout = new Spout(this);   ////  ----  Spout
              //spout.createSender("Spout Processingtest");
            
              //------------------------------------- Audio in 
              amp = new Amplitude(this);  
              in = new AudioIn(this, 0);
              in.start();  
              amp.input(in);
            
              //------------------------------------- setup
              fullScreen(OPENGL,2);       
              //size(1000, 1000, P3D);
              background(BGCol);
              noiseDetail(2, 0.5);
              
              // ----------------------------------- objects
              dc = new DC();
              neuerStern= new star();   
            
              //------------------------------------ variables
              state= 0 ;    /// ---  intitial state  
              pos = new PVector(width/2, height/2);
              nOff = new PVector(random(10000), random(1000)); 
              starcontrol = new PVector(width/2, height/2);
              
              // ----------------------------------vehicle (Obey)
              vehicles = new ArrayList<Vehicle>();
              for (int i = 0; i < 1; i++) {
                vehicles.add(new Vehicle(random(width), random(height)));
              }
              
                // -------------------------------- geoRun 
              cols = w /scl;
              rows = h/scl;
              terrain = new float[cols][rows];  
}

void draw() {
              //spout.sendTexture();
              float aa =amp.analyze();
              
              if (keyPressed == true && key =='m') aa=00;       // mute audio input 
              else  aa = map(amp.analyze(), 0, 0.5, 0, 1);
              
              if (state == 0) {     
                         noStroke(); 
                         fill(0, 25);
                         rect(0, 0, 8*width, 8*height);
                         noFill();
                         dc.run(aa,pos.x,pos.y);
              }else if (state == 1) {           //  --------  Obey --1
                         noStroke(); 
                         fill(0, 5);
                         rect(0, 0, 8*width, 8*height);
                         noFill();
                                vehicles.add(new Vehicle(pos.x, pos.y)); //  ------------- obey
                                  for (Vehicle v : vehicles) {
                                            v.seperate(vehicles, sep, mF);
                                            v.update();
                                            v.borders();
                                            v.display(col, sz);
                                          }
                                if (vehicles.size()>500) {
                                            vehicles.remove(0);
                                }
              }else if (state == 2) {    /// -- noise wall   ------------ 2
                                noStroke(); 
                                fill(0);
                                rect(0, 0, 8*width, 8*height);
                                noFill();  
                                rectMode(CENTER);
                                stroke(236,136,140);
                                for (int x = 10; x < width; x += 10) {
                                  for (int y = 10; y < height; y += 10) {
                                    float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
                                    pushMatrix();   
                                    float recSize = n*aa;     
                                    translate(x, y);
                                    rotate(TWO_PI *n*(aa*10));
                                    scale( recSize);
                                    rect(0, 0, 5, 5);
                                    popMatrix();
                                  }
                                }
              } else if (state == 3) {      // ---  star feild        ----3 
                                    noStroke(); 
                                    fill(0, 5);
                                    rect(0, 0, 2*width, 2*height);
                                    noFill();
                                    fill(255);
                                    neuerStern.render();
                                    for (int i = 0; i<newStars; i++) {   // star init
                                      starArray.add(new star());
                                    }
                                    for (int i = 0; i<starArray.size(); i++) {
                                      if (starArray.get(i).x<0||starArray.get(i).x>width||starArray.get(i).y<0||starArray.get(i).y>height) starArray.remove(i);
                                      starArray.get(i).move(aa/2);
                                      starArray.get(i).render();
                                    }
                                    if (starArray.size()>numberOfStars) {//
                                      for (int i = 0; i<newStars; i++) {
                                        starArray.remove(i);
                                      }
                                    }
               }else if (state == 4) { 
                                    pushMatrix();
                                    fill(0, 20);
                                    rectMode(CENTER);
                                    translate(width/2, height/2, -width-700);
                                    rect(0, 0, 2*width, 2* height);   
                                    popMatrix();
                                    float AmL = aa*500;     /// required multiplication factor 
                                    fly -= 0.05;
                                    float  yOff =fly;
                                    for ( int y = 0; y < rows; y ++) {
                                      float xOff = 0;
                                      for (int x = 0; x < cols; x ++) {
                                        terrain[x][y] =  map(noise(xOff, yOff), 0, 1, -AmL, AmL);  //with noise
                                        xOff+=0.1;
                                      }
                                      yOff +=0.1;
                                    }
                                    stroke(255);
                                    strokeWeight(2);
                                    noFill();
                                    translate(width/2, height/2);
                                    float mouse = map(mouseY, 0, width, -PI/2, PI/2);
                                    float mouseZ = map(mouseX, 0, height, -PI/2, PI/2);
                                    rotateX(mouse);
                                    rotateZ(mouseZ);
                                    translate(-w/2, -h/2);
                                    for ( int y = 0; y < rows-1; y ++) {
                                      for (int x = 0; x < cols; x ++) {
                                        point(x*scl, y*scl, terrain[x][y]);
                                      }
                                      endShape();
                                    }
                }
                
  if (key == 'q')     vehicles.add(new Vehicle(pos.x, pos.y));    // adds continuous vehicle
  else if (key == ']' ) mF = 0 ;       //sep = 20 ;    
  else if (key == '[' )  mF = 0.25;       //sep = 30 ;     
  else if (key == 'p' )  mF = 0.5 ;       //sep = 40 ;  
  else if (key == 'o' )  mF = 0.75 ;       //sep = 50 ;  
  else if (key == 'i' )  mF = 1 ;       //sep = 60 ;
  else if (key == 'u')   mF =map(aa, 0, 0.5, 0, 1);    

  if (key == 'r')    starcontrol = new PVector(0, 0);
  else if (key == 't')    starcontrol = new PVector(width/2, 0);
  else if (key == 'y')    starcontrol = new PVector(0, width);
  else if (key == 'h')    starcontrol = new PVector(width, height/2);
  else if (key == 'n')    starcontrol = new PVector(width, height);
  else if (key == 'b')    starcontrol = new PVector(width/2, height);
  else if (key == 'v')    starcontrol = new PVector(0, height);
  else if (key == 'f')    starcontrol = new PVector(0, height/2);
  else if (key == 'g')    starcontrol = new PVector(width/2, height/2);

  r = random(400);
  pos.x = map(noise(nOff.x), 0, 1, 0, width);
  pos.y = map(noise(nOff.y), 0, 1, 0, height);
  nOff.add(aa/10, aa/10, 0);
  //fill(255);                                                        // random walker debugger
  //ellipse(pos.x,pos.y,40,40);

  if (keyPressed== true && key == '5') {
    blendMode(DIFFERENCE);
    fill(255);
    ellipse(random(pos.x,width-pos.x), random(pos.y,height-pos.y), r, r);
  }

}

void keyTyped() {
  if (key =='0')           state = 0 ;
  else if (key =='1')      state = 1 ;
  else if (key =='2')      state = 2 ;
  else if (key =='3')      state = 3 ;
  else if (key =='4')      state = 4 ;
  else if (key =='6')      state = 6 ;
}
void keyPressed(){
  if (key == 'z')    background(0);
}
