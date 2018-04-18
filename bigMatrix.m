function [A] = bigMatrix(n,m)
% this function will create a matrix with number of rows n and number of
% columns m. the first row of the matrix will contain values 1, 2, 3 ...etc
% (I.E. the value in the matrix will reflect its placing, row 1 column 1
% will be 1). and do the same for the first column. the rest of the values
% will be the result of adding the previous value in the row, to the value
% above the new one
if nargin ~=2
    error('can only have 2 inputs, number of rows and number of columns');
end
for row = 1 : n
    for column = 1 : m
        if row == 1
            A(row,column) = column;
        elseif column == 1
            A(row,column) = row;
        else
            A(row,column) = A(row-1,column) + A(row,column-1);
        end
    end
end
end
