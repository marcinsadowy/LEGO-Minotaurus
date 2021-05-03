// Viser et 960x960 px vindue i skærmens hjørne
void setup() {
  size(960, 960);
  surface.setLocation(0, 0);
}

// Farve og tilladelse, ændres afhængigt af hvad der tegnes
color c;
boolean p;

// Vil bruges til bestemmelse af tur
//int turn = 1;

//String type = "player"; // Vil bruges til type af bevægelse
int steps = 0;  // Angiver antal skridt spilleren kan rykke

void draw() {
  // Laver board til objekt af alle felter
  board = new Tile[cols][rows];

  // Kører rekursivt gennem alle felter
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {

      // Initierer farve og tilladelse (græs)
      c = color(10, 143, 61);
      p = true;

      // Sætter farve og evt. tilladelse for type felt
      
      // Spiller
      if (i == x && j == y) {
        c = color(0, 0, 200);
      }

      // Ramme
      else if (i == 0 || i == 31 || j == 0 || j == 31) {
        c = color(162, 224, 18);
        p = false;
      }

      // Tempel
      else if (i >= 15 && i <= 16 && j >= 15 && j <= 16) {
        c = color(162, 162, 162);
        p = false;
      }

      // Gule baser
      else if (i >= 1 && i <= 2 && j == 1 || 
        i == 1 && j >= 1 && j <= 2 || 
        i >= 14 && i <= 15 && j == 14 || 
        j >= 14 && j <= 15 && i == 14) {
        c = color(255, 225, 0);
        p = false;
      }

      // Røde baser
      else if (i >= 29 && i <= 30 && j == 1 || 
        i == 30 && j >= 1 && j <= 2 || 
        i >= 16 && i <= 17 && j == 14 || 
        j >= 14 && j <= 15 && i == 17) {
        c = color(232, 0, 0);
        p = false;
      }

      // Blå baser
      else if (i >= 1 && i <= 2 && j == 30 || 
        i == 1 && j >= 29 && j <= 30 || 
        i >= 14 && i <= 15 && j == 17 || 
        j >= 16 && j <= 17 && i == 14) {
        c = color(0, 0, 232);
      }

      // Hvide baser
      else if (i >= 29 && i <= 30 && j == 30 || 
        i == 30 && j >= 29 && j <= 30 || 
        i >= 16 && i <= 17 && j == 17 || 
        j >= 16 && j <= 17 && i == 17) {
        c = color(232, 232, 232);
        p = false;
      }

      // Hække
      else if  // L-hæk (vandret)
        (i >= 6 && i <=8 && j == 28 ||
        j >= 27 && j <= 28 && i == 6 ||

        // L-hæk (lodret)
        i >= 13 && i <= 14 && j == 22 || 
        j >= 22 && j <= 24 && i == 14 || 

        // Stor L-hæk
        i >= 9 && i <= 12 && j == 19 || 
        j >= 17 && j <= 19 && i == 9 || 

        // Z-høk
        i >= 9 && i <= 11 && j == 25 || 
        j >= 25 && j <= 28 && i == 11 || 
        i >= 11 && i <= 14 && j == 28 ||

        // U-hæk
        i >= 3 &&i <= 6 && j == 19 ||
        j >= 17 && j <= 19 && i == 3 ||
        j >= 17 && j <= 19 && i == 6 ||

        // I-hæk
        i >= 15 && i <= 16 && j == 19 ||

        // T-hæk
        i >= 3 && i <= 6 && j == 23 ||
        j >= 22 && j <= 24 && i == 6) { 
        c = color(162, 224, 18);
        p = false;
      } else if 
        (i == 3 && j >= 26 && j <= 27 || 
        i >= 9 && i <= 10 && j == 22) {
        c = color(162, 162, 162);
        p = false;
      }

      // Genererer felter og tegner matrix
      board[i][j] = new Tile(i * 30, j * 30, 30, 30, c, p);
      board[i][j].display();
    }
  }

  // Hvis ingen har vundet, tegner terning og tilhørende tekst
  if (!win) {
    fill(100, 100, 100, 128);
    stroke(0, 0, 0, 128);
    strokeWeight(10);
    rect(100, 100, 100, 100, 15);

    textSize(24);
    noStroke();
    strokeWeight(1);
    fill(255, 255, 255, 128);

    if (steps > 0) {
      text("Skridt: " + steps, 105, 235);
      if (steps == 1) {
        circle(150, 150, 20);
      } else if (steps == 2) {
        circle(125, 125, 20);
        circle(175, 175, 20);
      } else if (steps == 3) {
        circle(125, 125, 20);
        circle(150, 150, 20);
        circle(175, 175, 20);
      } else if (steps == 4) {
        circle(125, 125, 20);
        circle(175, 125, 20);
        circle(125, 175, 20);
        circle(175, 175, 20);
      } else if (steps == 5) {
        circle(125, 125, 20);
        circle(175, 125, 20);
        circle(150, 150, 20);
        circle(125, 175, 20);
        circle(175, 175, 20);
      } else if (steps == 6) {
        circle(125, 125, 20);
        circle(175, 125, 20);
        circle(125, 150, 20);
        circle(125, 175, 20);
        circle(175, 175, 20);
        circle(175, 150, 20);
      }
    } else {
      textSize(20);
      text("Tryk på", 113, 142);
      text(" terning", 108, 172);
    }
  }

  hasWon();
}

// Tillader tryk på terning og genstart-knap
void mouseClicked() {
  if (mouseX >=100 && mouseX <= 200 && mouseY >=100 && mouseY <= 200) {
    roll();
  } else if (win && mouseX >= 380 && mouseX <= 580 && mouseY >= 785 && mouseY <= 849) {
    reset ();
  }
}
