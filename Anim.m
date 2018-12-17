set(app.x1DropDown, 'Enable', 'off')
set(app.x2DropDown, 'Enable', 'off')
cla(app.SlideAxes)
cla(app.ConvAxes)

app.SlideAxes.YLim = [min(min(app.x2), min(app.x1))-0.2 max(max(app.x2), max(app.x1))+0.2];

iter = length(app.t);
for i = 1:iter
    moveStep = (2*i - app.fs) / app.fs;
    x2_shifted = tripuls(moveStep - app.t, 0.5, -1);
    app.convolution(i) = trapz(app.t, app.x1.*x2_shifted);
    
    plot(app.SlideAxes,app.t, app.x1,'Color','blue','LineWidth',2);
    hold(app.SlideAxes);
    plot(app.SlideAxes,app.t, x2_shifted,'Color','red','LineWidth',2);
    
    SignalSubplot(app.t(1:i), app.convolution(1:i), app.ConvAxes,'black');
    
    pause(0.01)
end

set(app.x1DropDown, 'Enable', 'on')
set(app.x2DropDown, 'Enable', 'on')