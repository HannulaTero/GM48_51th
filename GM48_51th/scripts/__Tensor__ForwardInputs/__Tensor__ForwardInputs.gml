

/**
* Computes the inputs first.
*/ 
function __Tensor__ForwardInputs()
{
  array_foreach(self.input, function(_input, _index)
  {
    _input.Forward();
  });
}