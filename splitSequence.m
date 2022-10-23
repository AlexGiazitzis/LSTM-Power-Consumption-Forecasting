function [train, val, test] = splitSequence(data, val_perc, test_perc)
arguments
    data (:, 1) cell
    val_perc double = 0.1
    test_perc double = 0.1
end

len = size(data, 1);

train = cell(len, 2);
val = cell(len, 2);
test = cell(len, 2);

for i = 1:len
    steps = size(data{i}, 2);
    stepsTrain = floor((1 - val_perc - test_perc) * steps);
    stepsVal = floor(val_perc * steps);

    train{i, 1} = data{i}(:, 1:stepsTrain-1);
    train{i, 2} = data{i}(:, 2:stepsTrain);
    
    val{i, 1} = data{i}(:, (stepsTrain + 1):(stepsTrain + stepsVal - 1));
    val{i, 2} = data{i}(:, (stepsTrain + 2):(stepsTrain + stepsVal));

    test{i, 1} = data{i}(:, (stepsTrain + stepsVal + 1):(end - 1));
    test{i, 2} = data{i}(:, (stepsTrain + stepsVal + 2):end);
end

end