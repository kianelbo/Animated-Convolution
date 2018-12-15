fs = 200;
t = linspace(-1,1,fs);

convolution = zeros(1,length(t));

ax = [-1 1 -0.2 1.2];    

% ========== plot the two signals (x1 and x2):
disp('x1: single rectangle pulse with width of 1.0')
disp('x2: single triangle  pulse with width of 0.5')
x1 = rectpuls(t,1);
x2 = tripuls(t,0.5,-1);

subplot(4,2,1);plot(t,x1,'Color','blue','LineWidth',2),axis(ax); 
grid on;
xlabel('t')
ylabel('x1')

subplot(4,2,2);plot(t,x2,'Color','red','LineWidth',2),axis(ax); 
grid on;
xlabel('t')
ylabel('x2')

disp('Press Enter to continue ....');
pause;


% ========== convolution of y1 and y2:
sprintf('\n\nConvolution of the two signals (x1 and x2):');

iter = length(t);

for i = 1:iter 
    moveStep = (2*i-fs)/fs;
    x2_shifted = tripuls(moveStep-t,0.5,-1);
    convolution(i) = trapz(t, x1.*x2_shifted);
    
    subplot(4,2,3:4)
    hold off;
    plot(t,x1,'Color','blue','LineWidth',2),axis(ax);
    hold on; 
    plot(t,x2_shifted,'Color','red' ,'LineWidth',2),axis(ax);
    grid on;
    xlabel('t');
   
    subplot(4,2,5:6)
    hold off
    plot(t(1:i),convolution(1:i),'Color','black','LineWidth',2); axis([-1 1 -0.2 0.5]);
    grid on;
    xlabel('t')
    ylabel('x1 * x2')
    
    pause(0.01)
end