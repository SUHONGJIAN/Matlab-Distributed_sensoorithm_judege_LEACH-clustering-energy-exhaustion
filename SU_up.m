n = 100;
p = 0.08;
dot_x = zeros(n,1);
dot_y = zeros(n,1);
dot_rand = zeros(n,1); 
dot_type = zeros(n,1); 
dot_hp = zeros(n,1); 
length_min = 1;
num = 100;
t = 1;

for i = 1 : 1 : n
   dot_x(i)= rand(1,1);
   dot_y(i) = rand(1,1);
   dot_hp(i) = 666; 
   dot_type(i) = 'N';
end

for r = 1 : 1 : 10
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
              dot_hp(i) = dot_hp(i) - 92 * 2;
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
           dot_hp(s) = dot_hp(s) - 8;
           dot_hp(s) = dot_hp(s) - 2;
           dot_hp(s) = dot_hp(s) - 2 * 10;
           dot_hp(k) = dot_hp(k) - 1;
           dot_hp(k) = dot_hp(k) - 1 * 10;
           length_min = 1;
       end
       hold on
   end
   if(t == 1)
       for i = 1 : 1 : n
           if dot_hp(i) <= 0
               plot(dot_x(i),dot_y(i),'go','MarkerFaceColor','g'); 
               r_exhausted = r;
               t = 0;
               break;
           end
       end
   end
end
title(['【相同能量】','第',num2str(r_exhausted),'图出现能量耗尽节点(具体节点为第',num2str(r_exhausted),'张图中绿色实心点)']);


