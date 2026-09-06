var A = PI / 4; // angle
var Aslider;
var Dslider;
var Lslider;
var P1slider;
var P2slider;
var P3slider;


function setup() {
	createCanvas(500, 500);
	Aslider = createSlider(0, TWO_PI, PI / 6, 0.001)
	Dslider = createSlider(0.6, 0.9, 0.9, 0.001)
	Lslider = createSlider(50, 70, 60, 0.01)
	P1slider = createSlider(-190, 190, 0, 0.1);
	P2slider = createSlider(-190, 190, 0, 0.1);
	P3slider = createSlider(-190, 190, 0, 0.1);

}

function draw() {
	scale(0.25);
	background(0);
	stroke(255, 150);
	translate(width *2, height*3)
	A = Aslider.value();
	D = Dslider.value();
	L = Lslider.value();
	P1 = P1slider.value(); 
	P2 = P2slider.value(); 
	P3 = P3slider.value(); 
	branch(100);
}

function branch(len) {
	
	line(P1, P2, P3, -len);
	translate(0, -len);


	if (len > L) {
	
		push();
		rotate(A);
		branch(len * D);
		rotate(-A);
		branch(len * D);
		pop();


		push();
		rotate(-A);
		branch(len * D);
		rotate(A);
		branch(len * D);
		pop()
	}
	
}
function mousePressed(){
	background(0);
	P1=0; 
	P2=0; 
	P3=0;
}