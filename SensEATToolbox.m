function varargout = SensEATToolbox(varargin)
% SENSEATTOOLBOX MATLAB code for SensEATToolbox.fig
%      SENSEATTOOLBOX, by itself, creates a new SENSEATTOOLBOX or raises the existing
%      singleton*.
%
%      H = SENSEATTOOLBOX returns the handle to a new SENSEATTOOLBOX or the handle to
%      the existing singleton*.
%
%      SENSEATTOOLBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SENSEATTOOLBOX.M with the given input arguments.
%
%      SENSEATTOOLBOX('Property','Value',...) creates a new SENSEATTOOLBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SensEATToolbox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SensEATToolbox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SensEATToolbox

% Last Modified by GUIDE v2.5 17-Aug-2020 01:05:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SensEATToolbox_OpeningFcn, ...
                   'gui_OutputFcn',  @SensEATToolbox_OutputFcn, ...
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


% --- Executes just before SensEATToolbox is made visible.
function SensEATToolbox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SensEATToolbox (see VARARGIN)

% Choose default command line output for SensEATToolbox
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');
% UIWAIT makes SensEATToolbox wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SensEATToolbox_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global r_peak_pos_last; global q_peak_pos_last; global p_peak_pos_last;
global t_peak_pos_last; global t_peak_start_pos; global t_peak_final_pos; global p_peak_start_pos;
global p_peak_final_pos; global s_peak_pos_last; 

BB=horzcat(p_peak_start_pos, p_peak_pos_last, p_peak_final_pos, q_peak_pos_last, r_peak_pos_last, s_peak_pos_last, t_peak_start_pos, t_peak_pos_last, t_peak_final_pos);

