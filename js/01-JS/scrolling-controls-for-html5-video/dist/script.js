var frameNumber = 0, 
    playbackConst =250, 
    setHeight = document.getElementById("set-height"), 
    vid0 = document.getElementById('v0'); 
    vid1 = document.getElementById('v1'); 
		
vid0.addEventListener('loadedmetadata', function() {
  setHeight.style.height = Math.floor(vid0.duration) * playbackConst + "px";
});
vid1.addEventListener('loadedmetadata', function() {
  setHeight.style.height = Math.floor(vid1.duration) * playbackConst + "px";
});


function scrollPlay(){  
  var frameNumber  = window.pageYOffset/playbackConst;
  vid0.currentTime  = frameNumber;
  window.requestAnimationFrame(scrollPlay);
}

window.requestAnimationFrame(scrollPlay);

function scrollPlay2(){  
  var frameNumber  = window.pageYOffset/playbackConst;
  vid1.currentTime  = frameNumber;
  window.requestAnimationFrame(scrollPlay2);
}

window.requestAnimationFrame(scrollPlay2);