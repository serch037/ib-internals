class Simulation {
  ArrayList<Ant> AntList;
  int simWidth, simHeight, rectWidth, rectHeight, halfWidth, halfHeight;
  PherMap foodpher, homepher;
  AntMap antmap;
  Map objects; 
  int nMousex, nMousey;
  int  xBegin[], yBegin[]; 
  int mode, maxAnts, beginHomeX, beginHomeY,homeWidth, homeHeight,endHomeX,endHomeY; 
  //int[] cobstacle, cant, cpher1, cpher2, chome,cfood;
  int [] cobstacle = {189,195,199};
  //int[] cobstacle = {10111101,11000011,11000111};
  int [] cant = {44, 62, 80};
  int []  cpher1 = {230, 126, 34};
  int []  cpher2 = {39, 174, 96}; 
  int []  chome = {243, 156, 18};
  int[] cfood = {26, 188, 156};
  int alpha;
  color c;
  int beginflag, rectbeginX, rectbeginY,counter;
  int realCount,foodCount;
  int  beginFoodX, beginFoodY,foodWidth, foodHeight,endfoodX,endfoodY, takenFood, totalCorrects, totalIncorrects; 



  Simulation(int x_, int y_, int max_) {
    simWidth = x_;
    simHeight = y_;
    realCount =0; 
    AntList = new ArrayList<Ant>();
    foodpher = new PherMap(x_, y_);
    homepher = new PherMap(x_,y_);
    antmap = new AntMap(x_,y_);
    objects = new Map(x_,y_);
    rectWidth = width/simWidth;
    rectHeight = height/simHeight;
    halfWidth = rectWidth/2;
    halfHeight = rectHeight/2;
    xBegin = new int[simWidth];
    yBegin = new int[simHeight];
    calcBegins();
    maxAnts = max_;
    counter = 0; 
    foodCount =0;
    takenFood =0; 
totalCorrects = 0;
totalIncorrects = 0; 
    beginflag = 10000;
    realCount=0; 
    /*
       homeWidth=6*rectWidth;
       homeHeight=10*rectHeight;
       beginHomeX = xBegin[10];
       beginHomeY = yBegin[10];
       beginflag = 0;

       foodWidth=3*rectWidth;
       foodHeight=5*rectHeight;
       beginFoodX = xBegin[xBegin.length-foodWidth];
       beginFoodY = yBegin[yBegin.length-foodHeight];
     */

    test();
  }
  void test() {
    /*
       foodpher.setValues(5, 5, 50); 
       foodpher.setValues(8, 2, -1);
       foodpher.setValues(7, 2, 50);
       foodpher.setValues(8, 3, -1);
       foodpher.setValues(8, 0, -1);
       foodpher.setValues(7, 0, 50);
       foodpher.setValues(6, 0, -1);
     */
//    homepher.setValues(38, 35, 100); 
//    homepher.setValues(40, 35, 100); 

/*Highway to lower food source
    for(int x= 34*2;x<97-4;x++){
      foodpher.setValues(34*2-1, x, foodpher.MAX-1); 
      homepher.setValues(33*2,x,homepher.MAX-1);
    }
*/

//    objects.setRange(-10,simWidth/3,20+simHeight/3+10,10,10);
//    foodpher.setRange(foodpher.MAX,simWidth/3,20+simHeight/3+10,10,10);
    objects.setRange(10,simWidth/3,simHeight/3,2,2);
    homepher.setRange(homepher.MAX,simWidth/3,simHeight/3,2,2);
    foodpher.setRange(homepher.MAX,simWidth/3,simHeight/3,2,2);//Single
    objects.setRange(-10,simWidth/3+20,simHeight/3,5,5);
    foodpher.setRange(foodpher.MAX,simWidth/3+20,simHeight/3,5,5);

    //Set obstacles
    foodpher.setRange(-1,simWidth/3+10, simHeight/3-10,2,20);
    foodpher.setRange(-1,simWidth/3+10, simHeight/3+10,20,2);
    foodpher.setRange(-1,simWidth/3+10, simHeight/3-10,20,2);
    homepher.setRange(-1,simWidth/3+10, simHeight/3-10,2,20);
    homepher.setRange(-1,simWidth/3+10, simHeight/3+10,20,2);
    homepher.setRange(-1,simWidth/3+10, simHeight/3-10,20,2);
    //objects.printValues();
    //foodpher.printValues();
    for (int x = 0; x<1; x++) {
      //AntList.add( new Ant((int)random(1,simWidth-2), (int)random(1,simHeight-2), simWidth, simHeight, (int) random(0,2)));
      //AntList.add( new Ant((int)random(simWidth/3, simWidth/3+5), (int)random(simHeight/3,simHeight/3+5), simWidth, simHeight, true));
      AntList.add( new Ant(simWidth/3+1, simHeight/3+1, simWidth, simHeight, true));
    }
    //AntList.add( new Ant(1,1, simWidth, simHeight));
    //AntList.add( new Ant(simWidth-1, simHeight-1, simWidth, simHeight));
    println("Finish begin");

  }

  void handleMouse() {
    fill(189,195,199,200);
    rectbeginX = xBegin[binClosest(xBegin, mouseX)];
    //(mouseX/simWidth);
    rectbeginY = yBegin[binClosest(yBegin, mouseY)];
    rect(rectbeginX, rectbeginY, rectWidth, rectHeight);
    noFill();
  }

  int binClosest(int[] arr, int x) {
    int index1 = 0; 
    int index2 = arr.length; 
    int beginlook = 0;
    if (arr[arr.length-1]< x) return arr.length-1;
    while (index1<=index2) {
      beginlook = (index2+index1)/2;
      if ((arr[beginlook] <= x) && (arr[beginlook+1] >x)) {
        return beginlook;
      } else if (arr[beginlook] < x) {
        //println(x," bigger than ", beginlook);
        index1 =beginlook+1;
      } else if (arr[beginlook] > x) {
        //println(x," smaller than ", beginlook);
        index2 =beginlook-1;
      }
    }
    return beginlook;
  }


  void calcBegins() {
    for (int x = 1; x<simWidth; x++) {
      xBegin[x] = xBegin[x-1]+rectWidth;
    }
    for (int x = 1; x<simHeight; x++) {
      yBegin[x] = yBegin[x-1]+rectHeight;
    }
  }

  void updateAntNeigh(Ant a) {
    if (a.is_hungry) {
      foodpher.getNeighbours(a);
    } else {
      foodpher.getNeighbours(a);//SinglePher
      //homepher.getNeighbours(a);
    }
  }

  void mainDisplay() {
    realCount++;
    background(255);
    fill(0);
    updateAllants();
    drawPhero();
    drawAnts();
    homepher.diffuse();
    foodpher.diffuse();
    color s =color(0,0,0,0);
    fill(s);
    handleMouse();
//    println("TOTAL corrects ", totalCorrects, " Total Incorrects ", totalIncorrects, "Ratio: " ,totalCorrects/(totalIncorrects+1));
  }

  void putPheromone(Ant a){
    if (a.is_hungry) {
      a.putPheromone(foodpher, objects, a.locationx, a.locationy);
      //a.putPheromone(homepher, objects, a.locationx,a.locationy);
    } else {
      a.putPheromone(foodpher, objects, a.locationx, a.locationy);//SinglePher
      //a.putPheromone(homepher, objects, a.locationx,a.locationy);
    }
  }

  void updateAllants(){
    counter++;
    noStroke();
    antmap.setAll(0);
    ListIterator<Ant> it = AntList.listIterator();
    while (it.hasNext()){
      if (AntList.isEmpty() == false){
        Ant a = it.next();
        a.life--;
        if (a.life<=0){
          antmap.pointMap[a.locationy][a.locationx]--;
          it.remove();
          //println("AntHasDied Length: ", AntList.size());
          continue;
        }
        checkdir(a);
        updateAntNeigh(a);
        a.move();
        totalCorrects+= a.corrects;
        totalIncorrects+=a.incorrects;
        putPheromone(a);
        antmap.pointMap[a.locationy][a.locationx]++;
        if (a.birthflag >=1 && counter%12 ==0 && AntList.size() < maxAnts){
          counter++;
          a.birthflag--;
          //println("AntISBORN Length: ", AntList.size());
          //for (int x = 0; x<9;x++){
          it.add( new Ant(a.birthx, a.birthy, simWidth, simHeight,true));
          antmap.pointMap[a.locationy][a.locationx]++;
          //}
        }

        if (beginflag>=1 && counter%12 ==0 && AntList.size() < maxAnts){
          //for (int x = 0; x<9;x++){
          beginflag--;    
          counter++;
          it.add( new Ant(simWidth/3+2, simHeight/3+2, simWidth, simHeight, true));
          antmap.pointMap[a.locationy][a.locationx]++;
          counter++;
          it.add( new Ant(simWidth/3+2, simHeight/3+2, simWidth, simHeight, true));
          antmap.pointMap[a.locationy][a.locationx]++;
          println("Step: " , realCount , " Number of ants: ", AntList.size(), " Food collected ", foodCount, " Food taken " , takenFood);
          //}
        }


      }else{
        break;
      }
    }
    /*
       for (Ant a:AntList){

       }
     */
  }

  void checkdir(Ant a){
    if (!(a.is_hungry) && (objects.pointMap[a.locationy][a.locationx] >=9)){
      //println("Change");
      a.is_hungry = true;
      //a.life=a.maxLife*4;
//      if (a.trip ==1 && AntList.size() +50 >maxAnts) a.birthflag=20;
//      a.birthx = a.locationx;
//      a.birthy = a.locationy;
      objects.setAll(0, a.visited);
      a.visited[a.locationy][a.locationx] = 1;
      homepher.pointMap[a.locationy][a.locationx] = homepher.MAX;
      foodpher.pointMap[a.locationy][a.locationx] = foodpher.MAX;//SinglePher
      a.trip =0;
      a.life =0; 
      a.reward = 0.001; 
      a.bonus=0; 
      //a.move(a.lastMove);
      foodCount++;
      println("ChangetoFood ");
    }else if((a.is_hungry) && (objects.pointMap[a.locationy][a.locationx] <=-9)){
      a.is_hungry = false;
      a.life=a.maxLife;
      objects.setAll(0, a.visited);
      a.visited[a.locationy][a.locationx] = 1;
      a.trip = 1;
      foodpher.pointMap[a.locationy][a.locationx] = foodpher.MAX;
      a.reward=10;
      a.exponent = 10;
      a.bonus = 100; 
      takenFood++;
      //a.move(a.lastMove);
      println("ChangetoHome ");
    }


  }

  void drawAnts(){
    for (int rows = 0; rows < simHeight; rows++){ //
      for (int cols = 0; cols < simWidth; cols++){
        if ( (antmap.pointMap[rows][cols]) ==0 ) continue;
        alpha = (int)map((float)antmap.pointMap[rows][cols],1,5, 120,255);
        alpha = 255;
        color c = (alpha<<24) | (cant[0]<<16) | (cant[1]<<16) | (cant[2]<<8);
        fill(c); 
        rect(xBegin[cols],yBegin[rows], rectWidth, rectHeight);
      }
    }
  }


  void drawPhero(){
    for (int rows = 0; rows < simHeight; rows++){
      for (int cols = 0; cols < simWidth; cols++){
       // /*
           alpha = (int)map((float)foodpher.pointMap[rows][cols],foodpher.MIN,foodpher.MAX, 1,255);
           color c = (alpha<<24) | (cpher1[0]<<16) | (cpher1[1]<<16) | (cpher1[2]<<8);
           fill(c);
           if (foodpher.pointMap[rows][cols] >1.1) rect(xBegin[cols],yBegin[rows], rectWidth, rectHeight);
           if (foodpher.pointMap[rows][cols] <=-1){
           c = (255<<24) | (cobstacle[0]<<16) | (cobstacle[1]<<16) | (cobstacle[2]<<8);
           fill(c);
           rect(xBegin[cols],yBegin[rows], rectWidth, rectHeight);
           }

           alpha = (int)map((float)homepher.pointMap[rows][cols],homepher.MIN,homepher.MAX, 1,255);
           c = (alpha<<24) | (cpher2[0]<<16) | (cpher2[1]<<16) | (cpher2[2]<<8);
           fill(c);
           if (homepher.pointMap[rows][cols] >1.1) rect(xBegin[cols],yBegin[rows], rectWidth, rectHeight);
           if (foodpher.pointMap[rows][cols] <=-1){
           c = (255<<24) | (cobstacle[0]<<16) | (cobstacle[1]<<16) | (cobstacle[2]<<8);
           fill(c);
           rect(xBegin[cols],yBegin[rows], rectWidth, rectHeight);

           }
       //  */
        if (objects.pointMap[rows][cols] <=-9){
          c = (255<<24) | (cfood[0]<<16) | (cfood[1]<<16) | (cfood[2]<<8);
          //c = color(cfood[0], cfood[1], cfood[2]);
          fill(c); 
          //println("RECT");
          rect(xBegin[cols],yBegin[rows], rectWidth, rectHeight);
        }

        if (objects.pointMap[rows][cols] >=9){
          c = (255<<24) | (chome[0]<<16) | (chome[1]<<16) | (chome[2]<<8);
          fill(c); 
          //println("RECT");
          rect(xBegin[cols],yBegin[rows], rectWidth, rectHeight);
        }

      }
    }
  }

  void printValues() {
    for (int y = 0; y<simHeight; y++) {
      for (int x = 0; x<simWidth; x++) {
        fill(0, 0, 255);
        //println(xBegin[x]);
        text((float)foodpher.pointMap[y][x], xBegin[x]+halfWidth, yBegin[y]+halfHeight);
        fill(255, 0, 0);
        text((float)homepher.pointMap[y][x], xBegin[x]+halfWidth+15, yBegin[y]+halfHeight+15);
      }
    }
  }

}