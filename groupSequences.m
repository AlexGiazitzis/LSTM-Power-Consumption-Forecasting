function data = groupSequences(tbl, groupByColumn)
arguments
    tbl table
    groupByColumn (1, 1) string
end

if isa(tbl{1, groupByColumn}, "datetime")
    indexes = unique(dateshift(tbl{:, groupByColumn}, "start", "day"), "rows", "stable");
else
    indexes = unique(tbl{:, groupByColumn}, "rows", "stable");
end
indexes = sort(indexes, "ascend");

numIdxs = length(indexes);
data = cell(numIdxs, 1);
if isa(tbl{1, groupByColumn}, "datetime")
    for idx = 1:numIdxs
        data{idx} = tbl{dateshift(tbl{:, groupByColumn}, "start", "day") == indexes(idx), (tbl.Properties.VariableNames ~= groupByColumn)}';
    end
else
    for idx = 1:numIdxs
        data{idx} = tbl{tbl{:, groupByColumn} == indexes(idx), (tbl.Properties.VariableNames ~= groupByColumn)}';
    end
end

end