int h; // Height of the square
int rX, rY; // Position of the square's top-left corner
boolean insideRect; // Flag to indicate if the cursor is inside the rectangle
boolean measurementStarted; // Flag to indicate if the measurement has started
long startTime; // Start time of the measurement

void setup() {
  size(800, 800); // Set the window size
  background(0); // Set the background color to black
  
  h = int(random(10, 70)); // Randomly determine the height
  
  // Calculate the position of the square's top-left corner
  rX = (width - 700) / 2;
  rY = (height - h) / 2;
}

void draw() {
  background(0); // Refresh the background
  
  // Check if the cursor is inside the rectangle
  insideRect = mouseX >= rX && mouseX <= rX + 700 && mouseY >= rY && mouseY <= rY + h;
  
  // Check if the cursor is inside the rectangle from the left edge
  if (insideRect && !measurementStarted && mouseX == rX) {
    measurementStarted = true;
    startTime = millis();
    println("start");
  }
  
  // Check if the cursor goes out of the rectangle from the right end
  if (measurementStarted && mouseX > rX + 700) {
    if (mouseY < rY || mouseY > rY + h) {
      // Cursor goes out of the rectangle from the upper or lower part
      measurementStarted = false;
      println("failure");
    } else {
      // Cursor goes out of the rectangle from the right end
      measurementStarted = false;
      float elapsedTime = (millis() - startTime) / 1000.0;
      println(elapsedTime + "," + h);
    }
  }
  
  // Set the fill color based on whether the cursor is inside the rectangle
  fill(insideRect ? color(255) : color(255, 0, 0));
  
  // Draw the square
  rect(rX, rY, 700, h);
}
