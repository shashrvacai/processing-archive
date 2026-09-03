

// import everything necessary to make sound.
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

int count = 0 ;
int metro = 100 ;
float xoff = 0.0;
int ranPick ; 
int ranChord[] ={0,0,0} ;       // to pick a radom start key for a chord 

void setup(){
  size( 512, 200, P2D );

  minim = new Minim( this );
  out = minim.getLineOut( Minim.STEREO, 2048);    
}

void draw()
{
  background( 0 );
  stroke( 255 );
  
  ToneInstrument newNote ;
  float pitch = 0 ; 
  int cho1 = 0 , cho2 = 0, cho3 = 0 ; 
  
  float m = (int)map(noise(xoff),0,1,5,50);
  
   if(count%metro== 0){
   int n = (int)map(noise(xoff),0,1,0,playingChord.length-4);   // length -4 to avaid picking random note from the end
    arrayCopy(playingChord,n,ranChord,0,3);     // picks a random chord
    cho1 = ranChord[0];    cho2 = ranChord[1];   cho3 = ranChord[2]; 
    
    out.playNote( 0, 0.2, new ToneInstrument( pitches[cho1], 0.19 , 1 ) ); 
    out.playNote( 0, 0.2, new ToneInstrument( pitches[cho2], 0.19 , 1 ) ); 
    out.playNote( 0, 0.2, new ToneInstrument( pitches[cho3], 0.19 , 1 ) ); 
 }
 
 
  if(count%m==0){
    int n = (int)(noise(xoff) * nowPlaying.length);    
    ranPick = nowPlaying[n];
    out.playNote( 0, 0.9, new ToneInstrument( pitches[ranPick], 0.49 , 0.5 ) );  
  }
 
  for( int i = 0; i < out.bufferSize() - 1; i++ ){
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    // draw a line from one buffer position to the next for both channels
    line( x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*150);
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  } 
  
  count ++ ;
  xoff = xoff + .01; 
}
