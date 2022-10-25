a = [2 3 5]; % your point [x0,y0,z0]
b = [1 1 0]; % your normal vector 
c = a+b; % end position of normal vector

%quiver3 syntax: quiver3(x,y,z,u,v,w)
quiver3(a(1), a(2), a(3), c(1), c(2), c(3));
axis equal;