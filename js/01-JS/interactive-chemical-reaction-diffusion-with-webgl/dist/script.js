var scene, camera, renderer;
var bufferScene, textureA, textureB, bufferMaterial, colorizeMaterial, plane, bufferObject, finalMaterial, quad, C1= 0 ;

var height, width, startTime, currentTime;

startTime = new Date().getTime();
currentTime = startTime;

height = window.innerHeight,
	width = window.innerWidth;

var mouse = {
	clicked: 1,
	x: 0,
	y: 0
};

var presets = {

	mitosis: {
		f: 0.0367,
		k: 0.0649,
		s: 1
	},
	coral: {
		f: 0.0545,
		k: 0.062,
		s: 20
	},

	custom: {
		f: 0.055,
		k: 0.062,
		s: 20
	},
	typical: {
		f: 0.055,
		k: 0.062,
		s: 15
	}
};


var active = presets.coral;  // change type of 

var dA = 1.0,
    dB = 0.5;

var seedRandom = 0, 
    seedScale = 0.01, 
    seedThreshold = 0.9;

var iterations = 8, // number of samples per frame - this speeds everything up, but is demanding
    scale = 1,
    clear = false;

document.addEventListener('mousemove', function(e){
	mouse.x = e.pageX;
	mouse.y = height - e.pageY;
	mouse.clicked = 1;
});

document.addEventListener('mouseup', function(e){
	mouse.x = e.pageX;
	mouse.y = height - e.pageY;
});


var setup = {
	scene: function(){
		scene = new THREE.Scene();
		camera = new THREE.OrthographicCamera( width / - 2, width / 2, height / 2, height / - 2, 1, 1000 );
		camera.position.z = 2;
		renderer = new THREE.WebGLRenderer();
		renderer.setSize( width, height );
		document.body.appendChild( renderer.domElement );

	},
	bufferScene: function(){
		bufferScene = new THREE.Scene();

		textureA = new THREE.WebGLRenderTarget( window.innerWidth, window.innerHeight, { 
			minFilter: THREE.LinearFilter, 
			magFilter: THREE.LinearMipMapLinearFilter, 
			format: THREE.RGBAFormat,
			type: THREE.FloatType});
			

		textureB = new THREE.WebGLRenderTarget( window.innerWidth, window.innerHeight, { 
			minFilter: THREE.LinearFilter, 
			magFilter: THREE.LinearMipMapLinearFilter, 
			format: THREE.RGBAFormat,
		
			type: THREE.FloatType} );

		bufferMaterial = new THREE.ShaderMaterial( {
			uniforms: {
				bufferTexture: { type: "t", value: textureA },
				res : {type: 'v2',value:new THREE.Vector2(window.innerWidth ,window.innerHeight)},
				mouse: {type:'v3',value:new THREE.Vector3(0,0,0)},
				time: {type:'f', value:0.0},
				dA: {type:'f', value:dA},
				dB: {type:'f', value:dB},
				feed: {type:'f', value:active.f || 0},
				k: {type:'f', value:active.k || 0},
				fV: {type:'f', value:active.fV || 0},
				kV: {type:'f', value:active.kV || 0},
				clear: {type:'f', value: 0},
				drawSize: {type: 'f', value: active.s}
				
			},
			fragmentShader: document.getElementById( 'fragmentShader' ).innerHTML
		} );

		colorizeMaterial = new THREE.ShaderMaterial( {
			uniforms : {
				resolution : { type : 'v2', value : new THREE.Vector2( window.innerWidth, window.innerHeight) },
				texture : { type : 't', value : textureB, minFilter : THREE.NearestFilter },
				
					scale : {type:'f', value:scale}
			},
			fragmentShader : document.getElementById( 'colorize' ).textContent
		} );

		plane = new THREE.PlaneBufferGeometry( window.innerWidth, window.innerHeight);
		bufferObject = new THREE.Mesh( plane, bufferMaterial );
		bufferScene.add(bufferObject);

		plane = new THREE.PlaneBufferGeometry( window.innerWidth, window.innerHeight);
		quad = new THREE.Mesh( plane, colorizeMaterial );
		scene.add(quad);
	}
}

setup.scene();
setup.bufferScene();

function clearScreen() { clear = 1; }
function seedScreen() { seedRandom = 1; }

setTimeout(seedScreen, 300);

window.addEventListener('resize', function() 
				    {
	var NW = window.innerWidth;
	var NH = window.innerHeight;
	renderer.setSize(NW, NH);

	camera.aspect = NW / NH;
	camera.updateProjectionMatrix();

	textureA.setSize(NW, NH);
	textureB.setSize(NW, NH);

	bufferMaterial.uniforms.res.value.x = NW;
	bufferMaterial.uniforms.res.value.y = NH;
});


var endClear = false;
function render() {
	// C1 ++ ;
	// if(C1%3000===0){
	// 	active = presets.mitosis;
	// 	clear= 1;
	// } else if(C1%5000===0){
	// 	active = presets.custom;
	// 	clear= 1;
	// }else if(C1%7000===0){
	// 	active = presets.coral;
	// 	clear= 1;
	// }else if(C1%11000===0){
	// 	active = presets.typical;
	// 	clear= 1;
	// }
	requestFrame( render );
	now = new Date().getTime();
	currentTime = (now - startTime) * 0.0001;

	if(!animation_complete){
		mouse.clicked = true;
		mouse.x = animation[animation_step][0] * width;
		mouse.y = animation[animation_step][1] * height;

		bufferMaterial.uniforms.mouse.value.x = mouse.x;
		bufferMaterial.uniforms.mouse.value.y = mouse.y;

		animation_step++;
		if(animation_step == animation.length){
			animation_complete = true;
			mouse.clicked = false;
		}
	}

		bufferMaterial.uniforms.mouse.value.x = mouse.x;
		bufferMaterial.uniforms.mouse.value.y = mouse.y;
	


	bufferMaterial.uniforms.mouse.value.z = mouse.clicked;

	for(var i = 0; i < iterations; i++){
		//Draw to textureB
		renderer.render(bufferScene,camera,textureB,true);

		//Swap textureA and B
		[textureA, textureB] = [textureB, textureA];
		quad.material.map = textureB;
		bufferMaterial.uniforms.bufferTexture.value = textureA;
	}

	// update uniforms
	bufferMaterial.uniforms.time.value = currentTime;

	if(endClear){
		bufferMaterial.uniforms.clear.value = 0;
		clear = 0;
		endClear = false;
	}
	
	if(clear == 1){
		bufferMaterial.uniforms.feed.value = active.f || 0;
		bufferMaterial.uniforms.k.value = active.k || 0;
		bufferMaterial.uniforms.fV.value = active.fV || 0;
		bufferMaterial.uniforms.kV.value = active.kV || 0;
		bufferMaterial.uniforms.drawSize.value = active.s;
		bufferMaterial.uniforms.clear.value = 1;
		endClear = true;
	}
	
	renderer.render( scene, camera );
}


window.requestFrame = (function(){
	return  window.requestAnimationFrame       ||
		window.webkitRequestAnimationFrame ||
		window.mozRequestAnimationFrame    ||
		function( callback ){
		window.setTimeout(callback, 1000 / 60);
	};
})();


var animation = [[0.307797537619699,0.7325],[0.5485636114911081,0.2425]],
    animation_step = 0,
    animation_complete = false;

var optionDivs = document.getElementsByClassName('option');
for(var i = 0; i < optionDivs.length; i++){
	optionDivs[i].addEventListener('click',function(){
		active = presets[this.innerHTML.toLowerCase()];
		clear = 1;
	});
}

render();