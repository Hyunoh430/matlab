% Define time range
t = -10:0.01:10;

% Define rectangular function (rect)
rect = @(t) (abs(t) <= 2); % Width of the rect is 4 (from -2 to 2)

% Define scaled sinc function
sinc_scaled = @(t) (3/2) * sinc((3/2) * t); % MATLAB's sinc is sin(pi*x)/(pi*x)

% Evaluate rect and sinc over t
rect_vals = rect(t);
sinc_vals = sinc_scaled(t);

% Perform convolution
conv_result = conv(rect_vals, sinc_vals, 'same') * 0.01; % Scale by time step

% Define the new time axis for convolution
t_conv = linspace(min(t), max(t), length(conv_result));

% Plot the original functions and the convolution result
figure;

% Plot the rectangular function
subplot(3,1,1);
plot(t, rect_vals, 'LineWidth', 1.5);
title('Rectangular Function (-2 to 2)');
xlabel('t');
ylabel('Amplitude');
grid on;

% Plot the scaled sinc function
subplot(3,1,2);
plot(t, sinc_vals, 'LineWidth', 1.5);
title('Scaled Sinc Function');
xlabel('t');
ylabel('Amplitude');
grid on;

% Plot the convolution result
subplot(3,1,3);
plot(t_conv, conv_result, 'LineWidth', 1.5);
title('Convolution Result');
xlabel('t');
ylabel('Amplitude');
grid on;
