import processing.sound.*;

Amplitude amp ;
AudioIn in;
PVector pos, nOff ;


import java.nio.ByteBuffer;

import com.jogamp.opengl.GL2;
import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLTexture;
import com.thomasdiewald.pixelflow.java.imageprocessing.DwShadertoy;


  DwPixelFlow context;
  DwShadertoy toy, toyA, toyB, toyC, toyD;
  DwGLTexture tex_noise = new DwGLTexture();
 
  public void settings() {
    size(1280, 720, P2D);
    smooth(0);
  }
  
  public void setup() {
    surface.setResizable(true);
    
    amp = new Amplitude(this);
  in  = new AudioIn(this,0);
  in.start();
  amp.input(in); 
    
    pos = new PVector(width/2,height/2);
  nOff = new PVector(random(10000),random(1000));
  
    context = new DwPixelFlow(this);
    context.print();
    context.printGL();
    
    toyA = new DwShadertoy(context, "data/ExpansiveReactionDiffusion_BufA.frag");
    toyB = new DwShadertoy(context, "data/ExpansiveReactionDiffusion_BufB.frag");
    toyC = new DwShadertoy(context, "data/ExpansiveReactionDiffusion_BufC.frag");
    toyD = new DwShadertoy(context, "data/ExpansiveReactionDiffusion_BufD.frag");
    toy  = new DwShadertoy(context, "data/ExpansiveReactionDiffusion.frag");
    
    // create noise texture
    int wh = 1006;
    byte[] bdata = new byte[wh * wh * 4];
    ByteBuffer bbuffer = ByteBuffer.wrap(bdata);
    for(int i = 0; i < bdata.length;){
      bdata[i++] = (byte) random(0, 255);
      bdata[i++] = (byte) random(0, 255);
      bdata[i++] = (byte) random(0, 255);
      bdata[i++] = (byte) 255;
    }
    tex_noise.resize(context, GL2.GL_RGBA8, wh, wh, GL2.GL_RGBA, GL2.GL_UNSIGNED_BYTE, GL2.GL_LINEAR, GL2.GL_MIRRORED_REPEAT, 4, 1, bbuffer);
    
    frameRate(60);
  }
  
  public void draw() {
    float a = amp.analyze()/10;
    
    blendMode(REPLACE);
    
    pos.x = map(noise(nOff.x),0,1,0,width);
  pos.y = map(noise(nOff.y),0,1,0,height);
  nOff.add(a,a,0);

    //if(mousePressed){
      toyA.set_iMouse(pos.x, height-1-pos.y, pos.x, height-1-pos.y);
      toyB.set_iMouse(pos.x, height-1-pos.y,pos.x, height-1-pos.y);
      toyC.set_iMouse(pos.x, height-1-pos.y,pos.x, height-1-pos.y);
      toyD.set_iMouse(pos.x, height-1-pos.y, pos.x, height-1-pos.y);
      toy .set_iMouse(pos.x, height-1-pos.y, pos.x, height-1-pos.y);
   // }
    
    toyA.set_iChannel(0, toyA);
    toyA.set_iChannel(1, toyC);
    toyA.set_iChannel(2, toyD);
    toyA.set_iChannel(3, tex_noise);
    toyA.apply(width, height);
    
    toyB.set_iChannel(0, toyA);
    toyB.apply(width, height);
    
    toyC.set_iChannel(0, toyB);
    toyC.apply(width, height);
    
    toyD.set_iChannel(0, toyA);
    toyD.apply(width, height);
    
    toy.set_iChannel(0, toyA);
    toy.set_iChannel(2, toyC);
    toy.set_iChannel(3, tex_noise);
    toy.apply(this.g);
   
    
  }
  
