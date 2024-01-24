clc;
clear all;
%Author sandeep_lottreyticket
% Define ranges for each column
newRanges = {[1 10], [11 20], [21 30], [31 40], [41 50], [51 60], [61 70], [71 80], [81 90]};

% Generate and print 5 tickets
newNumTickets = 5;

for newTicketIndex = 1:newNumTickets
    % Create an empty ticket
    newTicket = zeros(3, 9);

    % Fill each column with sorted non-repeating numbers from its range
    for j = 1:9
        newColRange = newRanges{j};
        newAvailableNumbers = newColRange(1):newColRange(2);

        % Determine the number of blanks for this column (1 or 2)
        newNumBlanks = randi([1, 2]);

        % Randomly pick non-blank numbers
        newNonBlankNumbers = randsample(newAvailableNumbers, 3 - newNumBlanks);
        
        % Sort the non-blank numbers and place them in ascending order
        newTicket(:, j) = sort([newNonBlankNumbers zeros(1, newNumBlanks)]);

        % Shuffle the sorted non-blank numbers within the column
        newTicket(:, j) = newTicket(randperm(3), j);
    end

    % Display the generated ticket
    disp(['New Ticket ' num2str(newTicketIndex) ':']);
    disp(newTicket);
    disp(' ');
end