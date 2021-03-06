// colorwheel_progmem demo for RGBmatrixPanel library.
// Renders a nice circle of hues on a 32x32 RGB LED matrix.
// Uses precomputed image data stored in PROGMEM rather than
// calculating each pixel.  Nearly instantaneous!  Woo!

#include <Adafruit_GFX.h>   // Core graphics library
#include <RGBmatrixPanel.h> // Hardware-specific library
#include "image.h"

#define A   A3
#define B   A2
#define C   A1
#define D   A0
#define CLK 8  // MUST be on PORTB!
#define LAT 9
#define OE  10
RGBmatrixPanel matrix(A, B, C, D, CLK, LAT, OE, false);

void setup() {
  int     i, len;
  uint8_t *ptr = matrix.backBuffer(); // Get address of matrix data

  // Copy image from PROGMEM to matrix buffer:
  memcpy_P(ptr, img, sizeof(img));

  // Start up matrix AFTER data is copied.  The RGBmatrixPanel
  // interrupt code ties up about 40% of the CPU time, so starting
  // it now allows the prior drawing code to run even faster!
  matrix.begin();
}

void loop() {
  // do nothing
}
