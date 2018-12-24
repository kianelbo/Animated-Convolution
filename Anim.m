set(app.x1DropDown, 'Enable', 'off')
set(app.x2DropDown, 'Enable', 'off')
cla(app.SlideAxes)
cla(app.ConvAxes)


t1 = -10:app.sampleInt:10;
x1 = 0.1*(t1.^2);

t2 = -7:app.sampleInt:7;
x2 = -0.1*(t2.^2);

convolution = app.sampleInt * conv(x1, x2);

x2f = fliplr(x2);
t2f = fliplr(-t2);

t2f = t2f + (min(t1)-max(t2f));

tc = [ t2f t1(2:end)];
tc = tc+max(t2);

plot(app.SlideAxes, t1, x1);
hold(app.SlideAxes);

q = plot(app.SlideAxes, t2f, x2, 'r');
app.SlideAxes.XLim = [(min(t1)-abs(max(t2f)-min(t2f))-1) (max(t1)+abs(max(t2f)-min(t2f))+1)];
u_ym = app.SlideAxes.YLim;

s_l = line(app.SlideAxes,[min(t1) min(t1)], [u_ym(1) u_ym(2)], 'color','g');
e_l = line(app.SlideAxes,[min(t1) min(t1)], [u_ym(1) u_ym(2)], 'color','g');
sg = rectangle(app.SlideAxes, 'Position', [min(t1) u_ym(1) 0.0001 u_ym(2)-u_ym(1)], ...
	'FaceColor', [1 1 0 0.5], 'EraseMode', 'xor');

r = plot(app.ConvAxes,tc, convolution);
app.ConvAxes.XLim = [(min(t1)-abs(max(t2f)-min(t2f))-1) (max(t1)+abs(max(t2f)-min(t2f))+1)];

for i=1:length(tc)
    pause(0.01);
    drawnow;
    
    t2f=t2f+app.sampleInt;
    set(q,'EraseMode','xor');
    set(q,'XData',t2f,'YData',x2f);
    
    sx = min(max(t2f(1), min(t1)), max(t1));
    set(s_l,'EraseMode','xor');
    set(s_l, 'XData', [sx sx]);
    
    ex = min(t2f(end), max(t1));
    set(e_l,'EraseMode','xor');
    set(e_l, 'XData', [ex ex]);
    
    rpos = [sx u_ym(1) max(0.0001, ex-sx) u_ym(2)-u_ym(1)];
    set(sg, 'Position', rpos);
    
    set(r,'EraseMode','xor');
    set(r,'XData',tc(1:i),'YData',convolution(1:i));
    
end

% app.SlideAxes.YLim = [min(min(app.x2), min(app.x1))-0.2 max(max(app.x2), max(app.x1))+0.2];
% 
% iter = length(app.t);
% for i = 1:iter
%     moveStep = (2*i - app.fs) / app.fs;
%     x2_shifted = rectpuls(moveStep - app.t,1);
%     app.convolution(i) = trapz(app.t, app.x1.*x2_shifted);
%     
%     plot(app.SlideAxes,app.t, app.x1,'Color','blue','LineWidth',2);
%     hold(app.SlideAxes);
%     plot(app.SlideAxes,app.t, x2_shifted,'Color','red','LineWidth',2);
%     
%     SignalSubplot(app.t(1:i), app.convolution(1:i), app.ConvAxes,'black');
%     
%     pause(0.01)
% end

set(app.x1DropDown, 'Enable', 'on')
set(app.x2DropDown, 'Enable', 'on')