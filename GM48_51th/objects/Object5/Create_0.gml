/// @desc 


self.lhs = new Tensor([ 2 ]);
self.rhs = new Tensor([ 2 ]);
self.dst = new AutoGrad_Mul(self.lhs, self.rhs);

self.lhs.ArrayPull([ 10, 20 ]);
self.rhs.ArrayPull([ 3, 5 ]);


self.dst.Forward();

self.dst.grad.OpScalarSetOne();
self.dst.Backward();

show_debug_message(self.dst.ArrayPush());
show_debug_message(self.lhs.grad.ArrayPush());
show_debug_message(self.rhs.grad.ArrayPush());