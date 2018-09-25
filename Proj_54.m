Words = importdata('Proj_54.csv');
 Player1 = cell(1000,2);
 Player2 = cell(1000,2);
 for i = 1:1000
     Player1{i,1} = [Words{i}(1), Words{i}(4), Words{i}(7), Words{i}(10), Words{i}(13)];
     Player1{i,2} = [Words{i}(2), Words{i}(5), Words{i}(8), Words{i}(11), Words{i}(14)];
     Player2{i,1} = [Words{i}(16), Words{i}(19), Words{i}(22), Words{i}(25), Words{i}(28)];
     Player2{i,2} = [Words{i}(17), Words{i}(20), Words{i}(23), Words{i}(26), Words{i}(29)];
 end
 % card numbers are 1,4,7,10,13
 % Suits are 2,5,8,11,14
 %%
 
% High Card: Highest value card.
% One Pair: Two cards of the same value.
% Two Pairs: Two different pairs.
% Three of a Kind: Three cards of the same value.
% Straight: All cards are consecutive values.
% Flush: All cards of the same suit.
% Full House: Three of a kind and a pair.
% Four of a Kind: Four cards of the same value.

% Straight Flush: All cards are consecutive values of same suit.
% Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
% There are no straight or royal flushes
%% Find flushes
Multiples = zeros(1000,1);
for i = 1:1000
    Suits = zeros(1,4);
    for j = 2:5
        Suits(j) = strcmp(Player1{i,2}(1),Player1{i,2}(j));
    end
    if sum(Suits) == 4
        Multiples(i) = 1;
    end
end
% Player 1 has a flush on hand 424.
%%
Flushes2 = zeros(1000,1);
for i = 1:1000
    Suits = zeros(1,4);
    for j = 2:5
        Suits(j) = strcmp(Player2{i,2}(1),Player2{i,2}(j));
    end
    if sum(Suits) == 4
        Flushes2(i) = 1;
    end
end
% Player 2 has a flush on hand 82.
%%
Multiples = zeros(1000,1);
for i = 1:1000
    Pairs = zeros(1,4);
    for j = 2:5
        Pairs(j) = strcmp(Player1{i,1}(1),Player1{i,1}(j));
    end
    if sum(Pairs) == 1
        Multiples(i) = 2;
    elseif sum(Pairs) == 2
        Multiples(i) = 3;
    elseif sum(Pairs) == 3
        Multiples(i) = 4;
    end
end
