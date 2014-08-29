function precise = are_precise(Function, x, precision)
  // Example: |Y| < 10^-3
  precise = abs(Function(x)) < ( 10^-precision );
endfunction

function [x, root] = newton_root(Function, x, precision, max_loop)
  //set default value
  if ~exists('max_loop', 'local') then
    max_loop = 10;
  end

  for i = 1:max_loop
    // checks accuracy and stops if that's true
    if are_precise(Function, x, precision)  then
      break;
    end

    angular_coeficient = derivative(Function, x)

    // when tangent touch "x" axis
    x = x - Function(x) / angular_coeficient;
  end
endfunction

function y = sample_function(x)
  // roots = 15, 2, -5, -25
  // use point to operate with vector
  y = (x - 15).*(x - 2).*(x + 5).*(x + 25)
endfunction
