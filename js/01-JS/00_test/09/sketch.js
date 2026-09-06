var citi;
var count = 0;
var lat1;
var long1;
var lat2;
var long2 ;
var r = 0.5

function preload() {
	citi = loadTable("cities.csv", "header");
}

function setup() {
	createCanvas(800, 600);
	
	strokeWeight(0.05)
	noStroke();
	//stroke(255,1);
	//pixelDensity(5);

}

function draw() {
	
	translate(-600 , -650)
	scale(5.5);
	background(255,77,89);
	for (var i = 0; i < citi.getRowCount(); i++) {
			lat1 = citi.getNum(i, "lat");
			long1 = citi.getNum(i, "lng");
			drawLine(r);
	}
	
}

function setXY(lat1, long1, lat2, long2) {
	
	
	var x1 = map(long1, -180, 180, 0, width);
	var y1 = map(lat1, 90, -90, 0, height);
	var x2 = map(long2, -180, 180, 0, width);
	var y2 = map(lat2, 90, -90, 0, height);
	var c = map (mouseX,0,width,110,255);
	var d = map (mouseY, 0, height ,118,227)
	//line(x1, y1,c, d);
	if (floor(c) == floor(x1) && floor(d)== floor(y1)){
		fill(255,20);
		r+= 3 ;
		ellipse(x1,y1,r,r);
		
	}else {
		fill(0,48,80);
		r =0.01;
		ellipse(x1,y1,r,r)
	}
	
	
	
}

function drawLine(r) {
	setXY(lat1, long1, lat2, long2);
}

