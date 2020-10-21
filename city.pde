class City{
  float x;
  float y;
  float f;
  float g = 0;
  float h;
  int pre=-1;
  
  City(float i,float j){
    x = i;
    y = j;
  }
  
  void findh(City cty){
    h = dist(x,y,cty.x,cty.y);
  }
  
  void findfg(City cty){
    g = dist(x,y,cty.x,cty.y) + cty.g;
    f = g+h;
  }
  boolean updatefg(City cty){
    float tg = dist(x,y,cty.x,cty.y) + cty.g;
    boolean ret = tg < g ;
    if(ret){
      f = g+h;
    }
    return ret;
  }
  
}
