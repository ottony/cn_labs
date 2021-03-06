function precise = is_precise(Function, x, precision)
  // Example: |Y| < 10^-3
  precise = abs(Function(x)) < ( 10^-precision );
endfunction

// Find root value with newton method
function [x, root] = newton_root(Function, x, precision, max_loop)
  // set default value
  if ~exists('max_loop', 'local') then
    max_loop = 10;
  end

  for i = 1:max_loop
    // checks accuracy and stops if that's true
    if is_precise(Function, x, precision)  then
      break;
    end

    angular_coeficient = numderivative(Function, x)

    // when tangent touch "x" axis
    x = x - Function(x) / angular_coeficient;
  end
endfunction

// Find root value with secant method
function [x, root] = secant_root(Function, x, precision, max_loop)
  //set default value
  if ~exists('max_loop', 'local') then
    max_loop = 10;
  end

  // starting x1 with increased precision value
  x1 = x + 10^-precision;

  for i = 1:max_loop
    if is_precise(Function, x, precision)  then
      break;
    end

    angular_coeficient = (Function(x1) - Function(x)) / ( x1 - x );
    x1 = x;
    x = x - Function(x) / angular_coeficient;
  end
endfunction

function y = sample_function(x)
  // roots = 15, 2, -5, -25
  // use point to operate with vector
  y = (x - 15).*(x - 2).*(x + 5).*(x + 25)
endfunction
