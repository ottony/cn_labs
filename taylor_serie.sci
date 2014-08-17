function [relative_sin, real_sin, relative_error] = sin_taylor(angle, terms)
  terms = terms - 1;
  real_sin = sin(angle);
  relative_sin = 0;

  for i = 0:terms
    n = 2*i + 1;
    signal = (-1)^i;
    term = angle^n / factorial(n);

    relative_sin = relative_sin + signal*term;
  end

  relative_error = abs( (real_sin - relative_sin) / real_sin )  * 100 ;
endfunction
