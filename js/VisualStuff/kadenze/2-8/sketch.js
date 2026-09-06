var movers = [];
var w1  , water , wCol , A;   
var f = [];

function setup() {
  createCanvas(400,900);
  for(var i = 0 ; i < 5 ; i++){                         // movers
    movers[i] = new Mover(random(width),0, random(5))
  }
  A = new Attractor();
  w1Col = color(7,164,167)
  w2Col= color(255,121,122)
  w3Col= color(121,255,122)
  w4Col= color(0,121,122)
  w1 = new Atmos(random(width),random(100,200), 0.001,w1Col)   //atmos variation
  w2 = new Atmos(random(width),random(250,350), 0.1,w2Col)      //atmos variation
  w3 = new Atmos(random(width),random(400,500), 0.05,w3Col)     //atmos variation
  w4 = new Atmos(random(width),random(550,650), 0.005,w4Col)    //atmos variation
}

function draw() {
  background(169,76,190,10);
  
  w1.show();
  w2.show();
  w3.show();
  w4.show();
  A.show();
  var G =createVector(0, 0.1)
  var B =createVector(0.1, 0)    // extra vectors . to enhance the drag .//
  var b =createVector(-0.1, 0)
  
  for(var i = 0 ; i < movers.length ; i++){    // application of all the vectors if it 
    if(w1.contains(movers[i])){
      var dForce= w1.calDrag(movers[i])
      movers[i].applyForce(dForce);
      movers[i].applyForce(B);
    }else if(w2.contains(movers[i])){
      var w2Force= w2.calDrag(movers[i])
      movers[i].applyForce(w2Force);
    }else if(w3.contains(movers[i])){
      var w3Force= w3.calDrag(movers[i])
      movers[i].applyForce(w3Force);
      movers[i].applyForce(b);
    }else if(w4.contains(movers[i])){
      var w4Force= w4.calDrag(movers[i])
      movers[i].applyForce(w4Force);
    }
    f[i] = A.calAtt(movers[i])
    movers[i].applyForce(f[i])
    movers[i].applyForce(G);
    movers[i].show();
    movers[i].update();
    movers[i].edges();
  }
  
}

//-----  attempt to add mouse interactions


function mouseMoved() {
  A.handleHover(mouseX, mouseY);
}

function mousePressed() {
  A.handlePress(mouseX, mouseY);
}

function mouseDragged() {
  A.handleHover(mouseX, mouseY);
  A.handleDrag(mouseX, mouseY);
}

function mouseReleased() {
  A.stopDragging();
}