class ParametresJeu {
  boolean mort = false;
  int level = 1;
  boolean balleToucheVelo = false;

  void afficherNiveau(int level) {
    textAlign(RIGHT);
    fill(0);
    text("Niveau " + level, width - 20, 20);
  }

  void veloDeces() {
    fill(0);
    text("Game over, vous avez survécu jusqu'au niveau " + level + "en " + millis() / 1000 + " secondes", width - 20, 40);
    noLoop();
    fill(255, 0, 0);
    ellipse(balle.x, balle.y, balle.d*5, balle.d*5);
  }

  //En faisant tester mon jeu à des amis, ils marquaient des jolis scores en liassant le vélo dans un coin, ce qui réduisait sa hitbox :
  void noCheat() {
    if (velo.x < 50 && velo.vitesse == 0 || velo.x - 110 > width -50 && velo.vitesse == 0) {
      velo.vitesse = 1;
    }
  }

  void dessinerArrierePlan() {
    noStroke();
    fill(135, 206, 235);
    quad(0, 0, 0, velo.y+velo.diameter/2, width, velo.y+velo.diameter/2, width, 0);
    horloge.dessiner(width/2, 75, 100, 100, 100);
    for (int i = 0; i < oiseau.length; i ++) {
      oiseau[i].dessiner();
      oiseau[i].bouger();
    }

    //terre/herbe :
    strokeWeight(20);
    stroke(34, 139, 34);
    fill(139, 69, 19);
    //(je mets + et - 20 pour ne pas voir la bordure verte sur les cotés gauche/ droit/ dessous)
    quad(-20, velo.y + velo.diameter/2, -20, height + 20, width + 20, height + 20, width + 20, velo.y + velo.diameter/2);
    strokeWeight(3);
  }
}
