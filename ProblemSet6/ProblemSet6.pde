button cs = new button(200, 200, color(255, 0, 0), "Caesar Cipher");
button csd = new button(200, 400, color(255, 0, 0), "Decrypt Caesar");
button vg = new button(500, 200, color(255, 0, 0), "Vigenere Cipher");
button vgd = new button(500, 400, color(255, 0, 0), "Decrypt Vigenere");
button csc = new button(601, 300, color(0, 255, 0), "Continue");
button reset = new button(601, 400, color(0, 0, 255), "Reset");
button quiz = new button(350, 100, color(255, 255, 0), "quiz");
boolean startScreen = true;
boolean caesar = false;
boolean decryptc = false;
boolean vigenere = false;
boolean decryptv = false;
boolean test = false;
String input = "";
String input2 = "";
String shift1 = "";
int state = 0;
void setup() {
  size(800, 600);
}
void draw() {
  background(255);
  if (startScreen == true) {
    cs.drawButton();
    csd.drawButton();
    vg.drawButton();
    vgd.drawButton();
    quiz.drawButton();
  }
  if (startScreen == false) {
    csc.drawButton();
    reset.drawButton();
  }
  if (caesar == true) {
    if (state == 0) {
      fill(0);
      text ("Enter the word you want to encrypt \n"+input, 300, 200);
    }
    if (state == 1) {
      text ("Enter the shift \n"+shift1, 300, 400);
    }
    if (state == 2) {
      text("Here is the Result \n"+caesarCipher(input), 300, 300);
    }
  }
  if (decryptc == true) {
    if (state == 0) {
      text ("Enter the word you want to decrypt \n"+input, 300, 200);
    }
    if (state == 1) {
      text ("Enter the shift \n"+shift1, 300, 400);
    }
  }
  if (state == 2 && decryptc == true) {
    text("Here is the Result \n"+decryptcc(input), 300, 300);
  }
  if (vigenere == true) {
    if (state == 0) {
      text ("Enter the word you want to encrypt \n"+input, 300, 200);
    }
    if (state == 1) {
      text("Enter the Keyword \n"+input2, 300, 400);
    }
    if (state == 2) {
      text("Here is the result \n"+vigenereCipher(input, input2), 300, 300);
    }
  }
  if (decryptv == true) {
    if (state == 0) {
      text("Enter the word you want to decrypt \n"+input, 300, 200);
    }
    if (state == 1) {
      text("enter the keyword \n"+input2, 300, 400);
    }
    if (state == 2) {
      text("here is the result \n"+decryptvg(input, input2), 300, 300);
    }
  }
  test();
}

String caesarCipher(String s) {
  int shift = int(shift1);
  String cipherText = "";
  for (int i = 0; i < s.length(); i++) {
    int k = int(s.charAt(i));
    if (k >=97 && k<=122) {
      cipherText += char((s.charAt(i) + shift-97)%26+97);
    }
    if (k >= 65 && k <= 90) {
      cipherText += char((s.charAt(i) + shift-65)%26+65);
    }
  }
  return(cipherText);
}
String decryptcc(String s) {
  int shift = int(shift1);
  String plainText = "";
  for (int i = 0; i < s.length(); i++) {
    int k = int(s.charAt(i));
    if (k >= 97 && k <= 122) {
      k -= shift;
      if (k<97) {
        k += 26;
      }
      plainText += char((k-97)%26+97);
    }
    if (k >= 65 && k <= 90) {
      k-= shift;
      if (k < 65) {
        k+= 26;
      }
      plainText +=char((k-65)%26+65);
    }
  }
  return(plainText);
}
String vigenereCipher(String s, String a) {
  String cipherText = "";
  for (int i = 0; i < s.length(); i++) {
    int k = int(s.charAt(i));
    if (k >= 97 && k <= 122) {
      int b = int(s.charAt(i));
      b += int(a.charAt(i) - 96) % 26;
      if (b>122) {
        b -= 26;
      }
      cipherText += char(b);
    }
    if (k >= 65 && k <=90) {
      int b = int(s.charAt(i));
      b += (a.charAt(i) - 64) % 26;
      if (b>90) {
        b -= 26;
      }
      cipherText += char(b);
    }
  }
  return(cipherText);
}
String decryptvg(String s, String a) {
  String plainText = "";
  for (int i = 0; i < s.length(); i++) {
    int k = int(s.charAt(i));
    if (k >= 97 && k <= 122) {
      int b = int(s.charAt(i));
      b -= int(a.charAt(i) - 96) % 26;
      if (b<97) {
        b += 26;
      }
      plainText += char(b);
    }
    if (k >= 65 && k <=90) {
      int b = int(s.charAt(i));
      b -= (a.charAt(i) - 64) % 26;
      if (b<65) {
        b += 26;
      }
      plainText += char(b);
    }
  }
  return(plainText);
}
void test() {
  if (test == true) {
    startScreen = false;
    textAlign(CENTER);
    text("Use the Ceaser Cipher to produce this word \n secret", 300, 100);
    if (state == 0) {
      text ("Enter the word you want to encrypt \n"+input, 300, 200);
    }
    if (state == 1) {
      text ("Enter the shift \n"+shift1, 300, 400);
    }
    if (state == 2) {
      text("Here is the Result \n"+caesarCipher(input), 300, 300);
        if (caesarCipher(input).equals("secret")) {
        fill(255, 0, 0);
        text("You did it!", 300, 500);
      }
    }
  }
}
void mousePressed() {
  if (mouseX>cs.x && mouseX<cs.x+100 && mouseY>cs.y && mouseY<cs.y+50) {
    caesar = true;
    startScreen = false;
  }
  if (mouseX>csd.x && mouseX<csd.x+100 && mouseY>csd.y && mouseY<csd.y+50) {
    decryptc = true;
    startScreen = false;
  }
  if (mouseX>vg.x && mouseX<vg.x+100 && mouseY>vg.y && mouseY<vg.y+50) {
    vigenere = true;
    startScreen = false;
  }
  if (mouseX>vgd.x && mouseX<vgd.x+100 && mouseY>vgd.y && mouseY<vgd.y+50) {
    decryptv = true;
    startScreen = false;
  }
  if (mouseX>vgd.x && mouseX<vgd.x+100 && mouseY>vgd.y && mouseY<vgd.y+50) {
    decryptv = true;
    startScreen = false;
  }
  if (mouseX>csc.x && mouseX<csc.x+100 && mouseY>csc.y && mouseY<csc.y+50) {
    state++;
  }
  if (mouseX>quiz.x && mouseX<quiz.x+100 && mouseY>quiz.y && mouseY<quiz.y+50) {
    test = true;
  }
  if (mouseX>reset.x && mouseX<reset.x+100 && mouseY>reset.y && mouseY<reset.y+50) {
    state = 0;
    startScreen = true;
    caesar = false;
    decryptc = false;
    vigenere = false;
    decryptv = false;
    test = false;
    input = "";
    shift1 = "";
    input2 = "";
  }
}
void keyPressed() {
  if (state == 0) {
    input += key;
  }
  if (state == 1 && (caesar || decryptc || test == true)) {
    shift1 += key;
  }
  if (state == 1 && (vigenere || decryptv == true)) {
    input2 += key;
  }
}
