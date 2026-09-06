void updateScene() {

  int w = width;
  int h = height;
  float dim = 2* h/3f;

  pg_obstacles.beginDraw();
  pg_obstacles.clear();
  pg_obstacles.noStroke();
  pg_obstacles.blendMode(REPLACE);
  pg_obstacles.rectMode(CORNER);

  // border
  pg_obstacles.fill(0, 255);
  pg_obstacles.rect(0, 0, w, h);
  pg_obstacles.fill(0, 0);
  pg_obstacles.rect(10, 10, w-20, h-20);

    pg_obstacles.fill(0, 255);
  // animated obstacles
  pg_obstacles.rectMode(CENTER);
  pg_obstacles.pushMatrix();
    pg_obstacles.translate(w/2-30, h/2-185);  
    pg_obstacles.rotate(45);
    pg_obstacles.rect(0, 0, 4, 660);
  pg_obstacles.popMatrix();
  
  pg_obstacles.pushMatrix(); 
   pg_obstacles.translate(w/2-30, h/2-10);   
    pg_obstacles.rotate(45);
    pg_obstacles.rect(0, 0, 4, 760);
  pg_obstacles.popMatrix();
 
    pg_obstacles.rect(700, h/2-170, 160, 4);  
   pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(w/2-20, 3*h/4);  
    pg_obstacles.rotate(PI/3); // roatation
    pg_obstacles.rect(0, 0, 4, 580);
  pg_obstacles.popMatrix();
  
    pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(w/2-80, 3*h/4+150);  
    pg_obstacles.rotate(45);
    pg_obstacles.rect(0, 0, 4, 760);
  pg_obstacles.popMatrix();
  
   pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(3*w/4+120, 3*h/4+50);  
   // pg_obstacles.rotate(45);
    pg_obstacles.rect(0, 0, 160, 200);
  pg_obstacles.popMatrix();
  
    pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(3*w/4+120, h/4+120);  
   // pg_obstacles.rotate(45);
    pg_obstacles.rect(0, 0, 160, 200);
  pg_obstacles.popMatrix();
  
    pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(180, h/4+120);  
   // pg_obstacles.rotate(45);
    pg_obstacles.rect(0, 0, 160, 200);
  pg_obstacles.popMatrix();
  
    pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(180,3*h/4+80);  
   // pg_obstacles.rotate(45);
    pg_obstacles.rect(0, 0, 160, 200);
  pg_obstacles.popMatrix();
  
  pg_obstacles.pushMatrix(); 
    pg_obstacles.translate(width/2+30,60);  
    pg_obstacles.rect(0, 0, 80, 100);
  pg_obstacles.popMatrix();
  
  pg_obstacles.endDraw();
}
