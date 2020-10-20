Grid places;
ArrayList<Integer> openS;
ArrayList<Integer> closeS;
int current,goal;
ArrayList<City> path;
void setup(){
  size(900,800);
  background(0);
  openS = new ArrayList<Integer>();
  closeS = new ArrayList<Integer>();
  path = new ArrayList<City>();
  places = new Grid(10,10);
  current = openS.get(0);
  places.cty.get(current).findfg(places.cty.get(current));
  path.add(places.cty.get(current));
}

void draw(){
  background(0);
  places.show();
  while(openS.size() > 0 && current!=goal){
    asupdate();
  }
  drawP();
  //noLoop();
}
