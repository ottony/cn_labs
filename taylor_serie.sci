function relative_error = calc_error(real_value, relative_value)
  relative_error = abs( (real_value - relative_value) / real_value )  * 100;
endfunction

// sin(x) = (-1)^i * ( x^(2i + 1)/ (2i + 1)! )

function [relative_sin, real_sin, relative_error] = sin_taylor(angle, terms)
  real_sin = sin(angle);
  relative_sin = 0;

  for i = 0:terms
    signal = (-1)^i;
    n = 2*i + 1;

    term = angle^n / factorial(n);
    relative_sin = relative_sin + signal*term;
  end

  relative_error = calc_error(real_sin, relative_sin);
endfunction

// suggested by the teacher

function [relative_sin, real_sin, relative_error] = sin_taylor_suggested(angle, terms)
  real_sin = sin(angle);
  relative_sin = angle;
  stoped_point = 3 + 2*(terms - 1)
  i = 3;
  j = 1;

  for n = i:2:stoped_point
    signal = (-1)^j;
    j = j + 1;

    term = angle^n / factorial(n);
    relative_sin = relative_sin + signal*term;
  end

  relative_error = calc_error(real_sin, relative_sin);
endfunction

// ploting
