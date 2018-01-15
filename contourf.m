function contourf(X, Y, Z, n, options)
%MYFILLCONTOUR Draws fancy contour plots
%   The syntax is similar to that of contour(X, Y, Z, n [, options]).
%   
%   options has several fields (first ones are default values):
%     options.ShowText = 'on' | 'off'
%     options.LineColor = 'black' | [83,145,200] | any other color
%     options.LineWidth = 1 | any other number
%     options.ColorMap = autumn | any other colormap

  if (nargin < 5)
    options = struct('ShowText','on');
  end

  % check whether all options are correctly given
  if (~isfield(options, 'ShowText')); options.ShowText = 'on'; end
  if (~isfield(options, 'LineColor')); options.LineColor = 'black'; end
  if (~isfield(options, 'LineWidth')); options.LineWidth = 1; end
  if (~isfield(options, 'ColorMap')); options.ColorMap = 'autumn'; end


  hold on


  % filled contour
  contourf(X, Y , Z, n, ...
    'LineStyle', 'none');
  colormap(options.ColorMap);

  % hatch pattern
  mesh(X, Y, zeros(size(Z)), ...
    'FaceColor', 'none', ...
    'EdgeColor', 'white', ...
    'EdgeAlpha', 0.2, ...
    'LineStyle', '-');

  % line contour
  contour(X, Y, Z, n, ...
    'LineStyle', '-', ...
    'LineColor', options.LineColor, ...
    'LineWidth', options.LineWidth, ...
    'ShowText', options.ShowText);


  ax = gca;
  ax.TickDir = 'out'; % [{in} | out] inside or outside (for 2D). 
  ax.LineWidth = 1.0; % width of the line of the axes
  ax.Box = 'on';
  ax.Layer = 'top';

  xlim([min(X(:)), max(X(:))]);
  ylim([min(Y(:)), max(Y(:))]);

  hold off

end
