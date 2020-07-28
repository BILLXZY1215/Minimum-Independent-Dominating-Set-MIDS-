function [allgraph] = findpossible(grid)
    allgraph = cell(0);
    allgraph(end+1) = {grid};
    if size(grid,1) == 1 || size(grid,2) == 1
        return;
    end
    
    if size(grid,1) == size(grid,2)
        symmetry = size(grid,1)/2 + 0.5;
        for i = 1 : size(grid,1) - 1
            if i == 1
                newgraph = grid;
                newgraph(1,1) = {[0,0]};
                allgraph(end+1) = {newgraph};
                newgraph = grid;
                newgraph(1,end) = {[0,0]};
                allgraph(end+1) = {newgraph};
            else
                startpoint = 1;
                endpoint = i;
                while abs(endpoint - symmetry) <= abs(startpoint - symmetry)
                    newgraph = grid;
                    for j = startpoint : endpoint
                        newgraph(1,j) = {[0,0]};
                    end
                    allgraph(end+1)={newgraph};
                    startpoint = startpoint + 1;
                    endpoint = endpoint + 1;
                end
            end
        end
    end
    
    if size(grid,1) ~= size(grid,2)
        symmetry = size(grid,2)/2 + 0.5;
        for i = 1 : size(grid,2) - 1
            if i == 1
                newgraph = grid;
                newgraph(1,1) = {[0,0]};
                allgraph(end+1) = {newgraph};
                newgraph = grid;
                newgraph(1,end) = {[0,0]};
                allgraph(end+1) = {newgraph};
            else
                startpoint = 1;
                endpoint = i;
                while abs(endpoint - symmetry) <= abs(startpoint - symmetry)
                    newgraph = grid;
                    for j = startpoint : endpoint
                        newgraph(1,j) = {[0,0]};
                    end
                    allgraph(end+1)={newgraph};
                    startpoint = startpoint + 1;
                    endpoint = endpoint + 1;
                end
            end
        end
        reverse = grid';
        symmetry = size(reverse,2)/2 + 0.5;
        for i = 1 : size(reverse,2) - 1
            if i == 1
                newgraph = reverse;
                newgraph(1,end) = {[0,0]};
                allgraph(end+1) = {newgraph'};
            else
                startpoint = 1;
                endpoint = i;
                while abs(endpoint - symmetry) <= abs(startpoint - symmetry)
                    newgraph = reverse;
                    for j = startpoint : endpoint
                        newgraph(1,j) = {[0,0]};
                    end
                    allgraph(end+1)={newgraph'};
                    startpoint = startpoint + 1;
                    endpoint = endpoint + 1;
                end
            end
        end
    end
end