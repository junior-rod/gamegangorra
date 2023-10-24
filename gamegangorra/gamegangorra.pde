//Imagens
PImage gE, gC, gD, mM, mP, dM, dP, ce;
//Fonte
PFont mw;
//tempo gangorra
int tempoE = 0;
int tempoCE = 0;
int tempoCD = 0;
int tempoD = 0;
//tempo mario
int tempoM = 0;
//tempo Donkey
int tempoO = 0;
//Estados Gangorra
int gEsq = 0;
int gCenD = 1;
int gDir = 2;
int gCenE = 4;
//Estados Mario
int mS = 0;
int mB = 1;
//Estado Donkey
int dS = 0;
int dB = 1;
//Estado Inicial Gangorra
int estadoG = gEsq;
//Estado Inicial Mario
int estadoM = mS;
//estado Inicial Donkey
int estadoD = dS;
//Pontos
int p1 = 0;
int p2 = 0;
void setup() {
  size(500, 500);
  imageMode(CENTER);
  gE = loadImage("gEsquerda1.png");
  gC = loadImage("gCentro1.png");
  gD = loadImage("gDireita1.png");
  mM = loadImage("mMartelando.png");
  mP = loadImage("mParado.png");
  dM = loadImage("dMartelando.png");
  dP = loadImage("dParado.png");
  ce = loadImage("cenario.png");
  mw = createFont("SMW.ttf", 20);
}
void draw() {
  desenhaC();
  MEFg();
  MEFm();
  MEFd();
  desenhaG(estadoG);
  desenhaM(estadoM);
  desenhaD(estadoD);
  pontosM();
  pontosD();
}
void MEFg() {
  if (estadoG == gEsq) {
    tempoE++;
    if (tempoE >=35) {
      tempoE = 0;
      estadoG = gCenD;
    }
  }
  if (estadoG == gCenD) {
    tempoCD++;
    if (tempoCD >=35) {
      tempoCD = 0;
      estadoG = gDir;
    }
  }
  if (estadoG == gDir) {
    tempoD++;
    if (tempoD >=35) {
      tempoD = 0;
      estadoG = gCenE;
    }
  }
  if (estadoG == gCenE) {
    tempoCE++;
    if (tempoCE >=35) {
      tempoCE = 0;
      estadoG = gEsq;
    }
  }
}
void MEFm() {
  if (keyPressed) {
    if (key == ' ') {
      estadoM = mB;
    }
  }
  if (estadoM != mS) {
    tempoM++;
    if (tempoM >= 35) {
      tempoM = 0;
      estadoM = mS;
    }
  }
}
void MEFd() {
  int tempo;
  tempo = int(random(0, 100));
  if (tempo == 25) {
    estadoD = dB;
  }
  if (estadoD != dS) {
    tempoO++;
    if (tempoO >= 35) {
      tempoO = 0;
      estadoD = dS;
    }
  }
}
void pontosM() {
  fill(0);
  textFont(mw);
  text(p1, 375, 200);
  if (estadoG == gDir && estadoM == mB && tempoM == 1) {
    p1++;
  }
}
void pontosD() {
  fill(0);
  text(p2, 100, 200);
  if (estadoG == gEsq && estadoD == dB && tempoO == 1) {
    p2++;
  }
}
void desenhaC() {
  image(ce, 250, 250);
}
void desenhaG(int estado) {
  if (estado == gEsq)
    image(gE, 250, 300);
  if (estado == gCenD)
    image(gC, 250, 300);
  if (estado == gCenE)
    image(gC, 250, 300);
  if (estado == gDir)
    image(gD, 250, 300);
}
void desenhaM(int estado) {
  if (estado == mS)
    image(mP, 400, 325);
  if (estado == mB)
    image(mM, 375, 300);
}
void desenhaD(int estado) {
  if (estado == dS)
    image(dP, 100, 325);
  if (estado == dB)
    image(dM, 100, 325);
}
