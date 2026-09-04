void draw_landscape(float aa_) {
  float mx = 4. + mouseX / width * 8;
  
  int rect_size = (int)mx;

  noStroke();
  
  // initial circle size
  int bsize = 16;
  
  int xoff = width / 2;
  int yoff = height / 2;
  
  int xrad_step = 8;
  int yrad_step = 8;
  
  int xdeform = 100;
  int ydeform = 100;
  
  float xrmotion_size =60;
  float yrmotion_size = 60;
  
  for (int e = 0; e < elems; e += elems_step) {
    float de = (float)e / elems;    
    float bd = de * 4;
    
    float ex = sin(de * 360 * (PI / 180) + xmotion);
    float ey = cos(de * 360 * (PI / 180) + ymotion);
    
    float xrad = e * xrad_step + bsize + sin(de * 360 * (PI / 180) + xmotion) * xrmotion_size;
    float yrad = e * yrad_step + bsize + cos(de * 360 * (PI / 180) + xmotion) * yrmotion_size;
    
    float final_ex = xoff + ex * xdeform;
    
    float xpp = (de * 360 * (PI / 180)) / 2;
  
    float xrepeat = 1; // this doesn't work as expected ? if you increase this you must add "&(colormap.width-1)" to xxd below (after "xrepeat)") and "&(colormap.height-1)" to yyd
    int xxd = ((int)(de * (colormap.width * xrepeat)));
    
    for (int d = 0; d < dots; d += dots_step) {
      float dd = (float)d / dots;
      
      float xp = dd * 360 * (PI / 180);
      float yp = dd * 360 * (PI / 180);
      
      // important phase to improve the rendering, offset the dots per circles so that it "fill more space", additionaly mess up the dots gradually
      xp += xpp + rmotion * ldmotion[d + e * dots];
      yp += xpp + rmotion * ldmotion[d + e * dots];
      
      float final_x = final_ex + sin(xp) * xrad;
      float final_y = yoff + ey * ydeform + cos(yp) * yrad;
      
      // do not compute outside boundary
      if (final_x >= width+16 || final_x < -16 || final_y >= height +16 | final_y < -16) {
        continue;
      }
      
      // apply colormap / texture
      float yrepeat = 1;
      
      int yyd = (((int)(dd * (colormap.height * yrepeat)))) * colormap.width;
 
      int cl = (int)xxd + yyd;
      
      int r = (int)(red(colormap.pixels[cl]) * bd);
      int g = (int)(green(colormap.pixels[cl]) * bd);
      int b = (int)(blue(colormap.pixels[cl]) * bd);
      
      fill(r, g, b);      
      rect(final_x, final_y, rect_size, rect_size);      
    }
  }
  
  xmotion += aa_ ;
  ymotion += aa_;
  rmotion += 0.12;
}

void drawStream (float aa_) {
  farmnx = 0;
  for (int i=0; i<width; i += 70) {
    farmny = 0;
    for (int j=0; j<height; j += 10) {
      float n = noise (farmnx, farmny, farmnz);
      float angle = map (n, 0, 1.0, 0, 12*PI);
      float x = 70 * cos (angle);
      float y = 40 * sin (angle);
      //line (i, j, i+x, j+y);
      ellipse(i+x, j+y,10,10);
      farmny += 0.02;
    }
    farmnx += 0.05;
  }
  farmnz +=aa_/10;
}

void FanSpin( float am_ ,int triangles , float x_ , float y_) {

  float alpha = (TWO_PI/triangles) ;
  float delta =  (frameCount*0.015) ;
  float h = map(am_,0,1,50,500); //.21 * width/2;
  float w = h * sin( alpha );
  int c = 0;
  for (int i = 0; i< triangles; i++) {
    if ( i % 2 == 0) c = 0; 
    else c = 255;
    blendMode(BLEND);
    pushMatrix();
    translate( x_,y_ );
    rotate( alpha * i +delta );
    fill( c );
    noStroke();
    triangle( 0, 0, 0, -h, w, -h);
    popMatrix();
  }
}
