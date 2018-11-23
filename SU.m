num = 100;
p = 0.08;
dot_x = zeros(n,1);
dot_y = zeros(n,1);
dot_rand = zeros(n,1); 
dot_type = zeros(n,1); 
length_min = 1;
n = 100;
for i = 1 : 1 : n
   dot_x(i)= rand(1,1);
   dot_y(i) = rand(1,1);
   dot_type(i) = 'N';
end

for r = 1 : 1 : 8
   for i = 1 : 1 : n
       dot_rand(i) = rand(1,1);
       if dot_type(i) == 'Y'
           dot_type(i) = 'S';
       end
   end
   figure(r);
   for i = 1 : 1 : n
       if dot_type(i) == 'N'
           if (dot_rand(i) <= (p/(1-p * mod(r,round(1/p)))))
              dot_type(i) = 'Y';
              num = num-1;
           end
       end
       if dot_type(i) == 'Y'
          plot(dot_x(i),dot_y(i),'ro','MarkerFaceColor','r'); 
       elseif dot_type(i) == 'N'
          plot(dot_x(i),dot_y(i),'k*');
       elseif dot_type(i) == 'S'
          plot(dot_x(i),dot_y(i),'b*');
       end
       hold on
   end
%   p = 6 / num;
   for i = 1 : 1 : n
       if dot_type(i) ~= 'Y'
           s = i;
           for j = 1 : 1 : n
               if dot_type(j) == 'Y'
                   length = sqrt((dot_x(s)-dot_x(j))^2+(dot_y(s)-dot_y(j))^2);
                   if length < length_min
                        length_min = length;
                        k = j;
                   end
               end
           end
           plot([dot_x(k) dot_x(s)],[dot_y(k) dot_y(s)],'k');
           hold on
           length_min = 1;
       end
       hold on
   end
end





