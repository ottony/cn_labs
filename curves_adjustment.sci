exec('linear_iteractive.sci');

function point = new_point(x, y)
  point = struct('x', x, 'y', y);
endfunction

function line = mount_polinomial_line(x, level)
  for i = 0:level
    line(1, $+1) = x^i;
  end
endfunction

function e = residuo(points, equation)
  [lin, cols] = size(points);
  e = 0;
  
  for i = 1:lin
    y = polinomial(points(i).x, equation);
    e = e + (y - points(i).y)^2
  end
endfunction

function [equation, e, A, b] = adjust_curve(points, level)
  [lin, cols] = size(points);

  for i = 1:lin
   X(i, :) = mount_polinomial_line(points(i).x, level);
   y(i) = points(i).y;
  end

  A = X'*X;
  b = X'*y;

  equation = gauss(A, b);
  e = residuo(points, equation);
endfunction

function [equation, e, A, b] = adjust_curve_and_plot(points, level)
  [equation, e, A, b] = adjust_curve(points, level);

  [lin, col] = size(points);

  for i = 1:lin
    plot(points(i).x, points(i).y, 'r*')
  end

  x = points(1).x:0.1:points(lin).x;
  plot(x, polinomial(x, equation), 'g');
endfunction

function y = polinomial(x, constants)
  [lin, col] = size(constants);

  y = 0;

  for i = 0:(lin - 1)
    y = y + constants(i+1)*x.^i;
  end
endfunction
