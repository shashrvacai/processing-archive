class nGrid {
  int grid = 20, NoiseGrid = 2 ;
  float a = 0, increment = 0.005, zoff = 0.0, zincrement = 0.02, r = 300, inc = 0.1 ;
  PImage Buffer ;


  nGrid() {
    Buffer=  new PImage(width, height);
    n = new  OpenSimplexNoise();
  }

  void render() {
    zincrement = map(n2, 1, 127, 0.000, 0.05);
    grid = (int)map(n1, 0, 127, 5, 40);

    blendMode(BLEND);
    loadPixels();
    float xoff = 0.0; // Start xoff at 0

    // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
    for (int x = 0; x < width; x+= NoiseGrid) {
      xoff += increment;   // Increment xoff 
      float yoff = 0.0;   // For every xoff, start yoff at 0
      for (int y = 0; y < height; y+= NoiseGrid) {
        yoff += increment; // Increment yoff

        // Calculate noise and scale by 255
        float bright = (float)n.eval(xoff, yoff, zoff)*2;
        //float bright = (float) n.eval(xoff,yoff,zoff);
        float Bmapped = map(bright, -1, 1, 0, 255);

        Buffer.pixels[x+y*width] = color(Bmapped, Bmapped, Bmapped);
      }
    }
    updatePixels();

    zoff += n2; // Increment zoff

    for (int i = grid; i <= width; i+=  grid ) {
      for (int j = grid; j <= width; j+=  grid ) {
        color c = Buffer.get(i, j);      
        int numN = (int)map( (brightness(c)), 0, 255, 0, 9);    
        textSize(grid);
        noStroke();
        if (brightness(c) <75) {
          fill(map(numN, 0, 9, 255, 00), 0, map(numN, 0, 9, 150, 255));
        } else {
          fill(255);
        }
        text(numN, i, j);
      }
    }
    a+= inc ;
  }
}
