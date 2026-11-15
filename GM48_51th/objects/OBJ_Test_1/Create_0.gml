/// @desc 


self.lhs = new Tensor([ 4, 4 ]);
self.rhs = new Tensor([ 4, 4 ]);
self.dst = new AutoGrad_MatMul(self.lhs, self.rhs, 4);
self.test = new Tensor([ 4, 4 ]);

