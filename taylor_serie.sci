function relative_error = calc_error(real_value, relative_value)
  relative_error = abs( (real_value - relative_value) / real_value )  * 100;
endfunction

// sin(x) = (-1)^i * ( x^(2i + 1)/ (2i + 1)! )

function [relative_sin, relative_error, real_sin] = sin_taylor(angle, terms)
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

function [relative_sin, relative_error, real_sin] = sin_taylor_suggested(angle, terms)
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

function [relative_sin, terms, real_sin] = sin_t(angle, precision)
  real_sin = sin(angle);
  relative_sin = angle;
  i = 1;

  while(abs(relative_sin - real_sin) > 10^-precision)
    signal = (-1)^i;
    n = 2*i + 1;

    term = angle^n / factorial(n);
    relative_sin = relative_sin + signal*term;
    i = i + 1;
  end

  terms = i;
endfunction

// ploting

function plot_taylor_analysis(angle, range_terms)
  for i = range_terms
    [results(i), errors(i), real_results(i)] = sin_taylor(angle, i)
  end

  plot2d(range_terms, [results, real_results, errors], [-10, 2, 5]);
  legends(["Resultado", "Valor esperado", "Error"], [-10, 2, 5], opt='lr');

endfunction

function run_taylor_sample
  disp("Série de Taylo para seno x = %pi/2 e termos de 1 à 10");
  plot_taylor_analysis(%pi/2, 1:10);
endfunction
