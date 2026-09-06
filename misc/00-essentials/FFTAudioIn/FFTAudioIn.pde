import processing.sound.*;

FFT fft;
AudioIn in;

int bands = 128;
float smoothingFactor = 0.2;
float[] sum = new float[bands];
int scale = 5;
float barWidth;

public void setup() {
  size(640, 360);
  background(255);
  barWidth = width/float(bands);
  
 in  = new AudioIn(this,0);
  in.start();

  // Create the FFT analyzer and connect the playing soundfile to it.
  fft = new FFT(this, bands);
  fft.input(in);
}

public void draw() {
  // Set background color, noStroke and fill color
  background(125, 255, 125);
  fill(255, 0, 150);
  noStroke();

  // Perform the analysis
  fft.analyze();

  for (int i = 0; i < bands; i++) {
    // Smooth the FFT spectrum data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;

    // Draw the rectangles, adjust their height using the scale factor
    rect(i*barWidth, height, barWidth, -sum[i]*height*scale);
  }
}
