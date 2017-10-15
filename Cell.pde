// Game of Life - Cell class
// Marcin Czerwiński 

// Written in Processing 3.3.6 (Java)

class Cell
{
  private PVector position; // Position of cell
  
  private int w, h; // Respectively width and height of cell
  private int x, y; // Place in [][] array;
  private int neighbors; // Counter for neighbours
  private int state; // State of cell (if is alive or not)
  
  Cell(int _x, int _y, int wid, int hei)
  {
    position = new PVector(_x * wid, _y * hei);
    
    x = _x;
    y = _y;
    
    w = wid;
    h = hei;
    
    state = 0;
    neighbors = 0;
  }
  
  // Adding neighbours to the pool
  void addNeighbors(int add)
  {
    neighbors = 0;
    neighbors += add;
  }
  
  // Returs the count of Neighbors
  int getNeighbors()
  {
    return neighbors;
  }
  
  // Returns the position of Cell
  PVector getGridPosition()
  {
    return new PVector(x, y);
  }
  
  // Returns the state of cell;
  int getState()
  {
    return state;
  }
  
  // Set state of cell to fixed state
  void setState(int i)
  {
    if(i == 0 || i == 1)
    {
      state = i;
    }
  }
  
  // Change state of cell to opposite
  void changeState()
  {
    if(state == 1) state = 0;
    else state = 1;
  }
  
  // Display Cell
  void display()
  {
    if(state == 1) 
    {
      stroke(255);
      fill(0);
    }
    else 
    {
      stroke(0);
      fill(255);
    }
    
    rect(position.x, position.y, w, h);
    
    //For Information only
    //if(state == 0)fill(0);
    //else fill(255);
    //text("Row: " + y + "\nCol: " + x, position.x + 8, position.y + 20);
    //text("Neighbors: " + neighbors, position.x + 8, position.y + 49);
  }
}