function varargout = MainGui(varargin)
% MAINGUI MATLAB code for MainGui.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES


% Edit the above text to modify the response to help MainGui

% Last Modified by GUIDE v2.5 20-Apr-2013 19:30:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGui_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGui_OutputFcn, ...
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

% --- Executes just before MainGui is made visible.
function MainGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainGui (see VARARGIN)

% Choose default command line output for MainGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes MainGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainGui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% mass = handles.metricdata.density * handles.metricdata.volume;
% 
% set(handles.mass, 'String', mass);
% popup_sel_index =handles.contents;
disp(get(handles.choice, 'Value'));
popup_sel_index = get(handles.choice, 'Value');

switch popup_sel_index
    case 1    
        MainVideoCode(handles.filename,handles.threshold ,handles.noframes,popup_sel_index);  
         msgbox('Execution is complete','Finished','none');
         MainGui;
    case 2
       MainVideoCode(handles.filename,handles.threshold ,handles.noframes,popup_sel_index);  
       msgbox('Execution is complete','Finished','none');
       MainGui;
    case 3
        MainVideoCode(handles.filename,handles.threshold ,handles.noframes,popup_sel_index); 
        msgbox('Execution is complete','Finished','none');
        MainGui;
    case 4
        motionEstAnalysisVideo(handles.filename,handles.threshold ,handles.noframes); 
        msgbox('Execution is complete','Finished','none');
end
% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in unitgroup.


% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end



% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on key press with focus on density and none of its controls.
function density_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on calculate and none of its controls.
function calculate_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on si and none of its controls.
function si_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to si (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in choice.
function choice_Callback(hObject, eventdata, handles)
% hObject    handle to choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choice contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choice


% --- Executes during object creation, after setting all properties.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end


guidata(hObject,handles)
set(hObject, 'String', {'Diamond Search','ARPS Search','ARPS-ZMP Search','Comparative Analysis'});

function choice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Filename_Callback(hObject, eventdata, handles)
% hObject    handle to Filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Filename as text
%        str2double(get(hObject,'String')) returns contents of Filename as a double
filename = get(hObject, 'String');

handles.filename =filename;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function Filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function threshold_Callback(hObject, eventdata, handles)
% hObject    handle to threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of threshold as text
%        str2double(get(hObject,'String')) returns contents of threshold as a doublefilename = str2double(get(hObject, 'String'));

threshold = str2double(get(hObject, 'String'));
handles.threshold =threshold;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nofframes_Callback(hObject, eventdata, handles)
% hObject    handle to nofframes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nofframes as text
%        str2double(get(hObject,'String')) returns contents of nofframes as a doublefilename = str2double(get(hObject, 'String'));

noframes = str2double(get(hObject, 'String'));
handles.noframes =noframes;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function nofframes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nofframes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Filename and none of its controls.
function Filename_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Filename (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on threshold and none of its controls.
function threshold_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to threshold (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in analysisbutton.
function analysisbutton_Callback(hObject, eventdata, handles)
% hObject    handle to analysisbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GUI2;
