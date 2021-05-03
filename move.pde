// Vil bruges til bestemmelse af bevægelse, afhængigt af type
/*void move() {
 if (type == "player") {
 } else if (type == "bull") {
 } else if (type == "wall") {
 }
}*/

// Vil bruges til bestemmelse af tur
/*void turn() {
 if (turn == 4) {
 turn = 1;
 } else {
 turn++;
 }
 }*/

// Sætter spillerens startposition
int x = 1;
int y = 29;

// Incrementer eller decrementer spillers position, når en 
// piletast trykkes, hvis næste felt er ledigt
void keyPressed() {
  //if (greenLight == true) {
  if (steps > 0 && !win)  
    if (keyCode == RIGHT) {
      if (board[x + 1][y].p) {
          x++;
          steps--;
      }
    } else if (keyCode == LEFT) {
      if (board[x - 1][y].p) {
        x--;
        steps--;
      }
    } else if (keyCode == UP) {
      if (board[x][y - 1].p) {
        y--; 
        steps--;
      }
    } else if (keyCode == DOWN) {
      if (board[x][y + 1].p) {
        y++; 
        steps--;
      }
    }
}
