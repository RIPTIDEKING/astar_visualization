class Grid {
  int rows;
  int clms;
  float w, h;
  ArrayList<City> cty;
  float prob = 1;
  int ctyL;

  Grid(int r, int c) {

    rows =  r;
    clms = c;
    w = (float)width/(clms+1);
    h = (float)height/(rows+1);
    cty = new ArrayList<City>();


    for (int i=1; i<=clms; i++) {
      for (int j=1; j<=rows; j++) {
        if (random(1)<=prob) {
          float tw, th;
          int frac = 11;
          int mult = 5;
          tw = map(random(1), 0, 1, -mult*w/frac, mult*w/frac);
          th = map(random(1), 0, 1, -mult*h/frac, mult*h/frac);
          cty.add(new City(i*w+tw, j*h+th));
        }
      }
    }
    
    ctyL = cty.size();
    openS.add(0);
    goal = ctyL-1;
    // setting heuristic
    for(int i=0;i<ctyL; i++){
      cty.get(i).findh(cty.get(ctyL-1));
    }
    
    
    
  }

  void show() {
    //fill(255);
    strokeWeight(6);
    stroke(0, 255, 0);
    point(cty.get(0).x, cty.get(0).y);
    stroke(255);
    for (int i=1; i<ctyL-1; i++) {
      point(cty.get(i).x, cty.get(i).y);
    }
    stroke(255, 0, 0);
    point(cty.get(ctyL-1).x, cty.get(ctyL-1).y);
    stroke(255);
    strokeWeight(1);
    //drawP();
  }

  ArrayList<Integer> connt(int ind) {
    ArrayList<Integer> con = new ArrayList<Integer>();
    int i, j, ni, nj;
    j = ind/clms;
    i = ind - (j*clms);
    if (i < clms-1) {
      ni = i+1;
      nj = j;
      con.add(ni+nj*clms);
    }
    if (i < clms-1 && j < rows-1) {
      ni = i+1;
      nj = j+1;
      con.add(ni+nj*clms);
    }
    if (j < rows-1) {
      ni = i;
      nj = j+1;
      con.add(ni+nj*clms);
    }
    if (i > 0 && j < rows-1) {
      ni = i-1;
      nj = j+1;
      con.add(ni+nj*clms);
    }
    return con;
  }

  void drawL() {
    ArrayList<Integer> temp;
    for (int i=0; i<ctyL; i++) {
      temp = connt(i);
      for (int j=0; j<temp.size(); j++) {
        line(cty.get(i).x, cty.get(i).y, cty.get(temp.get(j)).x, cty.get(temp.get(j)).y);
      }
    }
  }
}
