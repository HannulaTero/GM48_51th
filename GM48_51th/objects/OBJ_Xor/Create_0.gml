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
self.weightA  = new Tensor([ 2, 8 ], true, true);
self.biasA    = new Tensor([ 8 ], true, true);

self.weightB  = new Tensor([ 8, 1 ], true, true);
self.biasB    = new Tensor([ 1 ], true, true);

// Hidden layers.
var _w0 = new AutoGrad_TensorMul(self.input, self.weightA, [ 0 ], [ 0 ]);
var _b0 = new AutoGrad_Add(_w0, self.biasA);
var _a0 = new AutoGrad_Tanh(_b0);

var _w1 = new AutoGrad_MatMul(_a0, self.weightB, 8);
var _b1 = new AutoGrad_Add(_w0, self.biasB);
var _a1 = new AutoGrad_Tanh(_b1);

// Output.
self.output = _a1;

// Target
self.target = new Tensor([ 1 ], true, false);

// Cost
self.difference = new AutoGrad_Sub(self.target, self.output);
self.cost = new AutoGrad_Sqr(self.difference);
