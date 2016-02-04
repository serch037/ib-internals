//[rows][collumns] [y,x]
class Map{
  double[][] pointMap; //red map component
  double abstractSize;
  int gridsizeh, gridsizew;

  Map(int gridsizeh_, int gridsizew_){
    pointMap = new double[gridsizeh_][gridsizew_];
    gridsizeh = gridsizeh_;
    gridsizew = gridsizew_;
  }

  void printValues(){
    for (int rows = 0; rows < gridsizeh; rows++){ //
      for (int cols = 0; cols < gridsizew; cols++){
        print(pointMap[rows][cols] +" | ");
      }
      println();
    }
    println();
  }
  void printValues(int[] arr){
    for (int x = 0; x< arr.length; x++){ //
      print(arr[x], " ,");
    }
    println();
  }

    void printValues(double[] arr){
    for (int x = 0; x< arr.length; x++){ //
      print(arr[x], " ,");
    }
    println();
  }

  void setValues(int x, int y, double value){
    pointMap[y][x] = value;
  }


  void setAllsimple(int x, double[] arr){
    for (int rows = 0; rows < arr.length; rows++){
      arr[rows] =-1;
    }
  }

  void setAll(int x){
    for (int rows = 0; rows < gridsizeh; rows++){ //
      for (int cols = 0; cols < gridsizew; cols++){
        pointMap[rows][cols] = x;
      }
    }
  }

  void setAll(int x, int arr[][]){
    for (int rows = 0; rows < gridsizeh; rows++){ //
      for (int cols = 0; cols < gridsizew; cols++){
        arr[rows][cols] = x;
      }
    }
  }


  void setRange(int value, int xlow, int ylow,int  xsize,int ysize){
    for (int rows = ylow; rows < ylow+ysize; rows++){ //
      for (int cols = xlow; cols < xlow+xsize; cols++){
        pointMap[rows][cols] = value;
        //println("Set ",value);
      }
    }
  }

  void getNeighbours(Ant a){
    int y = a.locationy;
    int x = a.locationx; 
    double answer[] = new double[8];
    setAllsimple(-1, answer);
    if (y-1>=0+1 &&   x+1 <gridsizew-1  && a.visited[y-1][x+1] != 1
       ){ answer[0] = pointMap[y-1][x+1];
    }else if (y-1>=0+1 &&   x+1 <gridsizew-1 && a.visited[y-1][x+1] == 1){ answer[0] = -10.0;}

    if (x+1 <gridsizew-1 && a.visited[y][x+1] != 1) {answer[1] = pointMap[y][x+1]; //*1.5;
    }else if (x+1 <gridsizew-1 && a.visited[y][x+1] == 1) {answer[1] = -10.0;}

    if (y+1<gridsizeh-1 &&   x+1 <gridsizew-1 && a.visited[y+1][x+1] != 1) {answer[2] = pointMap[y+1][x+1];
    }else if (y+1<gridsizeh-1 &&   x+1 <gridsizew-1 && a.visited[y+1][x+1] == 1) {answer[2] = -10.0;}

    if (y+1<gridsizeh-1 && a.visited[y+1][x] != 1) {answer[3] = pointMap[y+1][x];//*1.5;
    }else if (y+1<gridsizeh-1 && a.visited[y+1][x] == 1) {answer[3] = -10.0;}

    if (y+1<gridsizeh-1 &&   x-1 >=0+1 && a.visited[y+1][x-1] != 1) {answer[4] = pointMap[y+1][x-1];
    }else if (y+1<gridsizeh-1 &&   x-1 >=0+1 && a.visited[y+1][x-1] == 1) answer[4] =-10.0;

    if (x-1 >=0+1 && a.visited[y][x-1] != 1) {answer[5] = pointMap[y][x-1];//*1.5;
    }else if (x-1 >=0+1 && a.visited[y][x-1] == 1) answer[5] = -10.0;

    if (y-1>=0+1 &&  x-1 >=0+1 && a.visited[y-1][x-1] != 1){ answer[6] = pointMap[y-1][x-1];
    }else if (y-1>=0+1 &&  x-1 >=0+1 && a.visited[y-1][x-1] == 1) answer[6] = -10.0;

    if (y-1>=0+1 && a.visited[y-1][x] != 1) {answer[7] = pointMap[y-1][x];//*1.5;
    }else if (y-1>=0+1 && a.visited[y-1][x] == 1) answer[7] = -10.0;
    
    double max = answer[0];
    int highIndex = 0; 
    for (int z =1;z<answer.length;z++){
      if (max<answer[z]){
        max = answer[z];
        highIndex = z;
      }
    }
    a.highestIndex=highIndex; 
    a.prob=answer;
    a.highestNeighbour = max; 
    //print("ProbONE ");
    //printValues(answer);
  }

}

