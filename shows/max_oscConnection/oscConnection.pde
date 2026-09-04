import oscP5.*;
OscP5 oscP5;

float amplitude = 0;
float scale=6;
float smooth_factor=0.1;
float sum;

void setup() {
    size(600,600);    
    oscP5 = new OscP5(this,12000);
}

void draw() {
    background(0);
    println(amplitude);
    
    sum += (amplitude - sum) * smooth_factor;
    // scaled to height/2 and then multiplied by a scale factor
    float amp_scaled=sum*(height/2)*scale;
    float mappedColor = map(amplitude, 0, 1, 0, 255);
    fill(255-mappedColor, mappedColor, 255);
    ellipse(width/2, height/2, amp_scaled / 2, amp_scaled / 2);
}

void oscEvent(OscMessage theOscMessage) {
    float value = theOscMessage.get(0).floatValue();    
    if (theOscMessage.checkAddrPattern("/salt")) {   //  message reciever      
            amplitude = value;       
    }
}
