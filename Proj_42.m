% problem 42
% I copied the txt file into excel and made it a column of the words. This
% way, when I read in the .csv file, it is entered as a cell array.

% Below, I read in the .csv file, and make a second row in the cell array
% that is the length of each word. This will come in handy when we are
% calculating the 'sum' of each word.

Words = importdata('Words.csv');
W = cell(1786,2);
for i = 1:1786
    W{i,1} = Words{i};
    W{i,2} = length(Words{i});
end

%%
% Here, we calculate the sum of each word. We assign a value based on the
% letters in the word, e.g. a = 1, b = 2, etc.
% This section finds the sum for each word, and saves it in the vector
% 'Sum'.

[a b] = size(W);                % We need the number of words, a for the loop below
Sum = zeros(a,1);               % Initialize the output vector.

% The following loop takes each letter for each word, and compares it to
% the alphabet, adding to the sum of that word each time.
% This is not an elegant way of doing this, but I don't see any other way.
for j = 1:a
    for k = 1:W{j,2}
        if strcmp('A',W{j,1}(k))||strcmp('a',W{j,1}(k))
            Value = 1;
        elseif strcmp('B',W{j,1}(k))||strcmp('b',W{j,1}(k))
            Value = 2;
        elseif strcmp('C',W{j,1}(k))||strcmp('c',W{j,1}(k))
            Value = 3;
        elseif strcmp('D',W{j,1}(k))||strcmp('d',W{j,1}(k))
            Value = 4;
        elseif strcmp('E',W{j,1}(k))||strcmp('e',W{j,1}(k))
            Value = 5;
        elseif strcmp('F',W{j,1}(k))||strcmp('f',W{j,1}(k))
            Value = 6;
        elseif strcmp('G',W{j,1}(k))||strcmp('g',W{j,1}(k))
            Value = 7;
        elseif strcmp('H',W{j,1}(k))||strcmp('h',W{j,1}(k))
            Value = 8;
        elseif strcmp('I',W{j,1}(k))||strcmp('i',W{j,1}(k))
            Value = 9;
        elseif strcmp('J',W{j,1}(k))||strcmp('j',W{j,1}(k))
            Value = 10;
        elseif strcmp('K',W{j,1}(k))||strcmp('k',W{j,1}(k))
            Value = 11;
        elseif strcmp('L',W{j,1}(k))||strcmp('l',W{j,1}(k))
            Value = 12;
        elseif strcmp('M',W{j,1}(k))||strcmp('m',W{j,1}(k))
            Value = 13;
        elseif strcmp('N',W{j,1}(k))||strcmp('n',W{j,1}(k))
            Value = 14;
        elseif strcmp('O',W{j,1}(k))||strcmp('o',W{j,1}(k))
            Value = 15;
        elseif strcmp('P',W{j,1}(k))||strcmp('p',W{j,1}(k))
            Value = 16;
        elseif strcmp('Q',W{j,1}(k))||strcmp('q',W{j,1}(k))
            Value = 17;
        elseif strcmp('R',W{j,1}(k))||strcmp('r',W{j,1}(k))
            Value = 18;
        elseif strcmp('S',W{j,1}(k))||strcmp('s',W{j,1}(k))
            Value = 19;
        elseif strcmp('T',W{j,1}(k))||strcmp('t',W{j,1}(k))
            Value = 20;
        elseif strcmp('U',W{j,1}(k))||strcmp('u',W{j,1}(k))
            Value = 21;
        elseif strcmp('V',W{j,1}(k))||strcmp('v',W{j,1}(k))
            Value = 22;
        elseif strcmp('W',W{j,1}(k))||strcmp('w',W{j,1}(k))
            Value = 23;
        elseif strcmp('X',W{j,1}(k))||strcmp('x',W{j,1}(k))
            Value = 24;
        elseif strcmp('Y',W{j,1}(k))||strcmp('y',W{j,1}(k))
            Value = 25;
        elseif strcmp('Z',W{j,1}(k))||strcmp('z',W{j,1}(k))
            Value = 26;
        else
            Value = 0;
        end
        Sum(j) = Sum(j) + Value;
    end
end     
%%
% Here we will calculate all triangular numbers up to (and I think one
% greater than) the maximum word sum.
Max = max(Sum);
t = zeros(1000,1);          % MatLab had an issue when I tried indexing t, so I had to do this
t(1) = 1;
i = 2;
while t(i-1) < Max          % This loop calculates the triangular numbers, and saves them in t
    t(i) = t(i-1) + i;
    i = i+1;
end
% There are zeros at the end of this vector that we remove below:
Ind = max(find(t ~= 0));        % The last index that is not a zero
Triangular = t(1:Ind);          % Vector of triangular numbers
%%
% Here we compare each element of Sum and compare it to each value in
% Triangular. Again, this is not efficient, especially since Sum is not
% sorted at all.
Triangular_Words = 0;
L = length(Sum);
for i = 1:L
    for j = 1:Ind
        if Sum(i) == Triangular(j)
            Triangular_Words = Triangular_Words + 1;
        end
    end
end
fprintf('%d is the number of triangular words in the list! \n',Triangular_Words)
% The above prints the number of triangular numbers in the list!