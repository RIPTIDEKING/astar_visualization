void asupdate() {
  // removing current from open set
  for (int i=openS.size()-1; i>=0; i--) {
    if (openS.get(i) == current) {
      openS.remove(i);
      closeS.add(current);
    }
  }

  ArrayList<Integer> neighind;
  neighind = places.connt(current);
  boolean flag = false;
  for (int i=0; i<neighind.size(); i++) {
    flag = false;
    for (int j : closeS) {
      if (j == neighind.get(i)) {
        flag = true;
        break;
      }
    }
    if (flag) {
      continue;
    }
    for (int j : openS ) {
      if (j == neighind.get(i)) {
        flag = true;
        break;
      }
    }
    if (flag) {
      if (places.cty.get(neighind.get(i)).updatefg(places.cty.get(current))) {
        //places.cty.get(neighind.get(i)).pre = current;
      }
      continue;
    }

    places.cty.get(neighind.get(i)).findfg(places.cty.get(current));
    //if (places.cty.get(neighind.get(i)).pre == -1) {
    places.cty.get(neighind.get(i)).pre = current;
    //} else {
    //println("already pre: ",current,neighind.get(i),places.cty.get(neighind.get(i)).pre);
    //println("\n");
    //println(neighind.get(i), "\n");
    //printArray(openS);
    //printArray(closeS);
    //printArray(neighind);

    //  for (int j:closeS) {
    //  if (neighind.get(i) == j) {
    //    flag = true;
    //    println("000000s0s0s0s0s0s00s");
    //    break;
    //  }
    //}

    //  println("\n");
    //}
    openS.add(neighind.get(i));
  }

  int win = openS.get(0);
  for (int i : openS) {
    if (places.cty.get(i).f < places.cty.get(win).f) {
      win = i;
    }
  }
  //places.cty.get(win).pre = current;
  current = win;
  path.add(places.cty.get(current));
}

void drawP(color col) {
  int temp = current;
  int p;
  strokeWeight(6);
  while (places.cty.get(temp).pre != -1) {
    p = places.cty.get(temp).pre;
    stroke(col);
    line(places.cty.get(temp).x, places.cty.get(temp).y, places.cty.get(p).x, places.cty.get(p).y);
    stroke(255,255,0);
    point(places.cty.get(temp).x, places.cty.get(temp).y);
    temp = p;
  }
}

void putpoint(ArrayList<Integer> l, color col) {
  stroke(col);
  strokeWeight(7);
  for (int i : l) {
    point(places.cty.get(i).x, places.cty.get(i).y);
  }
}
