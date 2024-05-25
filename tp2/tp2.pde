// Rojas Franco



PImage imga, imgb, imgc;
int tam;
int valor;
String texto = "CORALINE";
String texto2 = "Coraline es una película de animación \n en stop-motion de 2009, dirigida \n por Henry Selick, que sigue a una niña \n que encuentra una puerta a un mundo \n alternativo con oscuros secretos.";
float posY = 480;
float posY2 = 0;

String texto3 = "Coraline destaca por su estilo \n visual único  y atmósfera oscura, \n combinando elementos de  fantasía y \n terror. La animación en stop-motion y la  música \n de Bruno Coulais crean una experiencia \n  cautivadora. Se convirtió en un  clásico moderno \n  del cine animado.";

int estado;
int segundos;

void setup() {
  size(640, 480);


  imga = loadImage("imagena.png");
  imgb = loadImage("imagenb.png");
  imgc = loadImage("imagenc.png");


  tam = 40;
  valor = 1;
  estado = 0;
  segundos = 0;


  textSize(40);
}

void draw() {
  background(255);


  if (estado == 0) {

    image(imga, 0, 0);
    float tamTexto = tam * 80 / width;
    float tono = tam * 255 / width;
    if (tam > width || tam < 0) {
      valor = valor * -1;
    }
    tam += valor;
    fill(0, tono, 0);
    textSize(tamTexto);
    textAlign(CENTER);
    text(texto, width/2, height/2);
  } else if (estado == 1) {

    image(imgb, 0, 0);
    fill(255); // Color del texto
    textSize(36);
    textAlign(CENTER);
    text(texto2, width/2, posY);
    posY -= 1;
    if (posY <= height/2) {
      posY = height/2;
    }
  } else if (estado == 2) {

    image(imgc, 0, 0);
    fill(255); // Color del texto
    textSize(16);
    text(texto3, 450, posY2);
    posY2 += 1;


    fill(0, 255, 0);
    rect(270, 400, 100, 50);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Reiniciar", 320, 425);
  }

  if (frameCount % 60 == 0) {
    segundos++;
  }


  if (segundos < 10) {
    estado = 0;
  } else if (segundos < 20) {
    estado = 1;
  } else {
    estado = 2;
  }
}

void mousePressed() {

  if (estado == 2 && mouseX >= 270 && mouseX <= 370 && mouseY >= 400 && mouseY <= 450) {

    estado = 0;
    segundos = 0;
    tam = 40;
    posY = 480;
    posY2 = 0;
  }
}
