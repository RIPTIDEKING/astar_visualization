void asupdate() {

  // removing current from open set
  for (int i=0; i<openS.size(); i++) {
    if (openS.get(i) == current) {
      openS.remove(i);
    }
  }

  ArrayList<Integer> neighind;
  neighind = places.connt(current);
  boolean flag = false;
  for (int i=0; i<neighind.size(); i++) {
    flag = false;
    for (int j=0; j<openS.size(); j++) {
      if (openS.get(j) == neighind.get(i)) {
        flag = true;
        break;
      }
    }
    if (flag) {
      continue;
    }
    for (int j=0; j<closeS.size(); j++) {
      if (closeS.get(j) == neighind.get(i)) {
        flag = true;
        break;
      }
    }
    if (flag) {
      continue;
    }
    openS.add(neighind.get(i));
    places.cty.get(neighind.get(i)).findfg(places.cty.get(current));
  }
  int win = openS.get(0);
  for (int i : openS) {
    if (places.cty.get(i).f < places.cty.get(win).f) {
      win = i;
    }
  }
  closeS.add(current);
  current = win;
  path.add(places.cty.get(current));
}

void drawP() {
  for (int i=0; i<path.size()-1; i++) {
    line(path.get(i).x, path.get(i).y, path.get(i+1).x, path.get(i+1).y);
  }
}
