function area = trapezio(Function, a, h)
  area = h*( (Function(a) + Function(a + h))/2 )
endfunction

function [area, h] = trapezio_compost(Function, a, b, n)
  h = (b-a)/n;
  area = 0;

  for i = a:h:b-h
    area = area + trapezio(Function, i, h);
  end
endfunction

function area = simpson1_3(Function, a, h)
  area = (h/3)*(Function(a) + 4*Function(a + h) + Function(a + 2*h));
endfunction

function [area, h] = simpson1_3_compost(Function, a, b, n)
  h = (b-a)/(2*n);
  area = 0;
  step = 2*h;

  for i = a:step:b-step
    area = area + simpson1_3(Function, i, h);
  end
endfunction

function area = simpson3_8(Function, a, h)
  const = (3*h)/8
  area  = const*(Function(a) + 3*Function(a + h) + 3*Function(a + 2*h) + Function(a + 3*h));
endfunction

function [area, h] = simpson3_8_compost(Function, a, b, n)
  h = (b-a)/(3*n);
  area = 0;
  step = 3*h;

  for i = a:step:b-step
    area = area + simpson3_8(Function, i, h);
  end
endfunction
