// dynamic list with our points, PVector holds position
ArrayList<PVector> points = new ArrayList<PVector>();

// colors used for points
color[] pal = {
  color(0, 91, 197), 
  color(0, 180, 252), 
  color(23, 249, 255), 
  color(223, 147, 0), 
  color(248, 190, 0)
};

// global configuration
float vector_scale = 0.01; // vector scaling factor, we want small steps
float time = 0; // time passes by

void setup() {
  size(800, 800);
  strokeWeight(0.66);
  background(0, 5, 25);
  noFill();
  smooth(8);

  // noiseSeed(1111); // sometimes we select one noise field

  // create points from [-3,3] range
  for (float x=-3; x<=3; x+=0.07) {
    for (float y=-3; y<=3; y+=0.07) {
      // create point slightly distorted
      PVector v = new PVector(x+randomGaussian()*0.003, y+randomGaussian()*0.003);
      points.add(v);
    }
  }
}

void draw() {
  int point_idx = 0; // point index
  for (PVector p : points) {
    // map floating point coordinates to screen coordinates
    float xx = map(p.x, -6.5, 6.5, 0, width);
    float yy = map(p.y, -6.5, 6.5, 0, height);

    // select color from palette (index based on noise)
    int cn = (int)(100*pal.length*noise(point_idx))%pal.length;
    stroke(pal[cn], 15);
    point(xx, yy); //draw

    // placeholder for vector field calculations

    // v is vector from the field
    //float n = TWO_PI * noise(p.x,p.y);
    //PVector v = new PVector(cos(n),sin(n));

    //float n = 100 * map(noise(p.x/5, p.y/5), 0, 1, -1, 1); // 100, 300 or 1000
    //PVector v = new PVector(cos(n), sin(n));

    //    float n = -5*map(noise(p.x, p.y), 0, 1, -1, 1);
    //    PVector v = new PVector(n, -n);


    //float n1 = 10*noise(1+p.x/20, 1+p.y/20); // shift input to avoid symetry
    //float n2 = 5*noise(n1, n1);
    //float n3 = 25*map(noise(n2, n2), 0, 1, -1, 1); // 25,325
    //PVector v = circle(n3);

    //// placeholder for vector field calculations
    //float n1a = 3*map(noise(p.x/2, p.y/2, time), 0, 1, -1, 1);
    //float n1b = 3*map(noise(p.y/2, p.x/2, time), 0, 1, -1, 1);
    //float nn = 6*map(noise(n1a, n1b, time), 0, 1, -1, 1);
    //PVector v = circle(nn);

    float n1a = 3*map(noise(p.x/2, p.y/2), 0, 1, -1, 1);
    float n1b = 3*map(noise(p.y/2, p.x/2), 0, 1, -1, 1);
    float nn = time*10*6*map(noise(n1a, n1b), 0, 1, -1, 1);
    PVector v = circle(nn);

    p.x += vector_scale * v.x;
    p.y += vector_scale * v.y;

    // go to the next point
    point_idx++;
  }
  time += 0.001;
}