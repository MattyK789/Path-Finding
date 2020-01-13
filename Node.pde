class Node
{
  String label = "[null, null]";
  
  ArrayList<Node> neighbours;
  
  boolean isWall = false;
  boolean visited = false;
  
  float x = 0;
  float y = 0;
  
  int r = 255;
  int g = 255;
  int b = 255;
  
  Node(int _x, int _y)
  {
    neighbours = new ArrayList<Node>();
    x = _x * 25 - 1;
    y = _y * 25;
    label = "[" + (int)(x + 1) / 25 + ", " + (int)y / 25 + "]";
  }
  
  void draw()
  {
    fill(r, g, b);
    square(x, y, 25);
  }
  
  void setColour(int _r, int _g, int _b)
  {
     r = _r;
     g = _g;
     b = _b;
  }
  
  void printNeighbours()
  {
    print(label);
    for(int i = 0; i < neighbours.size(); i++)
    {
      print(" -> " + neighbours.get(i).label);
    }
    println("");
  }
}
