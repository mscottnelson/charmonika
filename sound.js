window.onload = init;
var context;
var bufferLoader;

function init() {
  // Fix up prefixing
  window.AudioContext = window.AudioContext || window.webkitAudioContext;
  context = new AudioContext();

  bufferLoader = new BufferLoader(
    context,
    [
      'marim/8.wav',
      'marim/9.wav',
      'marim/10.wav',
      'marim/11.wav',
      'marim/12.wav',
      'marim/13.wav',
      'marim/14.wav',
      'marim/15.wav',
      'marim/16.wav',
      'marim/17.wav',
      'marim/18.wav',
      'marim/19.wav',
      'marim/20.wav',
      'marim/21.wav',
      'marim/22.wav',
      'marim/23.wav',
      'marim/24.wav',
      'marim/25.wav',
      'marim/26.wav',
      'marim/27.wav',
      'marim/28.wav',
      'marim/29.wav',
      'marim/30.wav',
      'marim/31.wav',
      'marim/32.wav',
      'marim/33.wav',
      'marim/34.wav',
      'marim/35.wav',
	  'marim/36.wav',
      'marim/37.wav',
      'marim/38.wav',
      'marim/39.wav',
      'marim/40.wav',
	  'marim/41.wav',
      'marim/42.wav',
      'marim/43.wav',
      'marim/44.wav',
      'marim/45.wav',
    ],
    finishedLoading
    );

//  bufferLoader.load();


}

function finishedLoading(bufferList) {
// Build any 'on-load' function here
}

function playSound(buffer) {
  var source = context.createBufferSource();
  source.buffer = buffer;
  source.connect(context.destination);
  source.start(0);
}

function BufferLoader(context, urlList, callback) {
  this.context = context;
  this.urlList = urlList;
  this.onload = callback;
  this.bufferList = new Array();
  this.loadCount = 0;
}

// A BufferLoader Class!
BufferLoader.prototype.loadBuffer = function(url, index) {
  // Load buffer asynchronously
  var request = new XMLHttpRequest();
  request.open("GET", url, true);
  request.responseType = "arraybuffer";

  var loader = this;

  request.onload = function() {
    // Asynchronously decode the audio file data in request.response
    loader.context.decodeAudioData(
      request.response,
      function(buffer) {
        if (!buffer) {
          alert('error decoding file data: ' + url);
          return;
        }
        loader.bufferList[index] = buffer;
        if (++loader.loadCount == loader.urlList.length)
          loader.onload(loader.bufferList);
      },
      function(error) {
        console.error('decodeAudioData error', error);
      }
    );
  }

  request.onerror = function() {
    alert('BufferLoader: XHR error');
  }

  request.send();
}

BufferLoader.prototype.load = function() {
  for (var i = 0; i < this.urlList.length; ++i)
  this.loadBuffer(this.urlList[i], i);
}
