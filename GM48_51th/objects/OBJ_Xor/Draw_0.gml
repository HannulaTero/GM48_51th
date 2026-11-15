/// @desc 

if (keyboard_check(ord("Z")) == true)
{
  self.arrInput = [ 
    choose(0, 1), choose(0, 1) 
  ];
  
  self.arrOutput = [ 
    self.arrInput[0] ^^ self.arrInput[1] 
  ];
  
  self.input.ArrayPull(self.arrInput);
  self.target.ArrayPull(self.arrOutput);
  
  self.cost.Forward();
  self.cost.Backward();
  Optimizer(self.cost, 0.001);
  
  self.readInput  = self.input.ArrayPush();
  self.readOutput = self.output.ArrayPush();
  self.readCost   = self.cost.ArrayPush();
}


var _inputSurf = self.input.GetSurface();
var _outputSurf = self.output.GetSurface();


draw_surface_stretched(_inputSurf, 128, 128, 128, 64);
draw_surface_stretched(_outputSurf, 160, 224, 64, 64);


var _i = 0;
var _h = 16;
draw_text(16, 16 + _h * _i++, $"input       : {self.arrInput}");
draw_text(16, 16 + _h * _i++, $"output      : {self.arrOutput}");
draw_text(16, 16 + _h * _i++, $"read input  : {self.readInput}");
draw_text(16, 16 + _h * _i++, $"read output : {self.readOutput}");
draw_text(16, 16 + _h * _i++, $"read cost   : {self.readCost}");









