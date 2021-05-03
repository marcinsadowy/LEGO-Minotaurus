// Bestemmer om spiller har vundet
boolean win;

// Bestemmer om spiller har vundet
void hasWon () {
  if (x >= 14 && x <= 15 && y == 17 || 
    y >= 16 && y <= 17 && x == 14) {

    win = true;

    // Viser tillykke-tekst og genstart knap med tilhørende tekst 
    textSize(50);
    fill(255, 255, 255, 255);
    text("Tillykke, du har vundet!", 195, 738);

    fill(100, 100, 100, 128);
    stroke(0, 0, 0, 128);
    strokeWeight(10);
    rect(380, 785, 200, 64, 15);
    strokeWeight(1);

    textSize(40);
    fill(255, 255, 255);
    text("Genstart", 396, 830);
  }
}

// Nulstiller spillet
void reset() {
  x = 1;
  y = 30;
  win = false;
  steps = 0;
}
