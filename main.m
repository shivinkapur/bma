
clear all
close all
clc
tic

readerobj = VideoReader('foreman.avi', 'tag', 'myreader1');
%movinfo=aviinfo('news.avi');
%noframe=movinfo.NumFrames
vidFrames = read(readerobj);
noframe = get(readerobj, 'NumberOfFrames');
      for k = 1 : noframe
            mov(k).cdata = vidFrames(:,:,:,k);
            mov(k).colormap = [];
      end
      
  for k=1: noframe
      framedata=read(readerobj,k);
      imshow(framedata);  
  end
  