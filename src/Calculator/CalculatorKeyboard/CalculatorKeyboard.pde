// Charles Madsen | Nov7 2023| Calculator
Button[] buttons = new Button[22];
String dVal;
String op;
boolean left;
float r, l, result;

void setup() {
  size(260, 480);
  dVal = "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0;
  result = 0.0;
  buttons[0] = new Button(100, 320, 50, 50, '0', true);
  buttons[1] = new Button(40, 260, 50, 50, '7', true);
  buttons[2] = new Button(100, 260, 50,50, '8', true);
  buttons[3] = new Button(160, 260, 50, 50, '9', true);
  buttons[4] = new Button(40, 200, 50, 50, '4', true);
  buttons[5] = new Button(100, 200, 50, 50, '5', true);
  buttons[6] = new Button(160, 200, 50, 50, '6', true);
  buttons[7] = new Button(40, 140, 50, 50, '1', true);
  buttons[8] = new Button(100, 140, 50, 50, '2', true);
  buttons[9] = new Button(160, 140,50, 50, '3', true);
  buttons[10] = new Button(40, 320, 50, 50, '.', true);
  buttons[11] = new Button(220, 140, 50, 50, '+', false);
  buttons[12] = new Button(220, 200, 50, 50, '-', false);
  buttons[13] = new Button(220, 260, 50, 50, 'x', false);
  buttons[14] = new Button(220, 320, 50, 50, '÷', false);
  buttons[15] = new Button(40, 380, 50, 50, '√', false);
  buttons[16] = new Button(100, 380, 50, 50, '^', false);
  buttons[17] = new Button(100, 440, 50, 50, 'V', false);
  buttons[18] = new Button(160, 320, 50, 50, '±', false);
  buttons[19] = new Button(40, 440, 50, 50, '%', false);
  buttons[20] = new Button(190, 440, 100, 40, 'C', false);
  buttons[21] = new Button(190, 380, 100, 40, '=', false);
}

void draw() {
  background(200, 0, 200);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].hover();
    buttons[i].display();
    updateDisplay();
  }
}

void keyPressed() {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (keyCode == 96 || keyCode == 48) {
    handleEvent('0', true);
  } else if (keyCode == 97 || keyCode == 49) {
    handleEvent('1', true);
  } else if (keyCode == 98 || keyCode == 50) {
    handleEvent('2', true);
  } else if (keyCode == 99 || keyCode == 51) {
    handleEvent('3', true);
  } else if (keyCode == 100 || keyCode == 52) {
    handleEvent('4', true);
  } else if (keyCode == 101 || keyCode == 53) {
    handleEvent('5', true);
  } else if (keyCode == 102 || key == 6) {
    handleEvent('6', true);
  } else if (keyCode == 103 || keyCode == 55) {
    handleEvent('7', true);
  } else if (keyCode == 104 || keyCode == 56) {
    handleEvent('8', true);
  } else if (keyCode == 105 || keyCode == 57) {
    handleEvent('9', true);
  } else if (keyCode == 110 || keyCode == 46) {
    handleEvent('.', true);
  } else if (key == '+' || keyCode == 107) {
    handleEvent('+', false);
  } else if (keyCode == 109 || keyCode == 45) {
    handleEvent('-', false);
  } else if (keyCode == 106 || keyCode == 56) {
    handleEvent('÷', false);
  } else if (keyCode == 111 || keyCode == 47) {
    handleEvent('x', false);
  } else if (key == '^') {
    handleEvent('^', false);
  } else if (keyCode == 83 || keyCode == 81) {
    handleEvent('√', false);
  } else if (keyCode == 65) {
    handleEvent('V', false);
  } else if (keyCode == 53) {
    handleEvent('%', false);
  } else if (keyCode == 80) {
    handleEvent('±', false);
  } else if (keyCode == 67 || keyCode == 8) {
    handleEvent('C', false);
  } else if (key == '=' || keyCode == 10) {
    handleEvent('=', false);
  }
}

void handleEvent(char keyVal, boolean num) {
  if (left && dVal.length() < 14 && num) {
    if (dVal.equals("0") || dVal.equals("0.0") || dVal.equals("-0.0")) {
      dVal = "";
    }
    // Set l to dVal and check length of dVal
    if (keyVal == '.') {
      if (!dVal.contains(".")) {
        dVal += keyVal;
        l = float(dVal);
      }
    } else {
      dVal += keyVal;
      l = float(dVal);
    }
  } else if (!left && dVal.length() < 14 && num) {
    if (dVal.equals("0") || dVal.equals("0.0") || dVal.equals("-0.0")) {
      dVal = "";
    }
    // Set r to dVal and check length of dVal
    if (keyVal == '.') {
      if (!dVal.contains(".")) {
        dVal += keyVal;
        r = float(dVal);
      }
    } else {
      dVal += keyVal;
      r = float(dVal);
    }
  } else if ( !num && keyVal == '+') {
    left = false;
    op = "+";
    dVal = "0";
  } else if ( !num && keyVal == '-') {
    left = false;
    op = "-";
    dVal = "0";
  } else if ( !num && keyVal == 'x') {
    left = false;
    op = "x";
    dVal = "0";
  } else if ( !num && keyVal == '÷') {
    left = false;
    op = "÷";
    dVal = "0";
  } else if ( !num && keyVal == '^') {
    left = false;
    op = "^";
    dVal = "0";
  } else if (!num && keyVal == 'C') {
    clearCalc();
  } else if (!num && keyVal == '=') {
    performCalc();
  } else if (!num && keyVal == '±') {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (!num && keyVal == '√') {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (!num && keyVal == 'V') {
    if (left) {
      l = l * PI/180;
      l = cos(l);
      dVal = str(l);
    } else {
      r = cos(r);
      dVal = str(r);
    }
  } else if (!num && keyVal == '%') {
    if (left) {
      l /= 100;
      dVal = str(l);
    } else {
      r /= 100;
      dVal = str(r);
    }
  }
  printVals();
}

void mousePressed() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].on) {
      handleEvent(buttons[i].text, buttons[i].isNum);
    }
  }
}

void clearCalc() {
  dVal = "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0;
  result = 0.0;
}

void updateDisplay() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, 70, 260, 80, 7);
  fill(0);
  textAlign(LEFT);
  textSize(30);
  text(dVal, 1, 70);
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  } else if (op.equals("^")) {
    result = pow(l, r);
  }
  dVal = str(result);
  l = result;
}

void printVals() {
  println("l:" + l);
  println("r:" + r);
  println("left:" + left);
  println("op:" + op);
  println("result:" + result);
}
