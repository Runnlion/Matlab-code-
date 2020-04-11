xr = 5; % left side value of x
t = 0:0.0001:xr;
yi = sin(2*pi*t);% input
% ys = 6.*t.*t +3.*t+ exp(-6*t);
% fprintf('max = %d', max(ys))
yii = -yi;% inverse input
%normailze 
yt = max(yi)*sawtooth(2*pi*50*t,0.5);

s = size(t,2);
for i = 1:(s)
    if( yi(i) >= yt(i))
        yo1(i) = 1;
    else
        yo1(i) = 0;
    end  
    
    if( yii(i) >= yt(i))
        yo2(i) = 1;
    else
        yo2(i) = 0;
    end  
end
yo = yo1 - yo2;
Len = 100;%interval of average
for k = 1:(s)
    if(mod(k-1,Len)==0)%find specific point in each Len print 
    avg = 0;
    for ii = k+1:k+Len-1
        if(ii<=s)
            avg = avg + yo(ii);
        end
    end
    avg = avg/Len;
    for j =1:Len
        if(k+j-1<=s)
            yo_dac(k+j-1)=avg;
        end
    end
    end
end

figure(1)
subplot(2,2,1)
plot(t,yt)
grid
title('tri Signal');

subplot(2,2,3)
plot(t,yi)
grid
title('Sin Signal');

subplot(2,2,2)
plot(t,yo1)
grid
title('Pause 1');

subplot(2,2,4)
plot(t,yo2)
grid
title('Pause 2');

figure(2)
subplot(2,1,1)
plot(t,yo)
grid
title('OutPut PWM ');

subplot(2,1,2)
plot(t,yo_dac)
grid
title('OutPut DAC ');
% Following code is for compare each input and output in one graph
% figure(3)
% subplot(3,1,1)
% plot(t,yt)
% hold on 
% plot(t,yi)
% hold on 
% plot(t,yo1)
% hold on 
% title('F1 ');
% subplot(3,1,2)
% plot(t,yt)
% hold on 
% plot(t,yii)
% hold on 
% plot(t,yo2)
% hold on 
% title('F2 ');
% subplot(3,1,3)
% plot(t,yo)
% title('F3 ');
