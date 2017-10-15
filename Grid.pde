// Game of Life - Grid class
// Marcin Czerwiński

// Written in Processing 3.3.6 (Java)

class Grid
{
  private Cell[][] grid; // Main grid where Cell objects will be

  private int NoRs, NoCs; // Respectively Number of Rows and Number of Columns
  private int size_x, size_y; // Respectively size in axis x and y of cell

  private int generation; // Counter for generation

  private int[] aliveRules = {0, 0, 1, 1, 0, 0, 0, 0, 0}; // Rules that alive cells fol;ow
  private int[] deadRules  = {0, 0, 0, 1, 0, 0, 0, 0, 0}; // Rules that dead cells follow

  private int count = 0, timeOut = 10; // Variables for setting the speed of simulation 
  /* Reason why I've choosen to set variables instead of settign frateRame() is the delay of showing the changes, when placing cells with Left Mouse Key */
  
  int t_col, t_row; // Variables for wrapping effect of the field

  Grid(int nRs, int nCs, int wid, int hei) // Getting number of rows and number of columns as input
  {
    NoRs = nRs;
    NoCs = nCs;

    size_y = hei/NoRs;
    size_x = wid/NoCs;

    grid = new Cell[NoCs][NoRs];
    fillGrid();
  }

  // Fill grid with cells with state = 0
  void fillGrid()
  {
    generation = 0;
    
    for (int i = 0; i < NoCs; i++)
    {
      for (int j = 0; j < NoRs; j++)
      {
        grid[i][j] = new Cell(i, j, size_x, size_y);
      }
    }
  }

  // Simulate the game (changes the states over the time according to neigbours
  void simulate()
  {
    count++; // Adding to count variables
    if (count >= timeOut) // Checking when simulate
    {
      count = 0;
      generation++;
      println("Generation: " + generation);
      for (int i = 0; i < NoCs; i++)
      {
        for (int j = 0; j < NoRs; j++)
        {
          grid[i][j].addNeighbors(countNeighbors(grid[i][j].getGridPosition())); // count the neigbors and add to cells counter of neighbors
        }
      }

      for (int i = 0; i < NoCs; i++)
      {
        for (int j = 0; j < NoRs; j++)
        {
          fateDecide(grid[i][j]);
        }
      }
    }
  }

  // Decide what will happen to this cell
  void fateDecide(Cell c)
  {
    if (c.getState() == 1)
    {
      c.setState(aliveRules[c.getNeighbors()]);
    } else
    {
      c.setState(deadRules[c.getNeighbors()]);
    }
  }
  
  // Conditions to count neighbors
  int countNeighbors(PVector gPos)
  {
    int col = int(gPos.x);
    int row = int(gPos.y);

    int sum = 0;

    sum -= grid[col][row].getState(); // If this cell has state equals 1 then its better to not count itself as neighbor

    for(int i = col -1 ; i <= col +1; i++)
    {
      for(int j = row -1; j <= row +1; j++)
      {
        int t_col = i, t_row = j;
        
        if(t_col < 0)     t_col = NoCs -1;
        if(t_col >= NoCs) t_col = 0;
        if(t_row < 0)     t_row = NoRs -1;
        if(t_row >= NoRs) t_row = 0;
        
        sum += grid[t_col][t_row].getState();
      }
    }
    return sum;
  }

  // Change state of cell to oposite
  void changeState(PVector pos)
  {
    int row = int(pos.y/size_y);
    int col = int(pos.x/size_x);

    if (row < NoRs && col < NoCs)
    {
      grid[col][row].changeState();
    }
  }

  // Displaying grid
  void display()
  {
    for (int i = 0; i < NoCs; i++)
    {
      for (int j = 0; j < NoRs; j++)
      {
        grid[i][j].display();
      }
    }
  }
}