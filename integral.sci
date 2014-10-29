function area = simpson1_3(Function, a, h)
  area = (h/3)*(Function(a) + 4*Function(a + h) + Function(a + 2*h));
endfunction

function area = simpson1_3_compost(Function, a, b, n)
  h = (b-a)/(2*n);
  area = 0;
  step = 2*h;

  for i = a:step:b-step
    disp(i);
    area = area + simpson1_3(Function, i, h);
  end
endfunction
