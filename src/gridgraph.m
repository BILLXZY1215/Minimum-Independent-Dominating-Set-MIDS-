% s = [1 1 1 1 1 1 1 9 9 9 9 9 9 9];
% t = [2 3 4 5 6 7 8 2 3 4 5 6 7 8];
% G = graph(s,t);
% h = plot(G)
% h.XData = [0 -3 -2 -1 0 1 2 3 0];
% h.YData = [2 0 0 0 0 0 0 0 -2];

%% Square
function [grid] = gridgraph(row,col)
    grid = num2cell(zeros(row,col));
    for i = 1:row
        for j = 1:col
            grid(i,j) = {[i-0.5,j-0.5]}
        end
    end
end

