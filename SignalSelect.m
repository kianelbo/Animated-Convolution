function SignalSelect(s, dropDown, axes)
    if s == 1
        col = 'blue';
        t = -2:0.1:2;
    else
        col = 'red';
        t = -2:0.1:2;
    end
    
    switch (dropDown.Value)
        case 'rect'
            x = rectpuls(t,2);
        case 'x=t'
            x = t;
        case 'sin'
            x = sin(2*pi*t);
        case 'cos'
            x = cos(2*pi*t);
    end
    
    plot(axes,t,x,'Color',col);
end