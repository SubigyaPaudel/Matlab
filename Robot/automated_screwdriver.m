clear all
close all
clf
handle_axes= axes('XLim', [-10,10], 'YLim', [-10,10], 'ZLim', [-10,10]);

xlabel('e_1'); 
ylabel('e_2');
zlabel('e_3');

view(45, 45);
grid on;
axis equal
camlight
axis_length= 1;

trf_base = hgtransform('Parent', handle_axes);
trf_link1 = make_transform([0,0,0], 0,0,0, trf_base);
plot_axes(trf_link1, 'L_1', false, axis_length);
parts(1) = link_cylinder(2, 5, trf_base);

trf_link2 = make_transform([0,0,2.5], 0,0,0, trf_base);
plot_axes(trf_link2, 'L_2', false, axis_length);
parts(2) = link_sphere(2,trf_link2,[0,0,1]);

set(trf_base, 'Matrix',makehgtform('translate', [10,0,0]));



