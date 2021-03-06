function sys=calibconfig(name)
% CALIBCONFIG contains configuration information for the camera
% calibration. User may edit this file. 
%

% Copyright (C) 2004-2007 Juho Kannala
%
% This software is distributed under the GNU General Public
% Licence (version 2 or later); please refer to the file
% Licence.txt, included with the software, for details.

% first an example configuration
% DO NOT ALTER THIS!
if strcmp(name,'example_configuration')
  
  sys.gui=1; % set to 0 if the graphical user interface does not
             % work (Matlab 6)	     
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % The first 11 parameters are important only when 
  % the centroids of the circular control points are
  % to be extracted directly from the images 
  
  sys.nameprefix='image'; 
  sys.namesuffix='bmp';
  
  sys.numlen=2; % the number of letters in the image index
                % for example, if images are image001.bmp and 
		% image002.bmp then sys.numlen=3
  sys.minidx=1;
  sys.maxidx=10;
  sys.indexes=[1 3 5 10]; % if there are missing images you can
                          % explicitly give all the indeces
			  
  sys.blobcolor='white';  % colour of circular control points, 
                          % black or white
  
  sys.blobgapx=100;  % the distance between circles in the 
  sys.blobgapy=100;  % calibration plane in millimeters 
                     % (in x and y directions)   
  
  sys.grayscalew='gray';   % computation of the centroids,
                           % gray or binary
			   
  sys.circularimage='yes'; % yes or no, yes only for 
                           % circular image fish-eye lenses
                                 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  sys.cata=0; % usually 0, change to 1 for such catadioptric cameras 
              % which reverse the handedness of coordinates on the calibration
              % plane due to the mirroring effect
  sys.blobradius=0;  % radius of the circular control points in mm
                     % if the "points" are really points then 0
  sys.projtype='equidistance'; % perspective, stereographic, 
                               % equidistance, equisolidangle,
			       
  sys.model='basic';  % basic, radial or extended
  sys.focal=1.178;    % nominal focal length in millimeters
  sys.viewfield=180;  % 2*\theta_{max} in degrees
  sys.pixelp=[]; % values for the parameters m_u m_v u_0 v_0 
                 % leave empty if sys.circularimage='yes'
		 
  return;
end

%% some examples: 

%
if strcmp(name,'pattern_16_9')
  sys.gui=1;
  sys.nameprefix='image_';
  sys.namesuffix='jpg';
  sys.numlen=1;
  sys.indexes=[1 2 3];
  sys.minidx=1;
  sys.maxidx=3;
  sys.blobcolor='white';
  sys.blobradius=2;
  sys.blobgapx=7.6;
  sys.blobgapy=7.6;
  sys.grayscalew='gray';
  sys.circularimage='no';
  sys.projtype='perspective';
  sys.model='basic';
  sys.focal=1;
  sys.viewfield=(60)*2;
  sys.pixelp=[500 500 1024/2 768/2];
  sys.cata=0;
  return;
end

if strcmp(name,'pattern_4_3')
  sys.gui=1;
  sys.nameprefix='image_';
  sys.namesuffix='jpg';
  sys.numlen=1;
  sys.indexes=[1 2 3];
  sys.minidx=1;
  sys.maxidx=3;
  sys.blobcolor='white';
  sys.blobradius=2.5;
  sys.blobgapx=7.75;
  sys.blobgapy=7.75;
  sys.grayscalew='gray';
  sys.circularimage='no';
  sys.projtype='perspective';
  sys.model='basic';
  sys.focal=1;
  sys.viewfield=(60)*2;
  sys.pixelp=[500 500 1024/2 768/2];
  sys.cata=0;
  return;
end


error('The requested setup data was not found. See calibconfig.m');
