var para1,para2 , para3 , para4, para5 , para6;
var i1 , i2 , i3;

function preload(){
    i1 = loadImage("https://2.bp.blogspot.com/-8ttpRU5cCPM/WUN9gFXQtlI/AAAAAAAAFks/FcpmIpXtRYQqyFppRlsF3KgkWRh-t8O5QCK4BGAYYCw/s640/layered%2Bhuman.PNG")
    i2= loadImage("https://1.bp.blogspot.com/-goOFICEthCQ/WT-X8ANXOhI/AAAAAAAAFj0/qOs_ZhIQF4oEhP5Tszdv8YWn0waWJYLVACK4B/s640/silVet%2B.jpg")
    i3= loadImage("https://1.bp.blogspot.com/-ulKm6bO_LHA/WUjOmhXcibI/AAAAAAAAFk8/uhWqYV2bFDwt80g1xHH2t3j8krVq0ic_gCK4BGAYYCw/s640/Portable%2BNetwork%2BGraphics%2Bimage-E5A841A0B7D3-1.png")
    i4= loadImage("https://4.bp.blogspot.com/-4UC379WrB6U/WVX43qs2emI/AAAAAAAAFmw/PVFFigvypaEStvDmwqVwGo7mVPpLaGkAgCK4BGAYYCw/s640/Portable%2BNetwork%2BGraphics%2Bimage-64AB20E48418-1.png")
    i5= loadImage("https://1.bp.blogspot.com/-aMBXw1PiqCc/WVX5lzlCNUI/AAAAAAAAFm8/yP7PWdhWqNEhBhWyi2zawO4Oty17VzlYACK4BGAYYCw/s640/Portable%2BNetwork%2BGraphics%2Bimage-D30B27D3C92B-1.png")
    //i6= loadImage("https://2.bp.blogspot.com/-O0xV292uK7k/WVX55NKWGAI/AAAAAAAAFnE/Yl9gvVqb1cwxGU9K_3DKmDK6MkrdVdXOACK4BGAYYCw/s640/IMG_0663.PNG")
    i7= loadImage("http://2.bp.blogspot.com/-jFifcW8A1Cs/WVbll1BqVOI/AAAAAAAADPo/N9IPAfmoIpY0yrnKLvE44wcziRTNc5uGgCK4BGAYYCw/s1600/f95e8e54244003.59536c3e199c7.jpg")
    i8= loadImage("http://4.bp.blogspot.com/-5zOQ830Xh2Y/WVbll5YQjcI/AAAAAAAADPk/uoRkkX7u9TgFovVLwz4ccBl-s76XZgLpgCK4BGAYYCw/s1600/0c6d3854244003.59536c3e18afc.jpg")
    i9= loadImage("http://4.bp.blogspot.com/-ZKuzNx66sS0/WVblmQ-WiHI/AAAAAAAADPw/DEATGWJWAGAdv3GriTL1ar09pynaOh13gCK4BGAYYCw/s1600/5abd7a54244003.59536c3e1863e.jpg")
    i10= loadImage("http://4.bp.blogspot.com/-iDVOH3u_gw0/WVblltYJtoI/AAAAAAAADPc/bAY7ElMJtD0AK_6aMVBvsofzBL0IHvwSwCK4BGAYYCw/s1600/39688154244003.59536c3e17f0d.jpg")
    i11= loadImage("http://2.bp.blogspot.com/-hxFTbmSfmrU/WVX3I96_NyI/AAAAAAAAFmk/K-RE2gWP-ukhuEGJPObjlZuvbOIbTgi3ACK4BGAYYCw/s1600/orange.jpg")
    para1 = loadImage("https://3.bp.blogspot.com/-_hGW9m91l3Q/WVao-N8OIqI/AAAAAAAADNk/_igDOJS0JykPPItBJU5PUJ_o2XxnPyEaACK4BGAYYCw/s640/para1.png")
    para2 = loadImage("https://3.bp.blogspot.com/-ml92OwVlVXQ/WVbS92OHxwI/AAAAAAAADOg/B9sR9M8z4UodAQXl7qWwAN6VGTKiognHACK4BGAYYCw/s320/para2.png")
    para3 = loadImage("https://1.bp.blogspot.com/-xUeK0WD6VhQ/WVbTBBpwGCI/AAAAAAAADOo/6lYvXIaUbdMKAopQuwhTkASRXeeq80cWQCK4BGAYYCw/s320/03.png")
    para4 = loadImage("https://2.bp.blogspot.com/-JKQFU1BYXnE/WVbTE_oWLnI/AAAAAAAADOw/Cagi7HimX0syCfq7gHnD8mG971uWmJQ8gCK4BGAYYCw/s320/para04.png")
    para5 = loadImage("https://2.bp.blogspot.com/-hUsA18oBmjg/WVbTKNx9Z9I/AAAAAAAADPA/pXWT7ZdTWH8WvyB_u51rY-kTMneegQgkgCK4BGAYYCw/s320/para05.png")
    para6 = loadImage("https://3.bp.blogspot.com/-3dWeXNZs2p8/WVbTNprEUII/AAAAAAAADPI/SpTqmJKNU-stXKtgmHoeXAmlGF3iwbSVgCK4BGAYYCw/s320/para06.png")
}

