function [res] = drawgraph(allpointgraph)
  for i = 1:length(allpointgraph)
      graph = cell2mat(allpointgraph(i));
      graph
      [a,b] = size(graph);
      m = [];
      n = [];
      for x = 1:a
          for y = 1:b
              if(graph(x,y) == 1)
                m = [m x];
                n = [n y];
              end
          end
      end
      subplot(1,length(allpointgraph),i)
      plot(m,n,'s','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor',[0.5,0.5,0.5]);
      axis([0 (a+1) 0 (b+1)]);
  end
end