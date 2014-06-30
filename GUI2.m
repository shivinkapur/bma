function varargout = GUI2(varargin)
% GUI2 MATLAB code for GUI2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2

% Last Modified by GUIDE v2.5 17-Apr-2013 13:44:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before GUI2 is made visible.
function GUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2 (see VARARGIN)

% Choose default command line output for GUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using GUI2.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes GUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;
load dsplots2.mat;
load dsplots7.mat;
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
       plot(DScomputations,'DisplayName','DScomputations','YDataSource','DScomputations');figure(gcf);
       legend('DS Computations');
       xlabel('Frame Number');
       ylabel('Average number of Computations');
       
    case 2
       plot(DSpsnr,'DisplayName','DSpsnr','YDataSource','DSpsnr');figure(gcf);
       legend('DS PSNR');
         xlabel('Frame Number');
       ylabel('Peak Signal to Noise Ratio');
    case 3
       plot(ARPScomputations,'DisplayName','ARPScomputations','YDataSource','ARPScomputations');figure(gcf);
        legend('ARPS Computations');
          xlabel('Frame Number');
       ylabel('Average number of Computations');
    case 4
        plot(ARPSpsnr,'DisplayName','ARPSpsnr','YDataSource','ARPSpsnr');figure(gcf);
         legend('ARPS PSNR');
          xlabel('Frame Number');
       ylabel('Peak Signal to Noise Ratio');
    case 5
        plot(ARPSZMPcomputations,'DisplayName','ARPSZMPcomputations','YDataSource','ARPSZMPcomputations');figure(gcf);
         legend('ARPS-ZMP Computations ');
           xlabel('Frame Number');
       ylabel('Average number of Computations');
    case 6
       plot(ARPSZMPpsnr,'DisplayName','ARPSZMPpsnr','YDataSource','ARPSZMPpsnr');figure(gcf);
        legend('ARPS-ZMP PSNR');
         xlabel('Frame Number');
       ylabel('Peak Signal to Noise Ratio');
    case 7
       plot(DScomputations,'DisplayName','DScomputations','YDataSource','DScomputations');hold all;plot(ARPScomputations,'DisplayName','ARPScomputations','YDataSource','ARPScomputations');hold off;figure(gcf);   
        legend('DS Computations','ARPScomputations');
          xlabel('Frame Number');
       ylabel('Average number of Computations');
    case 8
       plot(DSpsnr,'DisplayName','DSpsnr','YDataSource','DSpsnr');hold all;plot(ARPSpsnr,'DisplayName','ARPSpsnr','YDataSource','ARPSpsnr');hold off;figure(gcf);
        legend('DS PSNR','ARPS PSNR');
         xlabel('Frame Number');
       ylabel('Peak Signal to Noise Ratio');
    case 9
        plot(ARPScomputations,'DisplayName','ARPScomputations','YDataSource','ARPScomputations');hold all;plot(ARPSZMPcomputations,'DisplayName','ARPSZMPcomputations','YDataSource','ARPSZMPcomputations');hold off;figure(gcf);
         legend('ARPS Computations','ARPS-ZMP Computations');
           xlabel('Frame Number');
       ylabel('Average number of Computations');
    case 10
        plot(ARPSpsnr,'DisplayName','ARPSpsnr','YDataSource','ARPSpsnr');hold all;plot(ARPSZMPpsnr,'DisplayName','ARPSZMPpsnr','YDataSource','ARPSZMPpsnr');hold off;figure(gcf);
         legend('ARPS PSNR','ARPS-ZMP PSNR');
          xlabel('Frame Number');
       ylabel('Peak Signal to Noise Ratio');
    case 11
        plot(DScomputations,'DisplayName','DScomputations','YDataSource','DScomputations');hold all;plot(ARPScomputations,'DisplayName','ARPScomputations','YDataSource','ARPScomputations');plot(ARPSZMPcomputations,'DisplayName','ARPSZMPcomputations','YDataSource','ARPSZMPcomputations');hold off;figure(gcf);
         legend('DS Computations','ARPS Computations','ARPS-ZMP Computations');
           xlabel('Frame Number');
       ylabel('Average number of Computations');
    case 12
        plot(DSpsnr,'DisplayName','DSpsnr','YDataSource','DSpsnr');hold all;plot(ARPSpsnr,'DisplayName','ARPSpsnr','YDataSource','ARPSpsnr');plot(ARPSZMPpsnr,'DisplayName','ARPSZMPpsnr','YDataSource','ARPSZMPpsnr');hold off;figure(gcf);   
         legend('DS PSNR','ARPS PSNR','ARPS-ZMP PSNR');
          xlabel('Frame Number');
       ylabel('Peak Signal to Noise Ratio');
    case 13
         plot(computationscalc,'DisplayName','computationscalc','YDataSource','computationscalc');figure(gcf)
         xlabel('Frame Number');
       ylabel('Average Number of Computations');
    case 14  
        plot(PSNRcalc,'DisplayName','PSNRcalc','YDataSource','PSNRcalc');figure(gcf)
         xlabel('Frame Number');
       ylabel('Peak Signal to Noise Ratio');
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'DS Computations', 'DS PSNR', 'ARPS Computations', 'ARPS PSNR', 'ARPS-ZMP Computations','ARPS-ZMP PSNR','DS vs ARPS Computations','DS vs ARPS PSNR','ARPS vs ARPS-ZMP Computations','ARPS vs ARPS-ZMP PSNR','DS vs ARPS vs ARPS-ZMP Computations','DS vs ARPS vs ARPS-ZMP PSNR','Computations','Peak Signal to Noise Ratio'});
