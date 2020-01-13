void drawGrid()
{
  strokeWeight(1);
  for(int i = 0; i < 20; i++)
    for(int j = 0; j < 20; j++)
      Grid[i][j].draw();
}

void mouseDragged()
{
  int r = (int) mouseX / 25;
  int c = (int) mouseY / 25;
  
  if(inRange(r, c))
  {
    if (Grid[r][c] == Start)
        Start = null;
      else if (Grid[r][c] == End)
        End = null;
  
  
    if (mouseButton == LEFT)
    {
      Grid[r][c].isWall = true;
      Grid[r][c].setColour(0, 0, 0);
    }
    else if (mouseButton == RIGHT)
    {
      Grid[r][c].isWall = false;
      Grid[r][c].setColour(255, 255, 255);
    }
  }
}

void mouseClicked()
{
  mouseDragged();
}

void keyPressed()
{
  int r = (int) mouseX / 25;
  int c = (int) mouseY / 25;
  
  if (key == 'c' || key == 'C')
  {
    for(int i = 0; i < 20; i++)
    {
      for(int j = 0; j < 20; j++)
      {
        Grid[i][j].visited = false;
        Grid[i][j].isWall = false;
        Grid[i][j].setColour(255, 255, 255);
      }
    }
    
    Start = null;
    End = null;
  }
  
  if ((key == 'r' || key == 'R') && Start != null & End != null)
  {
    for (int i = 0; i < 20; i++)
      for (int j = 0; j < 20; j++)
      {
        Grid[i][j].visited = false;
        Grid[i][j].neighbours.clear();
      }
        
    
    
    for (int i = 0; i < 20; i++)
    {
      for (int j = 0; j < 20; j++)
      {
        if (Grid[i][j].isWall)
          continue;
        
        if (inRange(i - 1, j))
          if (!Grid[i - 1][j].isWall)
            Grid[i][j].neighbours.add(Grid[i - 1][j]);
          
        if (inRange(i + 1, j))
          if (!Grid[i + 1][j].isWall)
            Grid[i][j].neighbours.add(Grid[i + 1][j]);
        
        if (inRange(i, j - 1))
          if (!Grid[i][j - 1].isWall)
            Grid[i][j].neighbours.add(Grid[i][j - 1]);  
        
        if (inRange(i, j + 1))
          if (!Grid[i][j + 1].isWall)
            Grid[i][j].neighbours.add(Grid[i][j + 1]);   
      }
    }
  }
  
  if(inRange(r, c))
  {
    if (key == 's' || key == 'S')
    {
      if (Start != Grid[r][c])
      {
        if (Start != null)
          Start.setColour(255, 255, 255);
        Start = Grid[r][c];
        Grid[r][c].setColour(56, 217, 99);
      }
    }

    if (key == 'e' || key == 'E')
    {
      if (End != Grid[r][c])
      {
        if (End != null)
          End.setColour(255, 255, 255);
        End = Grid[r][c];
        Grid[r][c].setColour(214, 24, 24);
      }
    }
  }
  
  if ((key == 'p' || key == 'P') && Start != null && End != null)
    Grid[r][c].printNeighbours();
}
