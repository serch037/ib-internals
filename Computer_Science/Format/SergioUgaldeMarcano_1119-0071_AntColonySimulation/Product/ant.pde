//Sergio
import java.util.ArrayList;
class Ant {
	boolean is_hungry;
	int locationx;
	int locationy; 
  int lastX,lastY;
	double prob[];
	double putArray[];
	int visited[][];
	int stats[]; 
	//int tabu;
	int next;
	int life,maxLife, birthflag,trip;
	int birthx, birthy,trips;
	int lastMove;
	int  exponent, directionIndex, lastXbigger, highestIndex; 
	double reward, highestNeighbour;
  int corrects, incorrects, bonus;

	Ant(int x, int y, int xwidth, int yheight, boolean hung){
		locationx = x;
		locationy = y;
		prob = new double[8];
		is_hungry = hung;
		visited = new int[yheight][xwidth];
		//    visited[locationy][locationx] = 1;
		maxLife =600;
		life = maxLife;
		birthflag = 0; 
		trip =0;
		trips=0;
		reward = 0.001;
		exponent = 02;
		stats = new int[8];
corrects = 0;
incorrects = 0;
bonus =0; 
	}

	void evaluateDirections(){
		double avg = 0;
		int tmpsize = 8;
		for (double m: prob){ //Sum of all probabilities
			if (m <=0) {
				tmpsize--;
			}else{
				avg+=m;
			}
		}
		double oavg = avg;
		//avg = tmpsize/avg;
		//println(oavg);
		//randomDir(createRandom(prob, oavg), prob);
		next = randomDir(createRandom(prob, oavg));

	}

	//Test separately
	//double[] createRandom(double[] p,double oavg){
	double[] createRandom(double[] p,double oavg){
		//ArrayList<double> createRandom(double[] p,double oavg){
		/*
		   int size = (int)(oavg*100)+1;
		//println(size);
		double arr[] = new double[size];
		int index =0; 
		for (int x = 0; x<8;x++){
		for(int y=0; y<(p[x]*100) && index<size; y++, index++){
		if (p[x] >0) arr[index]= p[x]; 
		}
		}
		 */
		//New, space saving function
		double arr1[] = new double[8];
		double accumulator = 0; 
		for (int x = 0; x<8;x++){
			if (p[x] >0){
				arr1[x] = accumulator+ Math.pow(reward + p[x], exponent); 
				accumulator = arr1[x];
				lastXbigger = x; 
			}else{
				p[x] =-1; 
			}
		}
		return arr1;
		//return arr;
		//return newArr;
	}


	void printArr(double[] p){
		for (int x = 0; x<p.length; x++){
			print(p[x], " , ");
		}
		println("\n");
	}
	void printArr(int[] p){
		for (int x = 0; x<p.length; x++){
			print(p[x], " , ");
		}
		println("\n");
	}

	int randomDir(double[]o){//Works with space-saving method
		double r =  (double) (2+ Math.random() * (o[lastXbigger]-2));
		//println("Decision to make ",r, " with highest value of ",o[lastXbigger]); 
		//printArr(o);
		int index = 4; 
		for (int x = 0; x<8; x++){
			if (o[x] <= 0) continue;
			else if (o[x] >= r && o[x] >= 0){
				//printArr(prob);
				//printArr(o);
				//println("Decision ",r, " At " ,x, " with " ,o[x]); 
				return x; 
			}
		}
		//println("Bad Decision ",r, " At " ,index); 
		return index;
	}

	int randomDir(double[]p, double[]o){//OLD, method
		int r = (int)random(0,p.length);
		double x = p[r];
		//println("Random ", r, " Value ",x);
		if (p[r] ==0) return r;
		int index;
		ArrayList<Integer> poss = new ArrayList<Integer>();
		//println(x);
		//index = o.IndexOf(x);

		for(index =0; index<8;index++){
			if(Math.abs(o[index] - x) < 0.001) {
				//println("Value " ,index);
				poss.add(index); 
			}
		}  
		next = poss.get(rn.nextInt(poss.size())); 
		return index;
	}

	int randomDir(ArrayList<Double> p, double[]o){
		int r = (int)random(0,p.size());
		double x = p.get(r);
		//println("Random ", r, " Value ",x);
		if (x == 0) return r;
		int index;
		ArrayList<Integer> poss = new ArrayList<Integer>();
		//println(x);
		//index = o.IndexOf(x);

		for(index =0; index<8;index++){
			if(Math.abs(o[index] - x) < 0.001) {
				//println("Value " ,index);
				poss.add(index); 
			}
		}  
		next = poss.get(rn.nextInt(poss.size())); 
		return index;
	}


