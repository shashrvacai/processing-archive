import processing.sound.*;

float z = 0; // create variable for noise z
Amplitude  amp ;
AudioIn in ;

void setup() {
    size(1000, 1000);
    background(0);
    amp = new Amplitude(this);
    in = new AudioIn(this,0);
    in.start();
    amp.input(in);
}

void draw() {
    float aa = amp.analyze()*10;
    noStroke();
    fill(0,30);
    rect(0,0,height,width);
    strokeWeight(5*aa+0.2);
    stroke(255, 100);

    // float y = 0; creates decimal variable y and assigns value 0 to it
    // loop repeats as long as y < height; is true
    // y = y + 20 increments y in the end of each iteration.
    for (float y = 0; y < height; y = y + 5) {
        // float x = 0; creates decimal variable x and assigns value 0 to it
        // loop repeats as long as x < width; is true
        // x = x + 1 increments the x in the end of each iteration.
        for (float x = 0; x < width; x = x + 40) {
           //point(x+map(noise(x/100*aa, y*aa/150, z), 0, 1, -100, 100), y );
            ellipse(x+map(noise(x/100*aa, y*aa/150, z), 0, 1, -100, 100),y,10*aa,10*aa);
        }
    }
    // when y is 500 the program will move forward. In this case increment z
    z = z + 0.002;
}