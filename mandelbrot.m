close all; clear; clc;
res = 50;
pixels = surf(zeros(res), zeros(res), 'LineStyle', 'none');
view(2);
re_limits = [-2, 2];
im_limits = [-2, 2];
max_iterations = 50;
zoom_point = [-0.9491, 0.2615];
zoom = 0.30;
for frame = 1:25
    pause(0.000001) % To show frame
    re_range = re_limits(2) - re_limits(1);
    im_range = im_limits(2) - im_limits(1);
    for y = 1:res
        for x = 1:res
            re = re_limits(1) + re_range / res * x;
            im = im_limits(1) + im_range / res * y;
            c = re + 1i * im;
            z = 0;
            n = 0;
            while n <= max_iterations && abs(z) < 2
                z = z^2 + c;
                n = n + 1;
            end
            pixels.CData(y,x) = n;
        end
    end
    re_limits = zoom_point(1)*[1, 1] + ((1-zoom)*re_range/2)*[-1, 1];
    im_limits = zoom_point(2)*[1, 1] + ((1-zoom)*im_range/2)*[-1, 1];
end
