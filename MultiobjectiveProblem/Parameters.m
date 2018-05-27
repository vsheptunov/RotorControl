%������� ������������
r = 0.86;
%���������� ���������� 
%global A;

%���������
m = 13.5;       %����� ������
S0 = 0.0006;    %�����
It = 1.4;       %����������� �� ����
L0 = 0.007;     %������������� ���
l1 = 0.3;       %��������� �� �������� �� �� ������ ���� ������
l2 = 0.3;       %��������� �� ������� �� �� ������ ���� ������
J = 0.756*3;    %������ ������� ������������ ���� x � y
Jz = 0.0269;    %������ ������� ������������ ��� z 
w = 523.6;      %�������� 

T = sqrt((8*m*(S0)^2)/(L0*(It)^2)); %����� 
l0 = (l1+l2)/2;                     %��������� ������� ��� �� ������ ���� ������
m1 = (m*l1*l0)/J;
m2 = (m*l2*l0)/J;
p0 = (Jz*T*w)/J;
tau = (m*l0)/J;
s1 = l1/l0;
s2 = l2/l0;

%������� ������� A = [[0;0] [I;G]]
G = [[0;p0;0;0] [-p0;0;0;0] [0;0;0;0] [0;0;0;0]];
I = eye(4);
I1 = eye(4);
I2 = eye(4);
I3 = 1;
I4 = 1;
A = [[zeros(4);zeros(4)] [I;G]];

%������� ������� Bu = [ [I] [Bu_annex] ] / Bu_annex is Bu'
%Bu_annex = [ [-m1; 0; 0; 1] [m2; 0; 0; 0] [0; m1; 0; 0] [0; -m2; 0; 1]];
Bu_annex = [ [-m1; 0; 0; 0] [m2; 0; 0; 0] [0; m1; 0; 0] [0; -m2; 0; 0]];
Bu = [I; Bu_annex]; 

%������� ������� Bv = [ [I] [Bv_annex] ] / Bv_annex is Bv'
Bv_annex = [ [tau; 0; 0; 0] [0; tau; 0; 0] [0; 0; 1; 0] [0; 0; 0; 1]]; 
Bv = [I; Bv_annex];
%Bv = Bv_annex;

%������� P
P = [[0; 0; -s1; s2] [s1; -s2; 0; 0] [1; 1; 0; 0] [0; 0; 1; 1] ];

%������� �1 � �2
C1 = [P zeros(4)];
C2 = zeros([4 8]);

%������� D1 � D2
D1 = zeros([4 4]);
D2 = I;

alpha1 = 0.3;
alpha2 = 0.7;







%������� ������� B = [[0] [B1]]
%B1 = [[-m1;0;0;1] [m2;0;0;1] [0;m1;1;0] [0;-m2;1;0]];
%B = [zeros(4); B1];

%������� P1 and P2
%P1 = [[s1^2;0;0;-s1] [0;s1^2;s1;0] [0;s1;1;0] [-s1;0;0;1]];
%P2 = [[s2^2;0;0;s2] [0;s2^2;-s2;0] [0;-s2;1;0] [s2;0;0;1]];

%������� �i i = {1,2,3,4,5,6};
%C1 = [sqrtm(P1) zeros(4)];
%C2 = [sqrtm(P2) zeros(4)];
%C3 = 0;
%C4 = 0;
%C5 = 0;
%C6 = 0;
%C3 = zeros([4 8]);
%C4 = zeros([4 8]);
%C5 = zeros([4 8]);
%C6 = zeros([4 8]);
%C3 = zeros([1 8]);
%C4 = zeros([1 8]);
%C5 = zeros([1 8]);
%C6 = zeros([1 8]);

%������� Di i = {1,2,3,4,5,6};
%D1 = zeros([4 4]);
%D2 = zeros([4 4]);
%D1 = 0;
%D2 = 0;
%D3 = [1 0 0 0];
%D4 = [0 1 0 0];
%D5 = [0 0 1 0];
%D6 = [0 0 0 1];

%������� J0
%J0 = [I zeros(4)];


