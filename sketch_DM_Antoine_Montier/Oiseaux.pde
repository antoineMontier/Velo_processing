class Oiseau {
  //(oui ce ne sont pas les plus beaux oiseaux que vous verrez)
  float taille = random(10, 40), vitesse = random(5), x = random(width), y = random(height);
  color couleur = color(random(255), random(255), random(255));

  Oiseau(float taille, float vitesse, float x, float y, color couleur) {
    this.x = x;
    this.y = y;
    this.taille = taille;
    this.vitesse = vitesse;
    this.couleur = couleur;
  }

  void dessiner() {
    //corps
    noStroke();
    fill(couleur);
    quad(x+3*taille/2, y, x, y-taille/4, x-taille/2, y+taille/2, x-taille/2, y +taille);
    //queue
    triangle(x-taille/2, y+taille/2, x-taille/2, y + taille, x - 3*taille/2, y +taille);
    //oeil
    fill(0);
    ellipse(x+taille/3, y + taille/6, taille/10, taille/10);
    //aile
    stroke(0);
    strokeWeight(taille/30);
    fill(couleur + 150);
    triangle(x, y-taille/10, x-taille, y+3*taille/5, x+taille/4, y+taille/3);
  }

  void bouger() {
    x += vitesse;
    if (x > width) {
      x=0;
    }
  }
}
