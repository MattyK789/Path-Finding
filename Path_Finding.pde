import java.util.ArrayList;

Node[][] Grid;

Node Start = null;
Node End = null;

void setup()
{
  // Canvase setup.
  size(499, 500);
  
  // Grid setup.
  Grid = new Node[20][];
  
  for(int i = 0; i < 20; i++)
      Grid[i] = new Node[20];
  
  for(int i = 0; i < 20; i++)
    for(int j = 0; j < 20; j++)
      Grid[i][j] = new Node(i, j);
}

void draw()
{
  background(255, 255, 255);
  drawGrid();
}
