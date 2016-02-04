import java.util.*; 
Simulation sim;
char mode ='1'; 
Random rn = new Random();
void setup(){
  size(750,750);
  sim = new Simulation(250,250,100);
}

void draw(){
  //if(frameCount%2 ==0 ){
  sim.mainDisplay();
  //println("Value ", sim.foodpher.pointMap[38][32]);
  //println(frameRate);
  //sim.updateAllants();
  //}
}
void keyPressed(){
  switch(key){
    case 'u':
      //sim.foodpher.diffuse(2);f
      //foodpher.diffuse(28);
      //sim.foodpher.printValues();
      sim.foodpher.setRange(100,sim.simWidth/3,sim.simHeight/3+5,3,3);
      println('u');

      break;
    case 'n':
      //sim.foodpher.diffuse(2);
      //foodpher.diffuse(28);
      //sim.foodpher.printValues();
      sim.foodpher.setRange(100,sim.simWidth/3,sim.simHeight/3+5,3,3);
      println('u');
      break;
  }
}

void keyReleased(){
  mode = key;
  println("KEY" ,key); 
}
void mouseDragged(){

  switch (mode){
    case '1': 
      sim.foodpher.pointMap[(28*sim.rectHeight*sim.rectbeginY/sim.simHeight)][28*sim.rectWidth*sim.rectbeginX/sim.simWidth] = -1;
      sim.foodpher.pointMap[(sim.rectHeight*28* sim.rectbeginY/sim.simHeight)+1][(28*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] = -1;
      sim.homepher.pointMap[sim.rectHeight*28* sim.rectbeginY/sim.simHeight][28*sim.rectWidth*sim.rectbeginX/sim.simWidth] = -1;
      sim.homepher.pointMap[(sim.rectHeight*28* sim.rectbeginY/sim.simHeight)+1][(28*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] = -1;
      break;

    case '2': 
      sim.foodpher.pointMap[sim.rectHeight*28*sim.rectbeginY/sim.simHeight][28*sim.rectWidth*sim.rectbeginX/sim.simWidth] = 1;
      sim.foodpher.pointMap[(sim.rectHeight*28* sim.rectbeginY/sim.simHeight)+1][(28*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] = 1;
      sim.homepher.pointMap[sim.rectHeight*28* sim.rectbeginY/sim.simHeight][28*sim.rectWidth*sim.rectbeginX/sim.simWidth] = 1;
      sim.homepher.pointMap[(sim.rectHeight*28* sim.rectbeginY/sim.simHeight)+1][(28*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] = 1;
      break;
    case '3':
      sim.foodpher.pointMap[sim.rectHeight*28*sim.rectbeginY/sim.simHeight][28*sim.rectWidth*sim.rectbeginX/sim.simWidth] = sim.foodpher.MAX;
      sim.foodpher.pointMap[(sim.rectHeight*28* sim.rectbeginY/sim.simHeight)+1][(28*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] = sim.foodpher.MAX;
      sim.homepher.pointMap[sim.rectHeight*28* sim.rectbeginY/sim.simHeight][28*sim.rectWidth*sim.rectbeginX/sim.simWidth] = sim.homepher.MAX;
      sim.homepher.pointMap[(sim.rectHeight*28* sim.rectbeginY/sim.simHeight)+1][(28*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] =sim.homepher.MAX;
      break;
          case '5':
      sim.foodpher.pointMap[sim.rectHeight*2*sim.rectbeginY/sim.simHeight][2*sim.rectWidth*sim.rectbeginX/sim.simWidth] = sim.foodpher.MAX-1;
      sim.foodpher.pointMap[(sim.rectHeight*2* sim.rectbeginY/sim.simHeight)+1][(2*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] = sim.foodpher.MAX-1;
      sim.homepher.pointMap[sim.rectHeight*2* sim.rectbeginY/sim.simHeight][2*sim.rectWidth*sim.rectbeginX/sim.simWidth] = sim.homepher.MAX-1;
      sim.homepher.pointMap[(sim.rectHeight*2* sim.rectbeginY/sim.simHeight)+1][(2*sim.rectWidth*sim.rectbeginX/sim.simWidth)+1] =sim.homepher.MAX-1;
      break;
      
      case '4':
      sim.foodpher.pointMap[sim.rectbeginY/sim.simHeight][sim.rectbeginX/sim.simWidth] = sim.foodpher.MAX;
      sim.foodpher.pointMap[(sim.rectbeginY+1)/sim.simHeight][(sim.rectbeginX+1)/sim.simWidth] = sim.foodpher.MAX;
      sim.homepher.pointMap[sim.rectbeginY/sim.simHeight][sim.rectbeginX/sim.simWidth] = sim.homepher.MAX;
      sim.homepher.pointMap[(sim.rectbeginY+1)/sim.simHeight][(sim.rectbeginX+1)/sim.simWidth] =sim.homepher.MAX;
      break;


  }

  //println("Value ", sim.foodpher.pointMap[sim.rectHeight*2* sim.rectbeginY/sim.simHeight][sim.rectWidth*2*sim.rectbeginX/sim.simWidth]);

  //text(sim.rectbeginY/sim.simHeight,50,50);
  //println("POS ",sim.rectbeginY/sim.simHeight);

  //sim.homepher.pointMap[sim.rectbeginY][sim.rectbeginX/sim.simWidth] = -1;
}