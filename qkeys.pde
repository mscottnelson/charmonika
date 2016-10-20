/* @pjs font="Neutra2.otf"; globalKeyEvents="true"; */

PFont myfont = createFont("Neutra2.otf",20);

float oscil, oscil2 = 0;
float period = 60; /* Set speed of oscillator (for animations, etc) */

float screenX = 0; float screenY = 0; /* View shift amount */
int currentPlayer = 1; /* Track whose turn it is */
float windowArea = width * height;

float mouseLocation = {0, 0}; /* The hex coordinate of the mouse */
float mouseXabs, mouseYabs; /* Location of mouse relative to origin (scales when zooming) */

color bgColor = #200E57;
color textC = #FFFFFF;
String lastNote = 'B4';
boolean locked = false; boolean plocked = false;

HexT hArray[][] = new HexT[12][4]; /* Draw the board */

void setup()
{
	if(int(random(2)) == 0){bgColor = #cc6c20;textC=#000000;}else{bgColor = #200E57; textC=#FFFFFF;}
	size(window.innerWidth, window.innerHeight, P2D);
	/*  size(displayWidth, displayHeight, P3D);  <---USE THIS FOR "PURE" (NON-WEB) PROCESSING! */

	smooth();
	textFont(myfont);

	/* Initialize a 'grid' of hexes */
	for(int i=0; i<hArray.length; i++){
		for(int j=0; j<hArray[i].length; j++){
			hArray[i][j] = new HexT(i,j);
		}
	}
	
}

void draw()
{

	
	background(bgColor);
	
	fill(textC);
	text(lastNote, 25, height - 25);
	text("Charmonika v.2", 25, 25);
	text("by Michael Scott-Nelson", 25, 50);
	text("Type or click to play. Number of simultaneous keypresses limited by N-key rollover", 25, 100);
	
	/* center qkeys, track mouse position relative to origin */
	translate(width/6, height/3);
	mouseXabs = (mouseX - width/6);
	mouseYabs = (mouseY - height/3);
	
	/* Zoom  */
	/* Move screen */
	translate(screenX, screenY);
	
	
	pushMatrix();
		noStroke();	
		for(int i=0; i<hArray.length; i++){
			for(int j=0; j<hArray[i].length; j++){
				hArray[i][j].update();
			}
		}
	popMatrix();

	if(locked){
		if(mouseLocation[0] == 0 && mouseLocation[1] == 0){hArray[0][0].activate(0, ''); lastNote = 'A#3';}
		if(mouseLocation[0] == 0 && mouseLocation[1] == 1){hArray[0][1].activate(1, ''); lastNote = 'A3';}
		if(mouseLocation[0] == 0 && mouseLocation[1] == 2){hArray[0][2].activate(2, ''); lastNote = 'B#3';}
		if(mouseLocation[0] == 0 && mouseLocation[1] == 3){hArray[0][3].activate(3, ''); lastNote = 'B3';}
		if(mouseLocation[0] == 1 && mouseLocation[1] == 0){hArray[1][0].activate(3, ''); lastNote = 'B3';}
		if(mouseLocation[0] == 1 && mouseLocation[1] == 1){hArray[1][1].activate(4, ''); lastNote = 'C4';}
		if(mouseLocation[0] == 1 && mouseLocation[1] == 2){hArray[1][2].activate(5, ''); lastNote = 'C#4';}
		if(mouseLocation[0] == 1 && mouseLocation[1] == 3){hArray[1][3].activate(6, ''); lastNote = 'D4';}
		if(mouseLocation[0] == 2 && mouseLocation[1] == 0){hArray[2][0].activate(6, ''); lastNote = 'D4';}
		if(mouseLocation[0] == 2 && mouseLocation[1] == 1){hArray[2][1].activate(7, ''); lastNote = 'D#4';}
		if(mouseLocation[0] == 2 && mouseLocation[1] == 2){hArray[2][2].activate(8, ''); lastNote = 'E4';}
		if(mouseLocation[0] == 2 && mouseLocation[1] == 3){hArray[2][3].activate(9, ''); lastNote = 'F4';}
		if(mouseLocation[0] == 3 && mouseLocation[1] == 0){hArray[3][0].activate(9, ''); lastNote = 'F4';}
		if(mouseLocation[0] == 3 && mouseLocation[1] == 1){hArray[3][1].activate(10, ''); lastNote = 'F#4';}
		if(mouseLocation[0] == 3 && mouseLocation[1] == 2){hArray[3][2].activate(11, ''); lastNote = 'G4';}
		if(mouseLocation[0] == 3 && mouseLocation[1] == 3){hArray[3][3].activate(12, ''); lastNote = 'G#4';}
		if(mouseLocation[0] == 4 && mouseLocation[1] == 0){hArray[4][0].activate(12, ''); lastNote = 'G#4';}
		if(mouseLocation[0] == 4 && mouseLocation[1] == 1){hArray[4][1].activate(13, ''); lastNote = 'A4';}
		if(mouseLocation[0] == 4 && mouseLocation[1] == 2){hArray[4][2].activate(14, ''); lastNote = 'A#4';}
		if(mouseLocation[0] == 4 && mouseLocation[1] == 3){hArray[4][3].activate(15, ''); lastNote = 'B4';}
		if(mouseLocation[0] == 5 && mouseLocation[1] == 0){hArray[5][0].activate(15, ''); lastNote = 'B4';}
		if(mouseLocation[0] == 5 && mouseLocation[1] == 1){hArray[5][1].activate(16, ''); lastNote = 'C5';}
		if(mouseLocation[0] == 5 && mouseLocation[1] == 2){hArray[5][2].activate(17, ''); lastNote = 'C#5';}
		if(mouseLocation[0] == 5 && mouseLocation[1] == 3){hArray[5][3].activate(18, ''); lastNote = 'D5';}
		if(mouseLocation[0] == 6 && mouseLocation[1] == 0){hArray[6][0].activate(18, ''); lastNote = 'D5';}
		if(mouseLocation[0] == 6 && mouseLocation[1] == 1){hArray[6][1].activate(19, ''); lastNote = 'D#5';}
		if(mouseLocation[0] == 6 && mouseLocation[1] == 2){hArray[6][2].activate(20, ''); lastNote = 'E5';}
		if(mouseLocation[0] == 6 && mouseLocation[1] == 3){hArray[6][3].activate(21, ''); lastNote = 'F5';}
		if(mouseLocation[0] == 7 && mouseLocation[1] == 0){hArray[7][0].activate(21, ''); lastNote = 'F5';}
		if(mouseLocation[0] == 7 && mouseLocation[1] == 1){hArray[7][1].activate(22, ''); lastNote = 'F#5';}
		if(mouseLocation[0] == 7 && mouseLocation[1] == 2){hArray[7][2].activate(23, ''); lastNote = 'G5';}
		if(mouseLocation[0] == 7 && mouseLocation[1] == 3){hArray[7][3].activate(24, ''); lastNote = 'G#5';}
		if(mouseLocation[0] == 8 && mouseLocation[1] == 0){hArray[8][0].activate(24, ''); lastNote = 'G#5';}
		if(mouseLocation[0] == 8 && mouseLocation[1] == 1){hArray[8][1].activate(25, ''); lastNote = 'A5';}
		if(mouseLocation[0] == 8 && mouseLocation[1] == 2){hArray[8][2].activate(26, ''); lastNote = 'A#5';}
		if(mouseLocation[0] == 8 && mouseLocation[1] == 3){hArray[8][3].activate(27, ''); lastNote = 'B5';}
		if(mouseLocation[0] == 9 && mouseLocation[1] == 0){hArray[9][0].activate(27, ''); lastNote = 'B5';}
		if(mouseLocation[0] == 9 && mouseLocation[1] == 1){hArray[9][1].activate(28, ''); lastNote = 'C6';}
		if(mouseLocation[0] == 9 && mouseLocation[1] == 2){hArray[9][2].activate(29, ''); lastNote = 'C#6';}
		if(mouseLocation[0] == 9 && mouseLocation[1] == 3){hArray[9][3].activate(30, ''); lastNote = 'D6';}
		if(mouseLocation[0] == 10 && mouseLocation[1] == 0){hArray[10][0].activate(30, ''); lastNote = 'D6';}
		if(mouseLocation[0] == 10 && mouseLocation[1] == 1){hArray[10][1].activate(31, ''); lastNote = 'D#6';}
		if(mouseLocation[0] == 10 && mouseLocation[1] == 2){hArray[10][2].activate(32, ''); lastNote = 'E6';}
		if(mouseLocation[0] == 11 && mouseLocation[1] == 0){hArray[11][0].activate(33, ''); lastNote = 'F6';}
		if(mouseLocation[0] == 11 && mouseLocation[1] == 1){hArray[11][1].activate(34, ''); lastNote = 'F#6';}
		}
	}

/* The HexT class is for drawing the Hex tiles and maintaining info about the tile */

class HexT{
	float xOff, yOff, zOff, hxPos, hyPos, active = -1, blackKey = 0, recentClk = 0, kOffset = 0;
	String key = '';
	/* hxPos and hyPos are the "Hex" coordinates
		Thus, (0,0) is the origin, and (1,1) is the next up and to the right.
		Z is the secret "third dimension" used for pathfinding
		xOff and yOff are the absolute pixel coordinates.  */
	HexT (float hx_, float hy_){
		hxPos = hx_;
		hyPos = hy_;
		xOff = hx_ * width/19 + hy_*width/38;
		yOff = hy_ * width/22.4;
		if(hxPos == 0 && hyPos == 0){key = '1'; blackKey = 100; kOffset = 2;}
		if(hxPos == 0 && hyPos == 1){key = 'Q'; kOffset = -3;}
		if(hxPos == 0 && hyPos == 2){key = 'A'; blackKey = 100; kOffset = -1;}
		if(hxPos == 0 && hyPos == 3){key = 'Z'}
		if(hxPos == 1 && hyPos == 0){key = '2'}
		if(hxPos == 1 && hyPos == 1){key = 'W'; kOffset = -4;}
		if(hxPos == 1 && hyPos == 2){key = 'S'; blackKey = 100;}
		if(hxPos == 1 && hyPos == 3){key = 'X'; kOffset = -2;}
		if(hxPos == 2 && hyPos == 0){key = '3'}
		if(hxPos == 2 && hyPos == 1){key = 'E'; blackKey = 100;}
		if(hxPos == 2 && hyPos == 2){key = 'D'}
		if(hxPos == 2 && hyPos == 3){key = 'C'; kOffset = -2;}
		if(hxPos == 3 && hyPos == 0){key = '4'}
		if(hxPos == 3 && hyPos == 1){key = 'R'; blackKey = 100;}
		if(hxPos == 3 && hyPos == 2){key = 'F'}
		if(hxPos == 3 && hyPos == 3){key = 'V'; blackKey = 100; kOffset = -2;}
		if(hxPos == 4 && hyPos == 0){key = '5'; blackKey = 100;}
		if(hxPos == 4 && hyPos == 1){key = 'T'}
		if(hxPos == 4 && hyPos == 2){key = 'G'; blackKey = 100; kOffset = -2;}
		if(hxPos == 4 && hyPos == 3){key = 'B'}
		if(hxPos == 5 && hyPos == 0){key = '6'}
		if(hxPos == 5 && hyPos == 1){key = 'Y'; kOffset = -2;}
		if(hxPos == 5 && hyPos == 2){key = 'H'; blackKey = 100; kOffset = -1;}
		if(hxPos == 5 && hyPos == 3){key = 'N'; kOffset = -2;}
		if(hxPos == 6 && hyPos == 0){key = '7'}
		if(hxPos == 6 && hyPos == 1){key = 'U'; blackKey = 100; kOffset = -1;}
		if(hxPos == 6 && hyPos == 2){key = 'J'}
		if(hxPos == 6 && hyPos == 3){key = 'M'; kOffset = -2;}
		if(hxPos == 7 && hyPos == 0){key = '8'}
		if(hxPos == 7 && hyPos == 1){key = 'I'; blackKey = 100;}
		if(hxPos == 7 && hyPos == 2){key = 'K'; kOffset = -2;}
		if(hxPos == 7 && hyPos == 3){key = '<'; blackKey = 100;}
		if(hxPos == 8 && hyPos == 0){key = '9'; blackKey = 100;}
		if(hxPos == 8 && hyPos == 1){key = 'O'; kOffset = -3;}
		if(hxPos == 8 && hyPos == 2){key = 'L'; blackKey = 100;}
		if(hxPos == 8 && hyPos == 3){key = '>'}
		if(hxPos == 9 && hyPos == 0){key = '0'}
		if(hxPos == 9 && hyPos == 1){key = 'P'}
		if(hxPos == 9 && hyPos == 2){key = ';'; blackKey = 100;}
		if(hxPos == 9 && hyPos == 3){key = '/'}
		if(hxPos == 10 && hyPos == 0){key = '-'}
		if(hxPos == 10 && hyPos == 1){key = '['; blackKey = 100;}
		if(hxPos == 10 && hyPos == 2){key = '\"'}
		if(hxPos == 11 && hyPos == 0){key = '+'}
		if(hxPos == 11 && hyPos == 1){key = ']'; blackKey = 100;}
		}

	void update(){
		/* Draw the hex, but exclude tiles for shift and return */
		if((hxPos == 10 && hyPos == 3) || (hxPos == 11 && hyPos == 2) || (hxPos == 11 && hyPos == 3)){} 
		else {
			pushMatrix();
			translate(xOff+active/6,yOff-active/6);
			fill(color(255,255,255,60));
			text(key, -width/420+kOffset, height/175);
			rotate(active);
			fill(color(255-blackKey,255-blackKey,255-blackKey,-active*4+100));
			if(active < -1){	
				active++;
			}
			beginShape();{
				vertex(width/38, width/67.2);
				vertex(0, width/33.6);
				vertex(-width/38, width/67.2);
				vertex(-width/38, -width/67.2);
				vertex(0, -width/33.6);
				vertex(width/38, -width/67.2);
				}endShape(CLOSE);
			popMatrix();
			}
			
			/* Determine if the current hex contains the mouse,
			set the mouseLocation to the hex (BEWARE, MAY BE SENDING DOUBLE VALUES!) */
			if(mouseXabs > xOff - width/38 && mouseXabs < xOff + width/38){
				if(mouseYabs > yOff - width/67.2 && mouseYabs < yOff + width/67.2){
					mouseLocation = {hxPos, hyPos};
				}
			}
		}
	
	void activate(i, k){
		if(active > -59){
			active = -60;
		//	playSound(bufferLoader.bufferList[i]);
			// key = k; <--updates display to show key pressed. Currently unused!
			}
		}
		
	void activateSilent(i, k){
		if(active > -59){
			active = active-10;
			}
		}
		
}

void keyPressed() {
	if(key == 49 || key == 33){hArray[0][0].activate(0, key); lastNote = 'A#3';}
	if(key == 81 || key == 113){hArray[0][1].activate(1, key); lastNote = 'A3';}
	if(key == 65 || key == 97){hArray[0][2].activate(2, key); lastNote = 'B#3';}
	if(key == 50 || key == 64){hArray[0][3].activateSilent(3, key); hArray[1][0].activate(3, key); lastNote = 'B3';}
	if(key == 90 || key == 122){hArray[0][3].activate(3, key); hArray[1][0].activateSilent(3, key); lastNote = 'B3';}
	if(key == 87 || key == 119){hArray[1][1].activate(4, key); lastNote = 'C4';}
	if(key == 83 || key == 115){hArray[1][2].activate(5, key); lastNote = 'C#4';}
	if(key == 88 || key == 120){hArray[1][3].activate(6, key); hArray[2][0].activateSilent(6, key); lastNote = 'D4';}
	if(key == 51 || key == 35){hArray[2][0].activate(6, key); hArray[1][3].activateSilent(6, key); lastNote = 'D4';}
	if(key == 69 || key == 101){hArray[2][1].activate(7, key); lastNote = 'D#4';}
	if(key == 68 || key == 100){hArray[2][2].activate(8, key); lastNote = 'E4';}
	if(key == 67 || key == 99){hArray[2][3].activate(9, key); hArray[3][0].activateSilent(9, key); lastNote = 'F4';}
	if(key == 52 || key == 36){hArray[3][0].activate(9, key); hArray[2][3].activateSilent(9, key); lastNote = 'F4';}
	if(key == 82 || key == 114){hArray[3][1].activate(10, key); lastNote = 'F#4';}
	if(key == 70 || key == 102){hArray[3][2].activate(11, key); lastNote = 'G4';}
	if(key == 86 || key == 118){hArray[3][3].activate(12, key); hArray[4][0].activateSilent(12, key); lastNote = 'G#4';}
	if(key == 53 || key == 37){hArray[4][0].activate(12, key); hArray[3][3].activateSilent(12, key); lastNote = 'G#4';}
	if(key == 84 || key == 116){hArray[4][1].activate(13, key); lastNote = 'A4';}
	if(key == 71 || key == 103){hArray[4][2].activate(14, key); lastNote = 'A#4';}
	if(key == 66 || key == 98){hArray[4][3].activate(15, key); hArray[5][0].activateSilent(15, key); lastNote = 'B4';}
	if(key == 54 || key == 94){hArray[5][0].activate(15, key); hArray[4][3].activateSilent(15, key); lastNote = 'B4';}
	if(key == 89 || key == 121){hArray[5][1].activate(16, key); lastNote = 'C5';}
	if(key == 72 || key == 104){hArray[5][2].activate(17, key); lastNote = 'C#5';}
	if(key == 78 || key == 110){hArray[5][3].activate(18, key); hArray[6][0].activateSilent(18, key); lastNote = 'D5';}
	if(key == 55 || key == 38){hArray[6][0].activate(18, key); hArray[5][3].activateSilent(18, key); lastNote = 'D5';}
	if(key == 85 || key == 117){hArray[6][1].activate(19, key); lastNote = 'D#5';}
	if(key == 74 || key == 106){hArray[6][2].activate(20, key); lastNote = 'E5';}
	if(key == 77 || key == 109){hArray[6][3].activate(21, key); hArray[7][0].activateSilent(21, key); lastNote = 'F5';}
	if(key == 56 || key == 42){hArray[7][0].activate(21, key); hArray[6][3].activateSilent(21, key); lastNote = 'F5';}
	if(key == 73 || key == 105){hArray[7][1].activate(22, key); lastNote = 'F#5';}
	if(key == 75 || key == 107){hArray[7][2].activate(23, key); lastNote = 'G5';}
	if(key == ',' || key == 60){hArray[7][3].activate(24, key); hArray[8][0].activateSilent(24, key); lastNote = 'G#5';}
	if(key == 57 || key == 40){hArray[8][0].activate(24, key); hArray[7][3].activateSilent(24, key); lastNote = 'G#5';}
	if(key == 79 || key == 111){hArray[8][1].activate(25, key); lastNote = 'A5';}
	if(key == 76 || key == 108){hArray[8][2].activate(26, key); lastNote = 'A#5';}
	if(key == '.' || key == 62){hArray[8][3].activate(27, key); hArray[9][0].activateSilent(27, key); lastNote = 'B5';}
	if(key == 48 || key == 41){hArray[9][0].activate(27, key); hArray[8][3].activateSilent(27, key); lastNote = 'B5';}
	if(key == 80 || key == 112){hArray[9][1].activate(28, key); lastNote = 'C6';}
	if(key == ';' || key == 58){hArray[9][2].activate(29, key); lastNote = 'C#6';}
	if(key == '/' || key == 63){hArray[9][3].activate(30, key); hArray[10][0].activateSilent(30, key); lastNote = 'D6';}
	if(key == '-' || key == 95){hArray[10][0].activate(30, key); hArray[9][3].activateSilent(30, key); lastNote = 'D6';}
	if(key == '[' || key == '\{'){hArray[10][1].activate(31, key); lastNote = 'D#6';}
	if(key == '\'' || key == 34){hArray[10][2].activate(32, key); lastNote = 'E6';}
	if(key == '=' || key == 43){hArray[11][0].activate(33, key); lastNote = 'F6';}
	if(key == ']' || key == '\}'){hArray[11][1].activate(34, key); lastNote = 'F#6';}				
}

void mousePressed() {
	locked = true;
}

void mouseReleased() {
	locked = false;
}

		
		// ONLY USE THIS SECTION FOR THE WEB
		// putting this javascript function in the processing sketch lets
		// the sketch's values for width and height get updated on resize.
		window.onresize = function() {
			// "canv" is the canvas displaying the Processing program.
			// Make it fill the screen, or the browser window with no sliders:
			var canvElem = document.getElementById("canv");
			var newWidth = document.documentElement.clientWidth;
			var newHeight = document.documentElement.clientHeight;
			canvElem.style.position = "fixed";
			canvElem.setAttribute("width", newWidth);
			canvElem.setAttribute("height", newHeight);
			canvElem.style.top = 0 +"px";
			canvElem.style.left = 0 +"px";
			// size() is Processing, everything else 
			// in this function is javascript
			size(newWidth, newHeight);
			/* Initialize a 'grid' of hexes */
			for(int i=0; i<hArray.length; i++){
				for(int j=0; j<hArray[i].length; j++){
					hArray[i][j] = new HexT(i,j);
				}
			}
		}
