function errorband(X, mean, sigma)
%ERRORBAND Plots a 2d line along with its variance
%   The mean will be plotted along with an area which represents [-sigma,
%   +sigma] area around the mean (if sigma is the standard deviation the
%   area represents an accuracy of 65%).

  if (~(iscolumn(X) && iscolumn(mean) && iscolumn(sigma)))
    error('X, mean, and sigma must be vertical vectors.');
  end
  
  if (length(X) ~= length(mean) || length(mean) ~= length(sigma))
    error('X, mean, and sigma must be of the same length.');
  end


  hold on

  h = area(X, [mean - sigma, 2*sigma]);

  h(1).FaceColor = 'none';
  h(1).EdgeColor = 'none';
  h(1).ShowBaseLine = 'off';

  h(2).FaceColor = [138, 191, 124] / 255;  
  h(2).LineWidth = 2;
  h(2).LineStyle = '-.';

  p1 = plot(X, mean);
  p1.LineWidth = 2;


  ax = gca;
  ax.XGrid = 'on';
  ax.YGrid = 'on';
  ax.Box = 'on';
  ax.Layer = 'top';

  xlim([X(1), X(end)]);

  hold off
  
end
