/**
 * An application with a basic interactive map. You can zoom and pan the map.
 */

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.providers.*;
UnfoldingMap map;

PImage plane;
PlanePoseEmulator instance;
void setup() {
  size(800, 600);


  // providers:
  //OpenStreetMap.OpenStreetMapProvider()
  //OpenStreetMap.CloudmadeProvider(API KEY, STYLE ID)
  //StamenMapProvider.Toner()
  //Google.GoogleMapProvider()
  //Google.GoogleTerrainProvider()
  //Microsoft.RoadProvider()
  //Microsoft.AerialProvider()
  //Yahoo.RoadProvider()
  //Yahoo.HybridProvider()

  map = new UnfoldingMap(this, new OpenStreetMap.OpenStreetMapProvider());
  map.zoomAndPanTo(new Location(52.5f, 13.4f), 10);
  MapUtils.createDefaultEventDispatcher(this, map);

  plane = loadImage("plane4.png");
  instance = PlanePoseEmulator.getInstance();
}

void draw() {
  tint(255, 255);  // Display at full opacity
  background(100);
  map.draw();
  Location berlinLocation = new Location(52.5, 13.4);
  ScreenPosition posBerlin = map.getScreenPosition(berlinLocation);

  println(posBerlin);
  stroke(20, 20, 20, 100);
  fill(20, 20, 20, 100);

  pushMatrix();
  
  translate(posBerlin.x, posBerlin.y);
  //translate(mouseX,mouseY);
  
  //translate(-plane.width/2.0, -plane.height/2.0);
  rotate(0.1*frameCount);
  tint(255, 255*0.6);  // Display at 0.6 opacity
  imageMode (CENTER); 
  image(plane, 0, 0);
  imageMode (CORNER); 
  popMatrix();
}

