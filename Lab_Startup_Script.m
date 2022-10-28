%created by: Christopher Andrew
%purpose: Loads the needed varribles into matlabs workspace to allow
%simulink to run


%motor Coefficients
B = 7.1600e-05                   %Friction Coefficient
La =  1.16*10^(-3)               %Inductance
Km = 42*10^(-3)                  %Torque Constant
Kb = 13.2/(3000*2*pi/60)         %Back EMF constant
Jm = 4 * 10 ^ (-6)               %motor inertia
Ra = 8.4                         %terminal resistance

%linear motion parameters
Bs =  (2000*pi*0.9)/(10) % torque to linear force
Bsd = 0.01298                 %diameter of the ball screw
BS_length = 6                %ball screw length in meters 
VBs = BS_length*(Bsd/2)^2    %volume of ball screw rod
MBs = VBs * 7700             %mass of ball screw rod
JBs = MBs*0.5*(Bsd/2)^2      %inertia of ball screw assembly

%cart parameters
M =  1                           %Cart Mass
Jc = ((0.25*0.25^3)/12)*M        %cart inertia

%Rod parameters
m =  0.05                        %rod mass
l =  0.1                        %pendulum half size
Jr = (1/3)*m*(l*2)^2               %rod inertia, may be wrong look more

%wheel parameters
wR = 0.11                       %wheel radius, rod position at vertical is just 
                                  %inside this
Mw = 0.001*(wR)^2*pi*200 % mass of the wheel in Kg, assumed to be
                                    %carboard
numSection = 4         %number of sections in the wheel
openSec = 0.07         % The percentage of a quarter that is open %0.2 best
RPM = 3*60                %speed of the wheel in revolutions per second
pinDistance = 2        %pinwheel distance from origin
Jw = 0.5*Mw*wR^2       %inertia of the wheel
Bw = 7.1700e-05         %wheel motor friction coefficient


%Other Parameters
Mt = M  + m            %total mass of the cart
%Jt = Jm + Jc + Jr           %total Inirtia
g = 9.8                %acceleration due to gravity

distance = 4           %distance from the origin that must be traveled
timeToWheel = 3.825   %magic number from prevous runs. time till the cart
                        %reaches the wheel, used to determin the start
                        %delay
startDelay = (1/(RPM/60))*(1/numSection)*(1+openSec*0.5) - mod(timeToWheel,(1/(RPM/60))*(1/numSection))