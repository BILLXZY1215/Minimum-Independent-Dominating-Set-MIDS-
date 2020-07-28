%% Point
function [pointSet] = square2point(grid)
    x = [];
    y = [];
    m = [];
    n = [];
    eraseX = [];
    eraseY = [];
    
    [row col] = size(grid);
    
    % square2point: dimension increase
    prow = row + 1;
    pcol = col + 1;
        
%     p = -ones(prow*pcol);
%     q = -ones(prow*pcol);
%     px = p(1,:);
%     py = q(1,:);
    
    pointSet = zeros(prow,pcol);
    
    % Get square axis array
    for i = 1:row
        for j = 1: col
            a = cell2mat(grid(i,j));
            x = [x a(1)];
            y = [y a(2)];
            if(a(1) == 0 && a(2) == 0)
                eraseX = [eraseX i];
                eraseY = [eraseY j];
            end
        end
    end 
    
    % Generate to point axis array
    for k = 1:(row*col)
        if(x(k) ~= 0 && y(k) ~= 0)
            xs = x(k)-0.5;
            xl = x(k)+0.5;
            ys = y(k)-0.5;
            yl = y(k)+0.5;
            
            m = [m xs];
            n = [n ys];

            m = [m xs];
            n = [n yl];

            m = [m xl];
            n = [n ys];

            m = [m xl];
            n = [n yl];          
        end
    end
    
    temp = cell(length(m));
    temp = temp(1,:);
    for s = 1: length(temp)
        temp(s) = {[num2str(m(s)),num2str(n(s))]};
    end
    temp = unique(temp);
%     temp
    
    xAxis=[];
    yAxis=[];
    
    for w = 1 : length(temp)
        flag = temp(w);
        b = flag{1};
        xAxis = [xAxis str2num(b(1))];
        yAxis = [yAxis str2num(b(2))];
    end

%     xAxis
%     yAxis
    u = 1;
    for x = 1 : prow
        for y = 1 : pcol
            if(xAxis(u) == (x-1) && yAxis(u) == (y-1))
                pointSet(x,y) = 1;
                u = u + 1;
            else
                continue;
            end
        end        
    end
%     max(m) - min(m) + 1;
%     max(n) - min(n) + 1;
    
    
end
