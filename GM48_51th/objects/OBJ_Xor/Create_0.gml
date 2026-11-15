/// @desc 

// 
self.arrInput = [ 0, 0 ];
  
self.arrOutput = [ 0 ];

self.readInput = [ 0, 0 ];

self.readOutput = [ 0 ];

self.readCost = [ 0 ];


// Input
self.input = new Tensor([ 2 ], false, false);

// Learnables.
self.weightA  = new Tensor([ 2, 10 ], true, true);
self.biasA    = new Tensor([ 10 ], true, true);

self.weightB  = new Tensor([ 10, 1 ], true, true);
self.biasB    = new Tensor([ 1 ], true, true);

// Hidden layers.
var _w0 = new AutoGrad_MatMul(self.input, self.weightA, 2);
var _b0 = new AutoGrad_Add(_w0, self.biasA);
var _a0 = new AutoGrad_Tanh(_b0);

var _w1 = new AutoGrad_MatMul(_a0, self.weightB, 10);
var _b1 = new AutoGrad_Add(_w1, self.biasB);
var _a1 = new AutoGrad_Tanh(_b1);

// Output.
self.output = _a1;

// Target
self.target = new Tensor([ 1 ], true, false);

// Cost
self.difference = new AutoGrad_Sub(self.target, self.output);
self.cost = new AutoGrad_Sqr(self.difference);


self.DrawText = function(_x, _y, _text)
{
  draw_set_color(c_black);
  draw_text(_x - 1, _y + 1, _text);
  draw_text(_x - 1, _y - 1, _text);
  draw_text(_x + 1, _y - 1, _text);
  draw_text(_x + 1, _y + 1, _text);
  
  draw_set_color(c_white);
  draw_text(_x, _y, _text);
};
