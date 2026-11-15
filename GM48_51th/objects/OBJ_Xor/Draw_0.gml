/// @desc 



// Draw the text.
var _i = 0;
var _h = 19;
draw_set_font(FT_Courier);
DrawText(16, 16 + _h * _i++, $"NEURAL NETWORK WITH GPU (FRAGMENT SHADERS)");
DrawText(16, 16 + _h * _i++, $"---");
DrawText(16, 16 + _h * _i++, $"The code supports multidimensional tensors (stored in surfaces), uses shaders for computing");
DrawText(16, 16 + _h * _i++, $"The code has rudamentary autodiff-system implemented for getting gradients.");
DrawText(16, 16 + _h * _i++, $"Also I wrote own shader preprocessor during the jam, as the Shady wasn't allowed.");
DrawText(16, 16 + _h * _i++, $"---");
DrawText(16, 16 + _h * _i++, $"The source is available (until I change my mind), so you may check it out.");
DrawText(16, 16 + _h * _i++, $"There are lots of bugs, and I wanted to put actual dataset (learn to recognize TEN digits).");
DrawText(16, 16 + _h * _i++, $"Funnily enough, no AI was used for anything for making this.");
DrawText(16, 16 + _h * _i++, $"---");
DrawText(16, 16 + _h * _i++, $"[R] Randomize weights");
DrawText(16, 16 + _h * _i++, $"[Z] Hold to learn");
DrawText(16, 16 + _h * _i++, $"[Mouse-Left] Change input");
DrawText(16, 16 + _h * _i++, $"---");
DrawText(16, 16 + _h * _i++, $"XOR TEST");
DrawText(16, 16 + _h * _i++, $"- input       : {self.arrInput}");
DrawText(16, 16 + _h * _i++, $"- target      : {self.arrOutput}");
DrawText(16, 16 + _h * _i++, $"- read output : {self.readOutput}");
DrawText(16, 16 + _h * _i++, $"- read cost   : {self.readCost}");


if (keyboard_check(ord("R")) == true)
{
  var _weighParams = { 
    lower : -0.5, 
    upper : +0.5 
  };
  var _biasParams = { 
    lower : -0.2, 
    upper : +0.2 
  };
  PRNG_Apply(self.weightA,  _weighParams);
  PRNG_Apply(self.weightB,  _weighParams);
  PRNG_Apply(self.biasA,    _biasParams);
  PRNG_Apply(self.biasB,    _biasParams);
}



// Apply the learning
if (keyboard_check(ord("Z")) == true)
{
  self.arrInput = [ 
    choose(-1, 1), choose(-1, 1) 
  ];
  
  self.arrOutput = [ 
    self.arrInput[0] ^^ self.arrInput[1] 
  ];
  
  self.input.ArrayPull(self.arrInput);
  self.target.ArrayPull(self.arrOutput);
  
  self.cost.Forward();
  self.cost.grad.OpScalarSet(1.0);
  self.cost.Backward();
  Optimizer(self.cost, 0.03);
  
  self.readInput  = self.input.ArrayPush();
  self.readOutput = self.output.ArrayPush();
  self.readCost   = self.cost.ArrayPush();
}


// Give input and check the output 
if ((device_mouse_check_button(0, mb_left)) == true)
{
  self.arrInput = [ 
    lerp(-1.5, +1.5, mouse_x / room_width), 
    lerp(-1.5, +1.5, mouse_y / room_height), 
  ];
  
  self.input.ArrayPull(self.arrInput);
  self.output.Forward();
  
  self.readInput  = self.input.ArrayPush();
  self.readOutput = self.output.ArrayPush();
  self.readCost   = self.cost.ArrayPush();
}


// Draw the input and output.
var _inputSurf = self.input.GetSurface();
var _outputSurf = self.output.GetSurface();

DrawText(128, 468-24, "input");
DrawText(160, 564-24, "output");
shader_set(SHD_Visualize);
{
  draw_surface_stretched(_inputSurf, 128, 468, 128, 64);
  
  draw_surface_stretched(_outputSurf, 160, 564, 64, 64);
}
shader_reset();


// Draw the learnables.
{
  var _w0 = self.weightA.GetSurface();
  var _b0 = self.biasA.GetSurface();

  var _w1 = self.weightB.GetSurface();
  var _b1 = self.biasB.GetSurface();

  var _s = 32;
  var _x = 500;
  var _y = 290;

  DrawText(_x, _y - 32, "weights");

  shader_set(SHD_Visualize);
  {
    draw_surface_ext(_w0, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_w0) * _s + 8;

    draw_surface_ext(_b0, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_b0) * _s + 8;

    draw_surface_ext(_w1, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_w1) * _s + 8;

    draw_surface_ext(_b1, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_b1) * _s + 8;
  }
  shader_reset();
}


// Draw the learnables.
{
  var _w0 = self.weightA.grad.GetSurface();
  var _b0 = self.biasA.grad.GetSurface();

  var _w1 = self.weightB.grad.GetSurface();
  var _b1 = self.biasB.grad.GetSurface();

  var _s = 32;
  var _x = 750;
  var _y = 290;

  DrawText(_x, _y - 32, "gradients");
  
  shader_set(SHD_Visualize);
  {
    draw_surface_ext(_w0, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_w0) * _s + 8;

    draw_surface_ext(_b0, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_b0) * _s + 8;

    draw_surface_ext(_w1, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_w1) * _s + 8;

    draw_surface_ext(_b1, _x, _y, _s, _s, 0, c_white, 1);
    _y += surface_get_height(_b1) * _s + 8;
  }
  shader_reset();
}









