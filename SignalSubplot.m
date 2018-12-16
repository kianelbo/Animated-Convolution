function SignalSubplot(t, x, axes, col)
    axes.YLim = [min(x)-0.2 max(x)+0.2];
    plot(axes,t,x,'Color',col,'LineWidth',2);
end