%Buddhabrot MATLAB Impementation © 2018 Duncan Rodriguez
%Attribution-NonCommercial-ShareAlike 4.0 International
clear all
tic
iter = 100;
iterand = 100;
boundary = [2,2,-2,-2];%+X,+Y,-X,-Y
xwall = abs(boundary(3));
ywall = abs(boundary(4));
xrange = boundary(1)-boundary(3);
yrange = boundary(2)-boundary(4);
res = 500;
resolution = [res,round(res*yrange/xrange)];
xbinsize = xrange/resolution(1);
ybinsize = yrange/resolution(2);
img = zeros(resolution(1),resolution(2));
crchaos = xbinsize*rand(iterand,1);
cichaos = ybinsize*rand(iterand,1);
imgtempr = zeros(iter,1);
imgtempi = zeros(iter,1);
for l = 1:resolution(1)
    for k = 1:resolution(2)
        ctempr = k*xbinsize+boundary(3);
        ctempi = l*ybinsize+boundary(4);
        for j = 1:iterand
            zr = 0;
            zi = 0;
            cr = ctempr + crchaos(j);
            ci = ctempi + cichaos(j);
            zrsqr = 0;
            zisqr = 0;
            for i = 1:iter
                zi = (zr+zi)^2 - zrsqr - zisqr + ci;
                zr = zrsqr - zisqr + cr;
                zrsqr = zr*zr;
                zisqr = zi^2;
                if zrsqr+zisqr>4
                    break;
                end
                imgtempr(i) = zr;
                imgtempi(i) = zi;
            end
            if i ~= iter
                ii=1;
                for ii = 1:i-1
                    t1 = int16((xwall+imgtempr(ii))/xbinsize+0.5);
                    t2= int16((ywall-imgtempi(ii))/ybinsize+0.5);
                    img(t1,t2) = img(t1,t2) + 1;
                end
            end
        end
    end
    l
end
imgg=floor(img./max(max(img))*255);
%figure
imshow(imgg,[0,255])
imwrite(imgg,gray(256),['Buddhabrot_',num2str(res),'px.tiff'])
display(num2str(toc))