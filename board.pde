// Definerer spillebræt som matrix af felter, sætter antal felter
Tile[][] board;
final int cols = 32;
final int rows = 32;

// Definerer felt
class Tile {
  int x, y;    // Koordinater
  int w, h;    // Størrelse
  int c;       // Farve
  boolean p;   // Tilladelse

  // Konstruerer felt (lokale variable mappes til globale)
  Tile(int X, int Y, int W, int H, color C, boolean P) {
    x = X;
    y = Y;
    w = W;
    h = H;
    c = C;
    p = P;
  }

  // Tegner felt
  void display() {
    stroke(255, 255, 255, 64);
    fill(c);
    rect(x, y, w, h);
  }
}
