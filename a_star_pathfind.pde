Grid places;
ArrayList<Integer> openS;
ArrayList<Integer> closeS;
int current;
ArrayList<City> path;
int startC = 0 , goal;


void setup(){
  size(900,800);
  background(0);
  //frameRate(1);
  openS = new ArrayList<Integer>();
  closeS = new ArrayList<Integer>();
  path = new ArrayList<City>();
  int gridD = 100;
  places = new Grid(gridD,gridD);
  current = openS.get(0);
  places.cty.get(current).findfg(places.cty.get(current));
  path.add(places.cty.get(current)); 
}


void draw(){
  background(0);
  places.show();
  if(openS.size() > 0 && current!=goal){
    asupdate();
  }
  
  putpoint(openS,color(0,255,0));
  putpoint(closeS,color(255,0,0));
  drawP(color(0,0,255));

}
