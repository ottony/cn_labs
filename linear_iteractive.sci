// Retroative method. should receive upper triangular matrix
function x = linear(A, b)
  [lines, cols] = size(A);

  // validates
  if lines ~= cols then
    disp('invalid!');
    break;
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
