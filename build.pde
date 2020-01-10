import hype.*;
import hype.extended.colorist.HColorPool;
import hype.extended.layout.HGridLayout;

int myStageW = 600;
int myStageH = 600;

color clrBG = #202020;

HDrawablePool pool;
HColorPool colors;

// *************************************************************************************************************

void settings() {
	size(myStageW,myStageH);
}

void setup(){
	H.init(this).background(clrBG);

	colors = new HColorPool(#FFFFFF, #6BB251, #45FF00, #333333, #B2009E, #00616f, #FF00E2, #40A819);

	pool = new HDrawablePool(324);
	pool.autoAddToStage()
		.add(new HShape("svg1.svg"))
		.add(new HShape("svg2.svg"))
		.add(new HShape("svg4.svg"))
		.add(new HShape("svg5.svg"))
		.add(new HShape("svg6.svg"))

		.layout(
			new HGridLayout()
			.startX(30)
			.startY(30)
			.spacing(30,30)
			.cols(18)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.strokeJoin(ROUND)
						.strokeCap(ROUND)
						.strokeWeight(1)
						.size(30,30)
						.stroke(#000000)
						//.anchorAt(H.CENTER)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	saveHiRes(2);
	noLoop();
}
 
void draw() {
	H.drawStage();
}

void saveHiRes(int scaleFactor) {
	PGraphics hires = createGraphics(width*scaleFactor, height*scaleFactor, JAVA2D);

	beginRecord(hires);
	hires.scale(scaleFactor);

	if (hires == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(hires, false, 1); // PGraphics, uses3D, alpha
	}

	endRecord();
}