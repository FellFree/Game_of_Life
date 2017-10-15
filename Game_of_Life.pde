// Game of Life
// Marcin Czerwiński

//Written in Processing 3.3.6 (Java)

// Left Mouse for putting the Cells
// Right Mouse for starting/pausing simulation
// Middle Mouse (Wheel) for resetting the Grid (start over)

// In Processing console you can see what generation is curretly displaying

PVector mouse; // PVector that keeps the position of mouse
boolean flag; // For start/pause simulation

Grid grid; // Grid

void setup()
{
  size(500, 500);
  
  grid = new Grid(20, 20, width, height); // Making grid
}

void draw()
{
  background(255);
  grid.display();
  if(flag)
  {
    grid.simulate();
  }
}

void mousePressed()
{
  if ( mouseButton == LEFT)
  {
    mouse = new PVector(mouseX, mouseY);
    grid.changeState(mouse);
  }else if(mouseButton == RIGHT)
  {
    if(flag == false) flag = true;
    else flag = false;
  }else if(mouseButton == CENTER)
  {
    grid.fillGrid();
  }
}