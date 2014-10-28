//exec('linear_iteractive.sci');

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

  // TODO: Remove that *** of new_point
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

function [ M, constants ] = diferences_table_newton(x, y)
  l = length(x);
  M = [ y ];

  for i = 1:l-1
    aux = [];
    max = l-i;

    for j = 1:max
      delta_y   = M(i, j+1) - M(i, j);
      detal_x   = x(j+i) - x(j);
      aux(1, j) = delta_y /  detal_x;
    end

    aux(1, max+1:l) = 0;
    M(i+1,:)        = aux;
  end

  M         = M';
  constants = M(1, :);
endfunction

function [M, constants] = newton_intepolation(x, y)
  [M, constants] = diferences_table_newton(x, y);
  t = x(1):0.1:x(length(x));
  h = []

  for i = 1:length(x)
    plot(x(i), y(i), 'r*');
  end
  for i = t
    h(length(h) + 1) = polinomial_newton(i, constants, x)
  end

  plot(t, h);
endfunction

function y = polinomial_newton(x, constants, roots)
  lin = length(constants);

  y = 0;

  for i = 0:(lin - 1)
    // aux = constant*(x - x0)*...*(x - xn)
    aux = constants(i+1);

    for j = 1:i
      aux = aux*(x - roots(j));
    end

    y = y + aux;
  end
endfunction
