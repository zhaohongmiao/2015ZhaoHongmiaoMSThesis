f=imread('ayst.tif');
if ( strcmp(class(f),'uint8') == 1 )
    g = double(f)/255;
end
 gdct=dct2(g);
 imshow(gdct)
 imwrite(gdct,'dct.jpg');