class AntMap extends Map{
  Ant[][] antmap;
  AntMap(int gridsizeh_, int gridsizew_){
    super(gridsizeh_,gridsizew_);
  }

  void updateMap(ArrayList<Ant> array){
    setAll(0);
    for (Ant ant :array){
      pointMap[ant.locationy][ant.locationx]++;
    }
  }
}

class PherMap extends Map{
  int MIN,MAX;
  int presentMax;
  PherMap(int gridsizeh_, int gridsizew_){
    super(gridsizeh_,gridsizew_);
    for (int rows = 0; rows < gridsizeh; rows++){ //average horizontal
      for (int cols = 0; cols < gridsizew; cols++){
        pointMap[rows][cols]=2;
        if (cols == 0 || cols == gridsizew-1 || rows == 0 || rows == gridsizeh-1)  pointMap[rows][cols]=-1;
      }
    }
    //diffuse(0);
    //Pher_ORIG = new double[gridsizeh_][gridsizew_];
    //Pher_DIFF = new double[gridsizeh_][gridsizew_];
    MIN = 2;
    MAX = 1000;
  }
  void diffuse(){
    for (int rows = 0; rows < gridsizeh; rows++){ //average horizontal
    int box = 9;
      for (int cols = 0; cols < gridsizew; cols++){
        if (pointMap[rows][cols]>MIN && pointMap[rows][cols]<MAX) pointMap[rows][cols] =pointMap[rows][cols]*.999 ;//Evaporation code
        if (pointMap[rows][cols]>MIN && pointMap[rows][cols]<MAX && rows > 1 && cols > 1 && rows < gridsizeh-1 && cols < gridsizew-1){
          double diffQuantity  = pointMap[rows][cols]*.001;
          pointMap[rows][cols]-=diffQuantity;
          double diffperBox = diffQuantity/box; 
          for (int x = cols-1; x<=cols+1;x++){
            if ( pointMap[rows-1][x] >=2 && pointMap[rows-1][x]<MAX ){
              pointMap[rows-1][x] += diffperBox;
            }
            if ( pointMap[rows][x] >=2 && pointMap[rows][x]<MAX ){
              pointMap[rows][x] += diffperBox; 
            }
            if ( pointMap[rows+1][x] >=2 && pointMap[rows+1][x]<MAX ){
              pointMap[rows+1][x] += diffperBox;
            }
          }
        }//Difussion code
        if (pointMap[rows][cols]<MIN && pointMap[rows][cols]>1) pointMap[rows][cols]=MIN;
      }
    }
  }

  void killPath(int visited[][]){
    for (int rows = 0; rows < gridsizeh; rows++){ //
      for (int cols = 0; cols < gridsizew; cols++){
        if (visited[rows][cols] == 1 &&visited[rows][cols]-10 > 1 ) pointMap[rows][cols] =pointMap[rows][cols]-1 ; 
      }
    }
  }
  void printValues(double[][] arr){
    for (int rows = 0; rows < gridsizeh; rows++){ //
      for (int cols = 0; cols < gridsizew; cols++){
        print(arr[rows][cols]+" | ");
      }
      println();
    }
    println();
  }

  void printValues(int[][] arr){
    for (int rows = 0; rows < gridsizeh; rows++){ //
      for (int cols = 0; cols < gridsizew; cols++){
        print(arr[rows][cols]+" | ");
      }
      println();
    }
    println();
  }


  void setValues(int x, int y, double value, double[][] arr){
    arr[y][x] = value;
  }


}