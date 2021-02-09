function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

ship_dish_profile= 2*sin(linspace(0, pi, 15));
[Xc, Yc, Zc]= cylinder(ship_dish_profile);

% Top dish
trf_top_root= hgtransform('Parent', trf_root);
set(trf_top_root, 'Matrix', makehgtform('translate', [0, 0, -0.2]));
color_top= [1, 1, 1];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', trf_top_root, 'FaceColor', color_top, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_top, 'EdgeAlpha', transparency);
 
% Bottom dish
trf_bottom_root= hgtransform('Parent', trf_root);
set(trf_bottom_root, 'Matrix', makehgtform('translate', [0, 0, 0.2]));
color_bottom= [0, 0, 1];
myhandles(2)= surface(Xc, Yc, Zc, 'Parent', trf_bottom_root, 'FaceColor', color_bottom, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_bottom, 'EdgeAlpha', transparency);

% creates x, y, z coordinates of unit cylinder to draw left tail
[Xt, Yt, Zt]= cylinder([0.4 , 0.3 , 0]);


% Left tail
trf_tailleft_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-1, 0.75, 0.5]);
% Interpret the order as BFT (left to right)
set(trf_tailleft_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_left= [0.5 0 0.5]; 
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', trf_tailleft_root, 'FaceColor', color_tail_left, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_left, 'EdgeAlpha', transparency);

%right tail
[Xr, Yr, Zr]= cylinder([0.4 , 0.3 , 0]);
trf_tailright_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-1, -0.75, 0.5]);
% Interpret the order as BFT (left to right)
set(trf_tailright_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_tail_right= [0.5 0 0.5]; 
myhandles(4)= surface(Xr, Yr, Zr, 'Parent', trf_tailright_root, 'FaceColor', color_tail_right, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_tail_right, 'EdgeAlpha', transparency);

%mount for the right upper tail
[Xrm, Yrm, Zrm]= cylinder([0.4, 0.3, 0]);
trf_rightmount_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/4);
trf_T= makehgtform('translate', [-3, -0.75, 0.5]);
% Interpret the order as BFT (left to right)
set(trf_rightmount_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_rightmount= [0.5 0 0.5]; 
myhandles(5)= surface(Xrm, Yrm, Zrm, 'Parent', trf_rightmount_root, 'FaceColor', color_rightmount, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_rightmount, 'EdgeAlpha', transparency);

%mount for the left upper tail
[Xlm, Ylm, Zlm]= cylinder([0.4, 0.3, 0]);
trf_leftmount_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/4);
trf_T= makehgtform('translate', [-3, 0.75, 0.5]);
% Interpret the order as BFT (left to right)
set(trf_leftmount_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_leftmount= [0.5 0 0.5]; 
myhandles(6)= surface(Xlm, Ylm, Zlm, 'Parent', trf_leftmount_root, 'FaceColor', color_leftmount, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_leftmount, 'EdgeAlpha', transparency);

%left upper tail
[Xlt, Ylt, Zlt]= cylinder([0.4, 0.3, 0]);
trf_leftuppertail_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-4, 0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_leftuppertail_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_leftuppertail= [0.5 0 1]; 
myhandles(7)= surface(Xlt, Ylt, Zlt, 'Parent', trf_leftuppertail_root, 'FaceColor', color_leftuppertail, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_leftuppertail, 'EdgeAlpha', transparency);


%right upper tail
[Xrt, Yrt, Zrt]= cylinder([0.4, 0.3, 0]);
trf_rightuppertail_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [-4, -0.75, 2]);
% Interpret the order as BFT (left to right)
set(trf_rightuppertail_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_rightuppertail= [0.5 0 1]; 
myhandles(8)= surface(Xrt, Yrt, Zrt, 'Parent', trf_rightuppertail_root, 'FaceColor', color_rightuppertail, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_rightuppertail, 'EdgeAlpha', transparency);

%the rocket boosters
[Xrb1, Yrb1, Zrb1]= cylinder([0.4, 0.3, 0]);
trf_booster1_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [2, -1, 0.5]);
% Interpret the order as BFT (left to right)
set(trf_booster1_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_booster1= [1 0 0]; 
myhandles(9)= surface(Xrb1, Yrb1, Zrb1, 'Parent', trf_booster1_root, 'FaceColor', color_booster1, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_booster1, 'EdgeAlpha', transparency);

[Xrb2, Yrb2, Zrb2]= cylinder([0.4, 0.3, 0]);
trf_booster2_root= hgtransform('Parent', trf_root);
trf_scale= makehgtform('scale', [1,1,3]);
trf_Ry= makehgtform('yrotate', -pi/2);
trf_T= makehgtform('translate', [2, 1, 0.5]);
% Interpret the order as BFT (left to right)
set(trf_booster2_root, 'Matrix', trf_T*trf_Ry*trf_scale);
color_booster2= [1 0 0]; 
myhandles(10)= surface(Xrb2, Yrb2, Zrb2, 'Parent', trf_booster2_root, 'FaceColor', color_booster2, 'FaceAlpha', transparency, 'EdgeColor', 0.5*color_booster2, 'EdgeAlpha', transparency);


% Your code here. Use left tail as a reference and design spaceship as
% shown in the class. You can come up with a new design.
end