filename = 'ECG Parameters.xlsx';
ponsetText={'P peak onset';BB(1:length(p_peak_start_pos))'};
xlswrite(filename,ponsetText,1,'A1')
xlswrite(filename,ponsetText{2,1},1,'A2')
ppeakText={'P peak ';BB(length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last))'};
xlswrite(filename,ppeakText,1,'B1')
xlswrite(filename,ppeakText{2,1},1,'B2')
poffsetText={'P peak offset ';BB(length(p_peak_pos_last)+length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last)+length(p_peak_final_pos))'};
xlswrite(filename,poffsetText,1,'C1')
xlswrite(filename,poffsetText{2,1},1,'C2')
qpointText={'Q point ';BB(length(p_peak_final_pos)+length(p_peak_pos_last)+length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last)+length(p_peak_final_pos)+length(q_peak_pos_last))'};
xlswrite(filename,qpointText,1,'D1')
xlswrite(filename,qpointText{2,1},1,'D2')
rpeakText={'R peak ';BB(length(q_peak_pos_last)+length(p_peak_final_pos)+length(p_peak_pos_last)+length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last)+length(p_peak_final_pos)+length(q_peak_pos_last)+length(r_peak_pos_last))'};
xlswrite(filename,rpeakText,1,'E1')
xlswrite(filename,rpeakText{2,1},1,'E2')
spointText={'S point ';BB(length(r_peak_pos_last)+length(q_peak_pos_last)+length(p_peak_final_pos)+length(p_peak_pos_last)+length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last)+length(p_peak_final_pos)+length(q_peak_pos_last)+length(r_peak_pos_last)+length(s_peak_pos_last))'};
xlswrite(filename,spointText,1,'F1')
xlswrite(filename,spointText{2,1},1,'F2')
tpeakonsetText={'T peak onset ';BB(length(s_peak_pos_last)+length(r_peak_pos_last)+length(q_peak_pos_last)+length(p_peak_final_pos)+length(p_peak_pos_last)+length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last)+length(p_peak_final_pos)+length(q_peak_pos_last)+length(r_peak_pos_last)+length(s_peak_pos_last)+length(t_peak_start_pos))'};
xlswrite(filename,tpeakonsetText,1,'G1')
xlswrite(filename,tpeakonsetText{2,1},1,'G2')
tpeakText={'T peak ';BB(length(t_peak_start_pos)+length(s_peak_pos_last)+length(r_peak_pos_last)+length(q_peak_pos_last)+length(p_peak_final_pos)+length(p_peak_pos_last)+length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last)+length(p_peak_final_pos)+length(q_peak_pos_last)+length(r_peak_pos_last)+length(s_peak_pos_last)+length(t_peak_start_pos)+length(t_peak_pos_last))'};
xlswrite(filename,tpeakText,1,'H1')
xlswrite(filename,tpeakText{2,1},1,'H2')
tpeakoffsetText={'T peak offset';BB(length(t_peak_pos_last)+length(t_peak_start_pos)+length(s_peak_pos_last)+length(r_peak_pos_last)+length(q_peak_pos_last)+length(p_peak_final_pos)+length(p_peak_pos_last)+length(p_peak_start_pos)+1:length(p_peak_start_pos)+length(p_peak_pos_last)+length(p_peak_final_pos)+length(q_peak_pos_last)+length(r_peak_pos_last)+length(s_peak_pos_last)+length(t_peak_start_pos)+length(t_peak_pos_last)+length(t_peak_final_pos))'};
xlswrite(filename,tpeakoffsetText,1,'I1')
xlswrite(filename,tpeakoffsetText{2,1},1,'I2')


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global exhale_pos_last; global inhale_pos3;

CC=horzcat(exhale_pos_last,inhale_pos3);

filename = 'Breathing Parameters.xlsx';
exhaleText={'Exhale Points';CC(1:length(exhale_pos_last))'};
xlswrite(filename,exhaleText,1,'A1')
xlswrite(filename,exhaleText{2,1},1,'A2')
inhaleText={'Inhale Points';CC(length(exhale_pos_last)+1:length(exhale_pos_last)+length(inhale_pos3))'};
xlswrite(filename,inhaleText,1,'B1')
xlswrite(filename,inhaleText{2,1},1,'B2')

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global weightdata;
[FileName,PathName] = uigetfile('*.mat','Select mat file');
if FileName==0,
return;
end
MatFile=load(fullfile(PathName,FileName));   %# pass file path as string
Structname = fieldnames(MatFile);
assignin('base', 'foodintake', MatFile.(Structname{1}));
weightdata = MatFile.(Structname{1});

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xalt3; global xust3; global weightdata;
axes(handles.axes3);
xalt3 = str2double(get(handles.edit7,'String'));
xust3 = str2double(get(handles.edit8,'String'));
if ( isnan(xalt3) == 1 || isnan(xust3) == 1 )
    msgbox('Please enter limit values!');
end
if ( (xalt3 < 0)|| (xalt3> length(weightdata)) )
    msgbox('Please set x limits carefully!');
end
if ( (xust3 < 0) || (xust3< xalt3) )
    msgbox('Please set x limits carefully!');
end
if ( isnan(xalt3) == 0 && isnan(xust3) == 0 )
xlim([xalt3 xust3])
end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xalt2; global xust2; global respiratoryRecording_2;
axes(handles.axes2);
xalt2 = str2double(get(handles.edit5,'String'));
xust2 = str2double(get(handles.edit6,'String'));
if ( isnan(xalt2) == 1 || isnan(xust2) == 1 )
    msgbox('Please enter limit values!');
end
if ( (xalt2 < 0)|| (xalt2> length(respiratoryRecording_2)) )
    msgbox('Please set x limits carefully!');
end
if ( (xust2 < 0) || (xust2< xalt2) )
    msgbox('Please set x limits carefully!');
end
if ( isnan(xalt2) == 0 && isnan(xust2) == 0 )
xlim([xalt2 xust2])
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nasaldata;
[FileName,PathName] = uigetfile('*.mat','Select mat file');
if FileName==0,
return;
end
MatFile=load(fullfile(PathName,FileName));   %# pass file path as string
Structname = fieldnames(MatFile);
assignin('base', 'breathingsignal', MatFile.(Structname{1}));
nasaldata = MatFile.(Structname{1});
axes(handles.axes2); cla;
plot(nasaldata);
xlabel('Samples');
ylabel('Nasal air-flow (°C)');

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ecgdata;
[FileName,PathName] = uigetfile('*.mat','Select mat file');
if FileName==0,
return;
end
MatFile=load(fullfile(PathName,FileName));   %# pass file path as string
Structname = fieldnames(MatFile);
assignin('base', 'ecgsignal', MatFile.(Structname{1}));
ecgdata = MatFile.(Structname{1});
axes(handles.axes1); cla;
plot(ecgdata);
xlabel('Samples');
ylabel('Amplitude (mV)');

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xalt; global xust; global ecgfiltered_last;
axes(handles.axes1);
xalt = str2double(get(handles.edit3,'String'));
xust = str2double(get(handles.edit4,'String'));
if ( isnan(xalt) == 1 || isnan(xust) == 1 )
    msgbox('Please enter limit values!');
end
if ( (xalt < 0)|| (xalt> length(ecgfiltered_last)) )
    msgbox('Please set x limits carefully!');
end
if ( (xust < 0) || (xust< xalt) )
    msgbox('Please set x limits carefully!');
end
if ( isnan(xalt) == 0 && isnan(xust) == 0 )
xlim([xalt xust])
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global D; global a2; global r_peak_pos_last; global q_peak_pos_last; global p_peak_pos_last;
global t_peak_pos_last; global t_peak_start_pos; global t_peak_final_pos; global p_peak_start_pos;
global p_peak_final_pos; global s_peak_pos_last; global ecgfiltered_last; global fs;

[c,l] = wavedec(ecgfiltered_last,8,'db6');
for t=1:8
    D(:,t)=wrcoef('d',c,l,'db6',t);
end
a2=wrcoef('a',c,l,'db6',2);
e1=D(:,3)+D(:,4)+D(:,5);
e2=(D(:,4).*(D(:,3)+D(:,5)))/2.^8;
R_Peak_Detect_Ecg=e1.*e2;
R_Peak_Detect_Ecg_Positive = zeros(1,length(R_Peak_Detect_Ecg));
for k=1:length(R_Peak_Detect_Ecg)   
if R_Peak_Detect_Ecg(k)>0
R_Peak_Detect_Ecg_Positive(k)=R_Peak_Detect_Ecg(k);
end
end
last_ecg=R_Peak_Detect_Ecg_Positive;
threshold=max(last_ecg);
threshold=threshold*0.01;
r_peak=0;
x=ceil(fs/2);

for k=x:(length(last_ecg)-x)
        gecici=last_ecg(k-x+1:k+x);
        if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>threshold)
        r_peak(k) = last_ecg(k);
    end
end
r_peak_pos=find(r_peak>0);
for j=1:length(r_peak_pos)-1
    if(abs(r_peak_pos(j)-r_peak_pos(j+1))<=20) 
        if(r_peak(r_peak_pos(j))>r_peak(r_peak_pos(j+1)))
        r_peak(r_peak_pos(j+1))=0;
        elseif(r_peak(r_peak_pos(j))<r_peak(r_peak_pos(j+1)))
            r_peak(r_peak_pos(j))=0;
        end
    end
        
end
t=find(r_peak>0);
r_peak_pos=t;

r_peak_last=zeros(1,length(last_ecg));
for t=1:length(r_peak_pos)
    mt3=ecgfiltered_last(r_peak_pos(t)-23:r_peak_pos(t)+23);
    mn3=max(mt3);
    r_peak_last(find(mt3==mn3)+r_peak_pos(t)-24)=mn3;
end
r_peak_pos_last=find(r_peak_last>0);

for i=1:length(r_peak_pos_last)-1
if((r_peak_pos_last(i+1)-r_peak_pos_last(i))<150) & (ecgfiltered_last(r_peak_pos_last(i+1))>ecgfiltered_last(r_peak_pos_last(i)))
        r_peak_pos_last(i)= [];
    else if(((r_peak_pos_last(i+1)-r_peak_pos_last(i))<150) & (ecgfiltered_last(r_peak_pos_last(i+1))<ecgfiltered_last(r_peak_pos_last(i))))
                r_peak_pos_last(i+1)= [];
        end
    end
end
hv=ones(1,length(ecgfiltered_last));
s_peak=sqrt(-1)*hv;
q_peak=s_peak;

for k=1:length(r_peak_pos_last)
    mt=ecgfiltered_last(r_peak_pos_last(k):r_peak_pos_last(k)+25);
    mn=min(mt);
    s_peak(find(mt==mn)+r_peak_pos_last(k)-1)=mn;
end
s_peak_pos_last=find(s_peak~=sqrt(-1));

for m=1:length(r_peak_pos_last)
    mt2=ecgfiltered_last(r_peak_pos_last(m)-25:r_peak_pos_last(m));
    mn2=min(mt2);
    q_peak(r_peak_pos_last(m)-25-1+find(mt2==mn2))= mn2;
end
q_peak_pos_last=find(q_peak~=sqrt(-1));
e4=D(:,4)+D(:,5)+D(:,6)+D(:,7)+D(:,8);

t_peak=hv*sqrt(-1);
for t=1:length(s_peak_pos_last)
    mt6=e4(s_peak_pos_last(t):s_peak_pos_last(t)+80);
    mn6=max(mt6);
    t_peak(find(mt6==mn6)+s_peak_pos_last(t)-1)=mn6;
end
t_peak_pos=find(t_peak~=sqrt(-1));

t_peak_last=hv*sqrt(-1);

for t=1:length(t_peak_pos)
    mt9=ecgfiltered_last(t_peak_pos(t)-3:t_peak_pos(t)+3);
    mn9=max(mt9);
    in = find(mt9==mn9);
    t_peak_last(in(1)+t_peak_pos(t)-4)=mn9;
end

t_peak_pos_last = find(t_peak_last~=sqrt(-1));

% for x=1:length(t_peak_pos_last)
% if(r_peak_pos_last(x+1)-t_peak_pos_last(x)<(ceil(fs/bpm)*6))
%     t_peak_last(t_peak_pos_last(x))=0;
% mt13=ecgfiltered_last(s_peak_pos_last(x):s_peak_pos_last(x)+(ceil(fs/bpm)*8));
% mn13=max(mt13);
% in=find(mt13==mn13);
% t_peak_last(in(1)+s_peak_pos_last(x)-1)=mn13;
% end
% end
% t_peak_pos_last = find(t_peak_last~=sqrt(-1));

p_peak=hv*sqrt(-1);

for p=2:length(q_peak_pos_last)
    mt10=e4(q_peak_pos_last(p)- 45:q_peak_pos_last(p));
    mn10=max(mt10);
    p_peak(find(mt10==mn10)+q_peak_pos_last(p)-45-1)=mn10;
end

p_peak_pos=find(p_peak~=sqrt(-1));

p_peak_last=hv*sqrt(-1);

for p=1:length(p_peak_pos)
    mt11=ecgfiltered_last(p_peak_pos(p)- 3:p_peak_pos(p)+3);
    mn11=max(mt11);
    in = find(mt11==mn11);
    p_peak_last(in(1)+p_peak_pos(p)-3+1)=mn11;
end

p_peak_pos_last=find(p_peak_last~=sqrt(-1));
p_peak_start=hv*sqrt(-1);
for i=1:length(p_peak_pos_last)
    mt15=ecgfiltered_last(p_peak_pos_last(i)-30:p_peak_pos_last(i));
    mn15=min(mt15);
    in = find(mt15==mn15);
    p_peak_start(in(1)+p_peak_pos_last(i)-30-1)=mn15;
end
p_peak_start_pos=find(p_peak_start~=sqrt(-1));

%P Final
p_peak_final=hv*sqrt(-1);
for i=1:length(p_peak_pos_last)
    mt16=ecgfiltered_last(p_peak_pos_last(i):p_peak_pos_last(i)+15);
    mn16=min(mt16);
    in = find(mt16==mn16);
    p_peak_final(in(1)+p_peak_pos_last(i)-1)=mn16;
end
p_peak_final_pos=find(p_peak_final~=sqrt(-1));

for i=1:length(p_peak_pos_last)-1
    if(q_peak_pos_last(i+1)<=p_peak_final_pos(i))
        q_peak_pos_last(i+1)=q_peak_pos_last(i+1)+3;
        p_peak_final_pos(i)=p_peak_final_pos(i)-3;
    end
end

% T Final
t_peak_final=hv*sqrt(-1);
for i=1:length(t_peak_pos_last)
    mt18=ecgfiltered_last(t_peak_pos_last(i):t_peak_pos_last(i)+37);
    mn18=min(mt18);
    in = find(mt18==mn18);
    t_peak_final(in(1)+t_peak_pos_last(i)-1)=mn18;
end
t_peak_final_pos=find(t_peak_final~=sqrt(-1));

    t_peak_start=hv*sqrt(-1);   
for i=1:length(t_peak_pos_last)
    mt17=ecgfiltered_last(t_peak_pos_last(i)-45:t_peak_pos_last(i));
    mn17=min(mt17);
    in = find(mt17==mn17);
    t_peak_start(in(1)+t_peak_pos_last(i)-46)=mn17;
end
t_peak_start_pos=find(t_peak_start~=sqrt(-1));  
axes(handles.axes1); cla;
hold on;
plot(ecgfiltered_last)
plot(r_peak_pos_last,ecgfiltered_last(r_peak_pos_last),'r+','MarkerFaceColor','r')
plot(s_peak_pos_last,ecgfiltered_last(s_peak_pos_last),'r*','MarkerFaceColor','r')
plot(q_peak_pos_last,ecgfiltered_last(q_peak_pos_last),'r.','MarkerFaceColor','r')
plot(p_peak_start_pos,ecgfiltered_last(p_peak_start_pos),'k+','MarkerFaceColor','r')
plot(p_peak_pos_last,ecgfiltered_last(p_peak_pos_last),'k*','MarkerFaceColor','r')
plot(p_peak_final_pos,ecgfiltered_last(p_peak_final_pos),'k.','MarkerFaceColor','r')
plot(t_peak_start_pos,ecgfiltered_last(t_peak_start_pos),'b+','MarkerFaceColor','r')
plot(t_peak_pos_last,ecgfiltered_last(t_peak_pos_last),'b*','MarkerFaceColor','r')
plot(t_peak_final_pos,ecgfiltered_last(t_peak_final_pos),'b.','MarkerFaceColor','r')
legend({'Filtered signal','R peaks','S points', 'Q points', 'P onset', 'P peak', 'P offset'...
    ,'T onset', 'T peak', 'T offset'},'Location','southeast')
% legend('boxoff')
xlabel('Samples');
ylabel('Amplitude (mV)');
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ecgdata; global ecgfiltered_last; global fs; global bpm; 
fs=400;
bpm=60;
ecg_signal=ecgdata-mean(ecgdata);
[c,l]=wavedec(ecg_signal,8,'db6');
a8 = wrcoef('a',c,l,'db6',8);
ecgcorrected=ecg_signal-a8;
fl=20;  % lower and upper cutoff freqs
wcl=2*fl/fs;
% faxes=linspace(-fs/2,fs/2,length(ecgsignal));
% plot(faxes,fftshift(abs(fft(ecgsignal))));
% axis([0 100 0 4e6])
N=50;
wn=[wcl];
b=fir1(N,wn,hamming(N+1)); %notch filter with hamming window
% [h,w]= freqz(b,1,256);
% j=1:length(ecgcorrected);
iv=zeros(1,N); %initialization vector for all taps to zero
ecgfiltered_last=filter(b,1,ecgcorrected,iv);
ecgfiltered_last = sgolayfilt(ecgfiltered_last,3,11);
% figure; plot(ecgsignal/max(ecgsignal)); title('Raw signal');
% figure; plot(ecgfiltered_last/max(ecgfiltered_last)); title('Filtered signal');
ecgfiltered_last=ecgfiltered_last/max(ecgfiltered_last);

axes(handles.axes1); cla;
% plot((0:length(ecgfiltered_last)-1)/400,ecgfiltered_last)
plot(ecgfiltered_last)

xlabel('Samples');
ylabel('Amplitude (mV)');

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global peaks; global respiratoryRecording_2; global exhale_pos_last; global inhale_pos3;
peaks=respiratoryRecording_2;
threshold=max(peaks);
threshold=threshold/4;
% beatcount=0;
% beatcount1=0;
exhale=0;
x=250;

for k=x:(length(peaks)-x)
        gecici=peaks(k-x+1:k+x);
        if(gecici(ceil(length(gecici)/2))==max(gecici) & gecici(ceil(length(gecici)/2))>threshold)

        exhale(k) = peaks(k);
    end
end
exhale_pos=find(exhale>0);
for j=1:length(exhale_pos)-1
    if(abs(exhale_pos(j)-exhale_pos(j+1))<=1000) 
        if(exhale(exhale_pos(j))>exhale(exhale_pos(j+1)))
        exhale(exhale_pos(j+1))=0;
        elseif(exhale(exhale_pos(j))<exhale(exhale_pos(j+1)))
            exhale(exhale_pos(j))=0;
%             beatcount1=beatcount1+1;
        end
    end
        
end
t=find(exhale>0);
exhale_pos_last=t;

hv=ones(1,length(respiratoryRecording_2));
inhale=sqrt(-1)*hv;
inhale2=sqrt(-1)*hv;

sbeatcount=0;
for k=1:length(exhale_pos_last)-1
    mt=respiratoryRecording_2(exhale_pos_last(k):exhale_pos_last(k)+1500);
    mn=min(mt);
    inhale(find(mt==mn)+exhale_pos_last(k)-1)=mn;
%     sbeatcount=sbeatcount+1;
end
inhale_pos=find(inhale~=sqrt(-1));
inhale_last=hv*sqrt(-1);

for k=2:length(exhale_pos_last)
    mt=respiratoryRecording_2(exhale_pos_last(k)-350:exhale_pos_last(k));
    mn=min(mt);
    inhale2(find(mt==mn)+exhale_pos_last(k)-351)=mn;
%     sbeatcount=sbeatcount+1;
end
inhale_pos2=find(inhale2~=sqrt(-1));
inhale_last2=hv*sqrt(-1);
inhale_pos3=sort([inhale_pos,inhale_pos2]);

for i=1:length(inhale_pos3)-1
    if(inhale_pos3(i+1)-inhale_pos3(i)<500)
        inhale_pos3(i+1)=0;
    end
end
indexofspos3=find(inhale_pos3>0);
inhale_pos3=inhale_pos3(indexofspos3(1:end));

for k=1:length(inhale_pos3)
    while(respiratoryRecording_2(inhale_pos3(k))>respiratoryRecording_2(inhale_pos3(k)+1))
        inhale_pos3(k)=inhale_pos3(k)+1;
    end
end

sayac=0;
for abc=1:length(exhale_pos_last)-1
if(find((exhale_pos_last(abc+1)-exhale_pos_last(abc)>3000))>0)
    sayac=abc
end
end

axes(handles.axes2); cla;
hold on
plot(respiratoryRecording_2)
plot(exhale_pos_last,respiratoryRecording_2(exhale_pos_last),'r+','MarkerFaceColor','r')
plot(inhale_pos3,respiratoryRecording_2(inhale_pos3),'r*','MarkerFaceColor','r')
txt = {'+ Apnea'}
text(inhale_pos3(sayac),respiratoryRecording_2(inhale_pos3(sayac)),txt)
txt2 = {'+'}
text(inhale_pos3(sayac+1),respiratoryRecording_2(inhale_pos3(sayac+1)),txt2)

legend('Filtered data','Exhale Peaks','Inhale Troughs');
xlabel('Samples');
ylabel('Normalized air-flow amplitude');


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nasaldata; global respiratoryRecording_2; global fs;

respiratoryRecording=nasaldata-mean(nasaldata);
[c,l]=wavedec(respiratoryRecording,16,'sym8');
a16 = wrcoef('a',c,l,'sym8',16);
respiratoryRecording_=respiratoryRecording-a16;
fl=0.1; fu=0.5; % lower and upper cutoff freqs
wcl=2*fl/fs;
wcu=2*fu/fs;
N=100;
wn=[wcl wcu];
b=fir1(N,wn,'bandpass',hann(N+1)); %notch filter with hamming window
% [h,w]= freqz(b,1,256);
% j=1:length(respiratoryRecording_);
iv=zeros(1,N); %initialization vector for all taps to zero
respiratoryRecording_1=filter(b,1,respiratoryRecording_,iv);
respiratoryRecording_2 = smoothdata(respiratoryRecording_1,'SmoothingFactor',0.01);
axes(handles.axes2); cla;
plot(respiratoryRecording_2);
xlabel('Samples');
ylabel('Normalized air-flow amplitude');

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global weightdata; global onsetPoints;

sayac=1;
onsetPoints=[];
for i=1:length(weightdata)-1
    if((weightdata(i)-weightdata(i+1))> mean(weightdata))
        onsetPoints(sayac)=i
        sayac=sayac+1;
    else if(-(weightdata(i)-weightdata(i+1))> mean(weightdata))
            onsetPoints(sayac)=i+1
            sayac=sayac+1;
        end
    end
end
axes(handles.axes3); cla;
hold on;
plot(weightdata)
for i=1:length(onsetPoints)
plot(onsetPoints(i),weightdata(onsetPoints(i)),'r+','MarkerFaceColor','r')
end   
txt = ['+ food consumption is = ' num2str(weightdata(onsetPoints(1))-weightdata(onsetPoints(end))) 'kilograms'];
text(onsetPoints(1),weightdata(onsetPoints(1)),txt)
txt2 = {'+'}
text(onsetPoints(end),weightdata(onsetPoints(end)),txt2)
% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global weightdata;
axes(handles.axes3); cla;
plot(weightdata);
xlabel('Samples');
ylabel('Consumption (kilograms)');

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);
cla;
legend boxoff
% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
cla;
legend boxoff                
% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;
legend boxoff                
