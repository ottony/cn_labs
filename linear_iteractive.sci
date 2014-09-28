function invalid = validate(A)
  [lines, cols] = size(A);

  invalid = ( lines ~= cols )
endfunction

// Retroative method. should receive upper triangular matrix
function x = linear(A, b)
  [lines, cols] = size(A);

  // validates
  if validate(A) then
    disp('invalid!');
    x = 0;
    return;
  end

  // each line
  for i = lines:-1:1
    sum = 0;

    // each column
    for j = i+1:cols
      sum = sum + A(i, j) * x(j);
    end

    x(i) = ( b(i) - sum ) / A(i, i)
  end

  // corroborates result
  if A*x == b | A*x == b' then
    disp('Evething is awesome...');
  end
endfunction

function x = gauss(A, b)
  [lin, cols] = size(A);

  for diagonal = 1:lin
    for i = (diagonal+1):cols
      c = A(i, diagonal)/A(diagonal,diagonal);

      A(i, :) = A(i, :) - c*A(diagonal, :);
      b(i) = b(i) - c*b(diagonal);
    end
  end

  x = linear(A,b);
endfunction