function setup() {
  createCanvas(1400, 6000)
  
}

function draw() {
  translate(0,-50)
  background(0, 255)
  var h = 400; /// var replaing height
  b = map(mouseY, 0,windowHeight, -150, 0); // postion
  c = map(mouseY, 0, windowHeight, 4, 100); // diff bet 2 lines
  d = map(mouseY, 0, windowHeight, 4, 255); // color change
  e = map(mouseY, 0, windowHeight, 2, 0.005); // line thickness
  for (var i = 600; i < 1250; i += c) {
    stroke(255)
    strokeWeight(e);
    line(i + b + 200, 400, i - b, h / 6) // lines start on 60  - 400
    line(i - b, h / 6, i + b, h / 2);
    line(i + b, h / 2, i - b / 2, h / 2 + h / 8);
    line(i - b / 2, h / 2 + h / 8, i + b * 2, h - h / 6);
    line(i + b * 2, h - h / 6, i + b *2+10, h);
    line(i + b * 2+10, h, i + b + 200, 400);
  }
  textAlign(CENTER)
  fill(d, 255);
  textFont("Century");
  noStroke();
  textSize(102);
  textAlign(LEFT)
  text("// .", 700, h / 2);
  textSize(32);
   fill(d, 255);
  text("'Work is gas. Work will fill any given volume.' - erik Spiekermann . ", 320, h-b/3);

  randomShape(500,600,2)
  imageMode(CENTER);
 
  var iS = width/12      // to connect the sizde of the image with width
  drawEllipse(70,500+b,200,10)
  image(i1, width/6+50,1000+b,3*iS,4*iS);
  image(i2 , width/2,1000+b/2,3*iS+32,4*iS)
  image(i3 , width-width/6-50,1000+b/3,3*iS,4*iS);
  image(i4 , width-width/3+50 , 1700 -b/2-10, 420,320)
  image(i5 , width/3-50 , 1900 +b/2-10, 284,426)
  //image(i6 , width/3 , 2500 -b/2-10, 420,320)
  image(i7 , width/2 , 2750 -b/3, 900,410)
  image(i8 , width/2-225 , 2940 +b/2, 440,273);
  image(i9 , width/2+225 , 3350 -b/2-10, 440,578)
  image(i10 , width/2 , 3700 -b/3, 900,242)
  image(i11 , width/2 , 3750 +b/3, 900,242)
  image(para1 , width/3 -50 , 1510+b/3,388,268)
  image(para2 , width-width/3 , 2000 -b/3,640,306)
  image(para3 , width/2 , 2200 +b/3,1202,175)
  image(para4 , width/2  , 3625+b/4)
  image(para5 , width/3 , 2100)
  image(para6 , width/3 , 2500)
  
}

function randomShape(x, y,s) {
  
  stroke(255)
  noFill()
  for (var i = 100; i > 0; i -= 5) {
    var ran = random(0,50)
    push()
    translate(x, y);
    beginShape();
      vertex(x - 100 - i - b/2, y + 100 + i);
      vertex(x + 100 - i + b/3, y - 100 - i +b/3);
      vertex(x + 100 + i - b, y + 100 - i);
      vertex(x - 100 + i, y - 100 - i+b/2);
    endShape(CLOSE)
    pop()
  }
}

function drawEllipse(x, y,s,n) {
  
  stroke(255)
  noFill()
  for (var i = s; i > 0; i -= n) {
    var ran = random(0,50)
    push()
    translate(x, y);
    ellipse(x,y+b/3,i,i)
    pop()
  }
}