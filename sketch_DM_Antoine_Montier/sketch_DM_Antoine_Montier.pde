/* Bonjour à vous,
 je suis Antoine Montier, L1-MISMI- Gr.A2 et voici une présentation de mon code :
 
 Il s'agit d'un vélo avec de nombreuses fonctionalitées accessibles en interagissant avec lui ou en laissant faire les lois de l'aléatoire :
 
 
 interactions :
 
 -flèche droite : le vélo accélère vers la droite
 -flèche gauche : le vélo accélère vers la gauche (plus le vélo va vite, plus les roues varient vers le rouge)
 -flèche haut : le vélo monte
 -flèche bas : le vélo descend (toujours en restant visible dans la fenêtre)
 -alt : active/désactive l'arrière plan
 -Ctrl : active/désactive les petites roues
 -Enter : active/désactive les variations de couleurs rapides du cadre
 -click de la souris : l'ensemble vélo se téléporte sur la souris et continue son mouvement(les 10 premières secondes)
 
 aléatoire :
 le tube de selle (et donc la forme du cadre) a une position aléatoire
 la selle a une taille aléatoire
 
 remarques en + :
 Je me suis appliqué pour faire un code qui est commenté raisonnablement (ni trop ni trop peu).
 Je me suis également concentré pour attribuer aux variables des noms explicites en respectant la règle des majuscules.
 La taille de la fenêtre peut être changée. Cependant, si elle est trop petite, il sera impossible de voir l'ensemble vélo/barre d'énergie en entier.
 
 
 En espérant satisfaire vos critères.
 */

Velo velo ;
Balle balle ;
Horloge horloge;
ParametresJeu parametres;
Oiseau[] oiseau = new Oiseau[100];


void setup() {
  size(1600, 800);
  strokeWeight(3);
  frameRate(60);
  noFill();
  velo = new Velo(0, 2*height/3, 5, 0, 60, random(20, 60), random(2, 10), 150, false, false);
  balle = new Balle(15, random(2*height/3-2*60), 30, 2, 0.8);
  horloge = new Horloge(width/2, 75, 100, 100, 100);
  parametres = new ParametresJeu();
  for (int i = 0; i < oiseau.length; i++) {
    oiseau[i] = new Oiseau(random(10, 20), random(5), random(width), random(height), color(random(255), random(255), random(255)));
  }
}

void mousePressed() {
  //on peut téléporter le vélo sur la souris pendant les 10 premieres secondes (apres ca ne serait plus du jeu) :
  if (millis() < 10000) {
    velo.y = mouseY;
    velo.x = mouseX + velo.tube ;
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    velo.vitesse ++;
  } else if (keyCode == LEFT) {
    velo.vitesse -- ;
  } else if (keyCode == UP) {
    velo.y -= 2;
  } else if (keyCode == DOWN) {
    velo.y += 2;
  }
  velo.vitesse = constrain(velo.vitesse, -50, 50);
  //boutons pour les variables de type "boolean" :
  if (keyCode == CONTROL) {
    velo.petitesRoues = !velo.petitesRoues ;
  }
  if (keyCode == ENTER) {
    velo.pimpMyBike = !velo.pimpMyBike;
  }
}

void draw() {
  background(255);
  parametres.dessinerArrierePlan();
  if (balle.y < velo.y + 1.7*balle.d) {
    balle.dessiner(balle.x, balle.y, balle.d);
    balle.bouger();
  } else {
    //la balle suivante va plus vite et est plus grosse :
    balle.grossir();
  }

  //On dessine le vélo et les roues (+ petites roues si l'expression boléenne est vrai):
  velo.dessiner(velo.x, velo.y, velo.vitesse, velo.diameter, velo.tube, velo.petitesRoues, velo.pimpMyBike);
  velo.avancer();
  velo.dessinerBarreEnergie();
  velo.incrementerEnergie();
  parametres.afficherNiveau(parametres.level);
  parametres.noCheat();
  if (balle.x>velo.x-110 - velo.diameter/2+balle.d/2 && balle.x<velo.x + velo.diameter/2-balle.d/2 && balle.y >velo.y - 40+balle.d/2 && balle.y< velo.y+velo.diameter/2-balle.d/2 && !velo.pimpMyBike) {
    parametres.veloDeces();
  }
}
