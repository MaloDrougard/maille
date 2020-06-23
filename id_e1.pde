
PImage baseImg, generateImg1, generateImg2, generateImg3;


void setup() {
  
  size(180, 600);  
  baseImg = loadImage("sphere60.jpg");
  generateImg1 = transform(baseImg);  //<>//
  generateImg2 = transform(baseImg); 
  generateImg3 = transform(baseImg); 
 
}


void draw() {
  background(0);
  image(baseImg, 0, 0);  
  image(generateImg1, 0, 60); 
  image(generateImg2, 0, 60+180); 
  image(generateImg3, 0, 60+2*180); 
 
}


PImage transform(PImage baseImg) {
  PImage generateImg = createImage(baseImg.width*3, baseImg.height*3, RGB);
  float baseRedValue, transformedRedValue; 
  PImage temp; 
  for(int i = 0; i < baseImg.height; i++ ){
    for(int j = 0; j < baseImg.width; j++ ){
       baseRedValue = green(baseImg.get(j,i));
       transformedRedValue = map(baseRedValue, 0, 255,0,9) ; 
       temp = create3x3RandomPImage(floor(transformedRedValue), color(255,255,255,255), color(255,0,0,255)); 
       generateImg.set(j*3, i*3, temp); 
    }
  }
  return generateImg; 
}


// Create a image of 3x3 which contains the given number of colored pixel.
// Which pixels are colored is random.
PImage create3x3RandomPImage(int numberOfColoredPixel, color bgColor, color frontColor) {
  PImage img = createImage(3,3,ARGB);
  for (int i = 0; i < img.pixels.length ; i++ ){
     img.pixels[i] = bgColor; 
  }
  
  // create a index to shuffle 
  IntList indexes = new IntList();
  for (int i = 0; i < img.pixels.length ; i++ ){
      indexes.append(i); 
  }
  indexes.shuffle(); 
  
  for (int i = 0; i < numberOfColoredPixel ; i++ ){
      img.pixels[indexes.get(i)] = frontColor; 
  }
  return img; 
}
