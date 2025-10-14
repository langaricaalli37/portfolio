// allison Langarica |25 Sept 2025|Calculator
Button [] buttons =new Button [12];
Button[] numButtons = new Button [10];
float l, r, result;
String dVal;
char op;
boolean left;

void setup() {
  size (230, 280);
  l= 0.0;
  r = 0.0;
  dVal = "0.0";
  op = ' ';
  left = true;

  numButtons [7]= new Button (27, 100, 40, 45, '7', #C64A4A, #FF9595);
  numButtons [4]= new Button (27, 150, 40, 45, '4', #C64A4A, #FF9595);
  numButtons [1]= new Button (27, 200, 40, 45, '1', #C64A4A, #FF9595);
  buttons [0]= new Button (27, 250, 40, 45, '±', #C64A4A, #FF9595);
  numButtons [8]= new Button (70, 100, 40, 45, '8', #C64A4A, #FF9595);
  numButtons [5]= new Button (70, 150, 40, 45, '5', #C64A4A, #FF9595);
  numButtons [2]= new Button (70, 200, 40, 45, '2', #C64A4A, #FF9595);
  numButtons [0]= new Button (70, 250, 40, 45, '0', #C64A4A, #FF9595);
  numButtons [9]= new Button (113, 100, 40, 45, '9', #C64A4A, #FF9595);
  numButtons [6]= new Button (113, 150, 40, 45, '6', #C64A4A, #FF9595);
  numButtons [3]= new Button (113, 200, 40, 45, '3', #C64A4A, #FF9595);
  buttons [1]= new Button (113, 250, 40, 45, '.', #C64A4A, #FF9595);
  buttons [2]= new Button (160, 95, 35, 38, 'π', #E34949, #FF9595);
  buttons [3]= new Button (160, 138, 35, 38, '²', #E34949, #FF9595);
  buttons [4]= new Button (160, 180, 35, 35, 'X', #E34949, #FF9595);
  buttons [5]= new Button (160, 215, 35, 25, '-', #E34949, #FF9595);
  buttons [6]= new Button (160, 252, 35, 35, 'C', #E34949, #FF9595);
  buttons [7]= new Button (200, 95, 35, 38, '√', #E34949, #FF9595);
  buttons [8]= new Button (200, 138, 35, 38, '%', #E34949, #FF9595);
  buttons [9]= new Button (200, 180, 35, 35, '÷', #E34949, #FF9595);
  buttons [10]= new Button (200, 215, 35, 25, '+', #E34949, #FF9595);
  buttons [11]= new Button (200, 252, 35, 35, '=', #E34949, #FF9595);
}

void draw () {
  background(#620808);
  for (int i = 0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed () {
  for (int i = 0; i<buttons.length; i++) {
    if (buttons [i].over && buttons [i].val == '+'){ 
      dVal = "0.0";
      left = false;
      op = '+';
    } else if (buttons[i].over && buttons[i].val == '-') {
      dVal = "0.0";
      left = false;
      op = '-';
    } else if (buttons[i].over && buttons[i].val == 'X') {
      dVal = "0.0";
      left = false;
      op = '*';
    } else if (buttons[i].over && buttons[i].val == '÷') {
      dVal = "0.0";
      left = false;
      op = '/';
    } else if  (buttons [i].over && buttons [i].val == '.') {
      if (dVal.contains(".") == false) {
        dVal +='.';
      }
    } else if (buttons [i].over && buttons [i].val == '=') {
      performCalculation();
    } else if (buttons [i].over && buttons [i].val == '±') {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].over && buttons[i].val == '²') {
      if (left) {
        l = pow(l, 2);
        dVal = str(l);
      } else {
        r = pow(r, 2);
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == '%') {
      if (left) {
        l = l*0.01;
        dVal = str(l);
      } else {
        r = r*0.01;
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons [i].over && buttons [i].val == 'C') {
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0.0";
      op = ' ';
      left = true;
    }
  }



  for (int i = 0; i<numButtons.length; i++) {
    if (dVal.length()<15)
      if (numButtons[i].over && left == true) {
        if (dVal.equals("0.0")) {
          dVal = str(numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          l = float(dVal);
        }
      } else if (numButtons[i].over && left == false) {
        if (dVal.equals("0.0")) {
          dVal = str(numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += str(numButtons[i].val);
          r = float(dVal);
        }
      }
  }
  println("l:" + l);
  println("r:" + r);
  println("result:" + result);
  println("left:" + left);
  println("op:" + op);
}

void updateDisplay () {
  rectMode(CORNER);
  fill(#9D4141);
  rect(5, 5, 220, 55);
  fill(#F5CDCD);
  textSize(50);
  textAlign(RIGHT);
  if (dVal.length()<19) {
    textSize(25);
  } else if (dVal.length()>=9) {
    textSize(23);
  }
  text(dVal, width-20, 55);
}

void performCalculation () {
  r = float(dVal);
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op== 'P') {
    result = pow(l, r);
  } else if (op == 'S') {
    result = sqrt(r);
  }
  dVal = str(result);
  l = result;
  left = true;
}