	void  move(){
		evaluateDirections();
		lastMove = next; 
		//println("Previous coordinates", locationx," , ", locationy);
          lastX = locationx;
          lastY = locationy; 
		switch (next){
			case 0:
				stats[0]++;

				locationx++;
				locationy--;
				if (visited[locationy][locationx] == 0){ 
corrects++; 				
  	break;
				}
incorrects++;
	       		  retryMove();
				println("loop0");
				//println("Case0");
				break;
			case 1:
				stats[1]++;

				//locationy;
				//println("Case1");
				locationx++;
				if (visited[locationy][locationx] == 0){
corrects++;
  					break;
				}
incorrects++;
			retryMove();
				println("loop1");
				break;
			case 2:
				stats[2]++;
				//println("Case2");
				locationx++;
				locationy++;
				if (visited[locationy][locationx] == 0){
corrects++;
  					break;
				}
incorrects++;
retryMove();
				println("loop2");
				break;
			case 3:
				stats[3]++;
				//locationx;
				//println("Case3");
				locationy++;
				if (visited[locationy][locationx] == 0){
corrects++;
  					break;
				}
incorrects++;
			retryMove();
				println("loop3");
				break;
			case 4:
				stats[4]++;
				//println("Case4");

				locationx--;
				locationy++;
				if (visited[locationy][locationx] == 0){
corrects++;
  					break;
				}
incorrects++;
retryMove();
				//println("loop4");
				break;
			case 5:
				stats[5]++;
				//locationy;
				//println("Case5");
				locationx--;
				if (visited[locationy][locationx] == 0){
corrects++;
  					break;
				}
incorrects++;
		retryMove(); 
				println("loop5");
				break;
			case 6:
				stats[6]++;
				locationx--;
				locationy--;
				if (visited[locationy][locationx] == 0){
corrects++;
  					break;
				}
incorrects++;
			retryMove(); 
				println("loop6");
				break;
			case 7:
				stats[7]++;
				//locationx;

				locationy--;
				if (visited[locationy][locationx] == 0){
corrects++;
  					break;
				}
				println("loop7");
incorrects++;
			retryMove();
				break;
			default:
				life = 0; 
				//printArr(p);
				println("Error, no next point at " ,locationx, " and ", locationy);
				break;
		}
		//print(" at ", locationx, " , ", locationy);
		//println(" Next record\n\n");
		//println("Coordinates ", locationx, " , ", locationy, " moved to " , next);
		//println("Finish"); 
	}

  void  retryMove(){
    locationx = lastX;
    locationy = lastY; 
    if(rn.nextFloat() < 0.25 ){ next = highestIndex;}
    else{
    evaluateDirections();
    }
    switch (next){
      case 0:
        locationx++;
        locationy--;
        break;
      case 1:
        locationx++;
        break;
      case 2:
        locationx++;
        locationy++;
        break;
      case 3:
        locationy++;
        break;
      case 4:
        locationx--;
        locationy++;
        break;
      case 5:
        locationx--;
        break;
      case 6:
        locationx--;
        locationy--;
        break;
      case 7:
        locationy--;
        break;
      default:
        println("Error, no next point at " ,locationx, " and ", locationy);
        break;
    }
  }

	void  move(int position){
		// println("NEXT ",next);
		switch (position){
			case 7:
				locationx++;
				locationy--;
				//println("Case0");
				break;
			case 6:
				locationx++;
				//locationy;
				//println("Case1");
				break;
			case 5:
				locationx++;
				locationy++;
				//println("Case2");
				break;
			case 4:
				//locationx;
				locationy++;
				//println("Case3");
				break;
			case 3:
				locationx--;
				locationy++;
				//println("Case4");
				break;
			case 2:
				locationx--;
				//locationy;
				//println("Case5");
				break;
			case 1:
				locationx++;
				locationy--;
				break;
			case 0:
				//locationx;
				locationy--;
				break;
			default:
				//printArr(p);
				println("Error, no next point at " ,locationx, " and ", locationy);
				break;

		}
		//println("Locationx ", locationx, " Locationy ", locationy);
	}

	void putPheromone(PherMap map, Map object ,int xlocationx, int xlocationy){
		//println(locationy," , ",locationx, " case ", next);
		if (locationy>=map.gridsizeh-1) locationy = map.gridsizeh-2;
		if (locationx>=map.gridsizew-1) locationx = map.gridsizew-2;
		if (locationy <=0 ) locationy= 1;
		if (locationx <=0) locationx= 1;
		visited[xlocationy][xlocationx] = 1;
		//if (map.pointMap[xlocationy][xlocationx] + 150 <=map.MAX && (object.pointMap[xlocationy][xlocationx] ==0)) map.pointMap[xlocationy][xlocationx] =map.pointMap[xlocationy][xlocationx]+150  ;
		if (object.pointMap[xlocationy][xlocationx] >-1 && object.pointMap[xlocationy][xlocationx]<1 && map.pointMap[xlocationy][xlocationx]>=map.MIN) {
			double set = (highestNeighbour-2)-map.pointMap[xlocationy][xlocationx] ;
set=0;		
	if (set >= 1){
set+=bonus; 
  				map.pointMap[xlocationy][xlocationx] += set;
			}
			else map.pointMap[xlocationy][xlocationx]+=(1+bonus);
			if (map.pointMap[xlocationy][xlocationx] >=map.MAX) map.pointMap[xlocationy][xlocationx] = map.MAX-10;
			//println("Set to ",map.pointMap[locationy][locationx], "Max was ", highestNeighbour); 
		}
	}

	}