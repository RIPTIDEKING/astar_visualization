class City {
  float x;
  float y;
  float f;
  float g = 0;
  float h;
  int pre=-1;
  boolean obs;
  color wall = color(255);

  City(float i, float j, boolean w) {
    x = i;
    y = j;
    obs = w;
    if(w){
      wall = color(0);
    }
  }

  void findh(City cty) {
    h = dist(x, y, cty.x, cty.y);
  }

  void findfg(City cty) {
    g = dist(x, y, cty.x, cty.y) + cty.g;
    f = g+h;
  }
  boolean updatefg(City cty) {
    float tg = dist(x, y, cty.x, cty.y) + cty.g;
    boolean ret = tg < g ;
    if (ret) {
      f = g+h;
    }
    return ret;
  }
}
