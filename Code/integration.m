vi = VideoReader('videos\movingDot.mp4');
videoArray = read(vi);
frameOri = vi.FrameRate;
n = size(videoArray, 4);

vw = VideoWriter('test_compressed.mp4', 'MPEG-4');
vw.FrameRate = frameOri/6;
open(vw);

for i = 1:n
    idx = (i-1)*6 + (1:6);
    grp = double(videoArray(:,:,:,idx));
    out = double(sum(grp, 4)/6);
    resizedImg = imresize(out, [144, 256]);
    writeVideo(vw, resizedImg);
end

close(vw);