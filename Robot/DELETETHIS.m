clear all
close all
clf
handle_axes= axes('XLim', [-4,4], 'YLim', [-4,4], 'ZLim', [-4,4]);

xlabel('e_1'); 
ylabel('e_2');
zlabel('e_3');

view(-130, 26);
grid on;
axis equal
camlight
axis_length= 0.05;

trf_E_axes= hgtransform('Parent', handle_axes); 

trf_link0_E= make_transform([0, 0, 0], 0, 0, pi/2, trf_E_axes);
plot_axes(trf_link0_E, 'L_0', false, axis_length); 

trf_viz_link0= make_transform([0, 0, -1], 0, 0, 0, trf_link0_E);
length0= 2; radius0= 0.5;
h(1)= link_cylinder(radius0, length0, trf_viz_link0, [0.823529 0.411765 0.117647]); 
plot_axes(trf_viz_link0, ' ', true, axis_length);

trf_viz_link1= make_transform([0, 0, 0], 0, 0, 0);
length1= 0.5; radius1= 0.4;
h(2)= link_cylinder(radius1, length1, trf_viz_link1, [0, 0, 1]); 

trf_viz_link3p4= make_transform([0, 0, 0], 0, 0, 0); 
h(3)= link_box([4, 0.2, 2], trf_viz_link3p4, [0, 0, 1]); 
plot_axes(trf_viz_link3p4, ' ', true, axis_length); 

trf_viz_link3p4a= make_transform([0, 1, 1], 0, pi/2,0 ); 
h(3)= link_box([2, 0.2, 0.4], trf_viz_link3p4a, [0, 0, 1]); 
plot_axes(trf_viz_link3p4a, ' ', true, axis_length);

trf_viz_link3p4b= make_transform([0, -1, 1], 0, pi/2, 0); 
h(3)= link_box([2, 0.2, 0.4], trf_viz_link3p4b, [0, 0, 1]); 
plot_axes(trf_viz_link3p4b, ' ', true, axis_length);

j1_rot_axis_j1= [0,0,1]';
j1_rot_angle= 0; % [-pi/2, pi/2]
trf_joint1_link0= make_transform([0, 0, 0.225], 0, 0, 0, trf_link0_E); 
trf_link1_joint1= make_transform_revolute(j1_rot_axis_j1, j1_rot_angle, trf_joint1_link0); 
plot_axes(trf_link1_joint1, 'L_1', false, axis_length); 
make_child(trf_link1_joint1, trf_viz_link1);


j2_translation_axis_j2= [1,0,0]';
j2_translation= 0; % [-0.04, 0.04]
trf_joint3_link2= make_transform([0, -0.07, 0], pi/2, 0, 0, trf_link1_joint1); 
trf_link2_joint2= make_transform_prismatic(j2_translation_axis_j2, j2_translation, trf_joint3_link2);
plot_axes(trf_link2_joint2, 'L_4', false, axis_length); 
make_child(trf_link2_joint2, trf_viz_link3p4);


j3_rot_axis_j3=[0,-1.25,0]';
j3_rot_angle= 0; % [-pi/2, pi/2]
trf_joint3_link2= make_transform([0, -0.15, 0], pi/2, 0, 0, trf_link2_joint2);
trf_link3_joint3= make_transform_revolute(j3_rot_axis_j3, j3_rot_angle, trf_joint3_link2); 
plot_axes(trf_link3_joint3, 'L_3', false, axis_length); 
make_child(trf_link3_joint3, trf_viz_link3p4a);
make_child(trf_link3_joint3, trf_viz_link3p4b);


for q1=[linspace(0, pi/2, 30), linspace(pi/2, 3*pi/2, 30), linspace(3*pi/2, 2*pi, 30)]
    set(handle_axes, 'XLim', [-4,4], 'YLim', [-4,4], 'ZLim', [-4,4]);
    trf_q1= makehgtform('axisrotate', j1_rot_axis_j1, q1);
    set(trf_link1_joint1, 'Matrix', trf_q1);
    drawnow;
    pause(0.02);
end

for a1=[linspace(0, -1, 30), linspace(-1, 1, 30), linspace(1, 0, 30)]
    set(handle_axes, 'XLim', [-4,4], 'YLim', [-4,4], 'ZLim', [-4,4]);
    trf_a1= makehgtform('translate', j2_translation_axis_j2*a1);
    set(trf_link2_joint2, 'Matrix', trf_a1);
    drawnow;
    pause(0.02);
end

for q3=[linspace(0, -pi/2, 30), linspace(-pi/2, pi/2, 30), linspace(pi/2, 0, 30)]
    set(handle_axes, 'XLim', [-4,4], 'YLim', [-4,4], 'ZLim', [-4,4]);
    trf_q3= makehgtform('axisrotate', j3_rot_axis_j3, q3);
    set(trf_link3_joint3, 'Matrix', trf_q3);
    drawnow;
    pause(0.02);
end





