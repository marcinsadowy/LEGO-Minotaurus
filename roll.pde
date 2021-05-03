void roll() {
  if (steps == 0 && !win) {
    int udfald = int(random(4)); // Vil være 6 med sort og grå

    switch(udfald) {
    case 0: 
      steps = 3;
      break;
    case 1: 
      steps = 4;
      break;
    case 2: 
      steps = 5;
      break;
    case 3: 
      steps = 6;
      break;

      // Case 4 og 5 vil bruges til sort og gråt udfald
      /*case 4: 
       type = "bull";
       steps = 8;
       break;
       case 5: 
       type = "wall"; // Man vælger to felter..?
       steps = 1000;  // Eller ligesom Tetris? (bevæg, drej, sæt)
       break;         // Oversæt coords ved placering?*/
    }
  }
}
