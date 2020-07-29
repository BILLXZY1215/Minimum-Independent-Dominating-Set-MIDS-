res = inputdlg({'Row:', 'Col:'}, 'Input', 1);
row =  str2num(res{1});
col = str2num(res{2});

[allpointgraph, allgraph] = mainfunc(row,col)

function [allpointgraph, allgraph] = mainfunc(row,col)
    [grid] = gridgraph(row,col)

    x=[];
    y=[];

    for i = 1:row
        for j = 1: col
            a = cell2mat(grid(i,j));
            x = [x a(1)];
            y = [y a(2)];
            if(i==1 && j==1)
                xmin = a(1)-0.5;
                ymin = a(2)-0.5;
            end
            if(i==row && j==col)
                xmax = a(1)+0.5;
                ymax = a(2)+0.5;
            end
            plot(x,y,'s','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
        end
    end


    axis([xmin xmax ymin ymax]);

    [allgraph] = findpossible(grid);
    
    allpointgraph = [];
    for a = 1:length(allgraph)
        comp = allgraph{1,a};
        [pointSet] = square2point(comp);
        allpointgraph =[allpointgraph {pointSet}];
%       allpointgraph = allpointgraph';
    end
    
    drawgraph(allpointgraph);
end


