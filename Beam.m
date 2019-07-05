function varargout = Beam(varargin)
% BEAM MATLAB code for Beam.fig
%      BEAM, by itself, creates a new BEAM or raises the existing
%      singleton*.
%
%      H = BEAM returns the handle to a new BEAM or the handle to
%      the existing singleton*.
%
%      BEAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEAM.M with the given input arguments.
%
%      BEAM('Property','Value',...) creates a new BEAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Beam_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Beam_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Beam

% Last Modified by GUIDE v2.5 18-Nov-2018 13:00:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Beam_OpeningFcn, ...
                   'gui_OutputFcn',  @Beam_OutputFcn, ...
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

% --- Executes just before Beam is made visible.
function Beam_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Beam (see VARARGIN)

% Choose default command line output for Beam
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using Beam.
if strcmp(get(hObject,'Visible'),'off')
    
    
end

% UIWAIT makes Beam wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Beam_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
%function varargout = pushbutton5_Callback(h, eventdata, handles, varargin)
if isfield(handles,'figure1') & ishandle(handles.figure1),
    close(handles.figure1);
end
% Stub for Callback of the uicontrol handles.pushbutton5.
disp('Thank you for using !')



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

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Exit.
function Exit_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    fileID = fopen('F:\有限元悬臂梁\数据\10单元\10_unit_33nodes.txt');
    c=textscan(fileID,'%f');
    c=reshape(cell2mat(c),5,[]);
    c=c';
    fclose(fileID);
    %读取单元坐标
    fileID = fopen('F:\有限元悬臂梁\数据\10单元\10_unit_nodecor_origin.txt');
    e=textscan(fileID,'%f');
    e=reshape(cell2mat(e),3,[]);
    e=e';
    fclose(fileID);
    %基本参数
    E = 2e11;%弹性模量 modulus of elasticity
    NU = 0.3;% Poisson's ratio
    L = 0.4;
    d = 0.08;
    h = 0.01;
    ID = 2;
    %对应单元节点关系
    Element = cell(1,10);
    Ponits = cell(1,18);
    %Element{1}第一个单元 逆时针存储；Element{1}{1}1*8数组，存储4个节点的坐标
    for i=1:10
        Element{i}= {[e(c(i,2),2:3),e(c(i,3),2:3),e(c(i,4),2:3),e(c(i,5),2:3)]};
    end
    %计算单元矩阵
    Ke = cell(1,10);
    for i=1:10
        xi = Element{i}{1}(1);
        yi = Element{i}{1}(2);
        xj = Element{i}{1}(3);
        yj = Element{i}{1}(4);
        xm = Element{i}{1}(5);
        ym = Element{i}{1}(6);
        xp = Element{i}{1}(7);
        yp = Element{i}{1}(8);
        %Ke{i}{1}= Cantilever_Beam_Stiffness( E,NU,h,xi,yi,xj,yj,xm,ym,xp,yp,ID);
        %Ke{i}{1}= BilinearQuadElementStiffness( E,NU,h,xi,yi,xj,yj,xm,ym,xp,yp,ID);
        %Ke{i}{1} = stiffness3( E,NU,xi,yi,xj,yj,xm,ym,xp,yp);
        Ke{i}{1}= Cantilever_Beam_Stiffness2( E,NU,h,xi,yi,xj,yj,xm,ym,xp,yp,ID);
    end
    % 组装单元刚度矩阵
    KK = zeros(36);
    for i=1:10
        KK = Cantilever_Beam_Assembly(KK,Ke{i}{1},c(i,2),c(i,3),c(i,4),c(i,5));
    end
    
    %设置力边界条件
    fe = -4000/5;
    F = zeros(36,1);
    NO =[4,7,10,13];
    for i=1:length(NO)
        F(2*NO(i)) = fe;
    end
    F(2) = -400;
    F(32) = -400;
    %求解单元编号
    %根部固定 位移阵列1 2 3 4 5 6位移量为0 ，去掉刚度矩阵前6行和前6列，剩下的未知量都是节点位移，可以利用矩阵运算求解
    KK1 = KK(7:36,7:36);
    F1 = F(7:36,:);
    u = KK1\F1;%高斯消元法求解位移阵列
    %补全位移阵列 求解支反力
    U=zeros(36,1);
    for i= 1:30
        U(i+6)=u(i);
    end
    Fn = KK*U;%Final F
    M = 50;
    hold on
    for i = 1:1:10
        A = zeros(1,5);
        B = zeros(1,5);
        A1 = zeros(1,5);
        B1 = zeros(1,5);
        for j = 1:1:4
            A(j) = e(c(i,j+1),2);%原始xi,xj,xm,xp
            B(j) = e(c(i,j+1),3);%原始yi,yj,ym,yp
            A1(j) = A(j) + M*(U(2*c(i,j+1)-1));%位移后的x坐标
            B1(j) = B(j) + M*(U(2*c(i,j+1)));
        end
        A(5) = A(1);
        B(5) = B(1);
        A1(5) = A1(1);
        B1(5) = B1(1);
        plot(A,B,'k--','LineWidth',2);
        hold on;
        plot(A1,B1,'r','LineWidth',2);
        hold on;
    end
end