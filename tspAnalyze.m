% TSPANALYZE  Geomatics and the Travelling Sales[person] Problem
%
% According to the ISO/TC 211, geomatics is the "discipline concerned
% with the collection, distribution, storage, analysis, processing, [and]
% presentation of geographic data or geographic information." Geomatics
% is associated with the travelling salesman problem (TSP), a fundamental
% computing problem. In this lab assignment, a University of Alberta
% student completes a MATLAB program to analyze, process, and present
% entries, stored in a MATLAB data file, of the TSPLIB, a database
% collected and distributed by the University of Heidelberg.

%{
    Copyright (c) 2021, University of Alberta
    Electrical and Computer Engineering
    All rights reserved.

    Student name: Rishi Bhatnagar
    Student CCID: rbhatna1
    Others: {Rishi Bhatnagar- 100%}

    To avoid plagiarism, list the names of persons, other than a lecture
    instructor, whose code, words, ideas, or data you used. To avoid
    cheating, list the names of persons, other than a lab instructor or
    teaching assistant (TA), who provided compositional assistance.

    After each name, including the student's, enter in parentheses an
    estimate of the person's contributions in percent. Without these
    numbers, adding to 100%, follow-up questions may be asked.

    For anonymous sources, enter code names in uppercase, e.g., SAURON,
    followed by percentages as above. Email a link to or a copy of the
    source to the lab instructor before the assignment is due.
%}

%It 1st calls a function to present a menu and after selecting option-calls 
% other subfunctions, to produce computations on a structure loaded from
% file tspData.m saved as tsp
%Format to call: tspAnalyze

%Side effect: It calls other functions which has side effects
%Input arguments: No input argument 
%Output arguments: No output argument

function tspAnalyze

   
    type tspAbout.txt %Loads and displays the content from this file on command window
    load tspData tsp %To load data from tspData.mat and rename it as tsp

    choice=tspMenu; 
    %Calling a function which would display a menu and return choice of
    %the option selected in menu, to the variable choice.

    while choice ~= 0 
        %Keeps on running until user doesn't enter 0 to exit the program.

        switch choice 
            %Introduce a switch statement for variable-choice.

            case 1 %If choice is 1, this part runs

                tspPrint(tsp)
                %Calls the function which prints the number, filename, data
                %type, dimension, and comment for all entries of the
                %structure.

            case 2 %If choice is 2, this part runs

                tsp=tspLimit(tsp);
                %Calls a function which displays the maximum and minimum value 
                % of the dimension column of tsp and gets an input of limit 
                % which removes the entry from the structure, if the entered 
                % limit is greater than the value of dimension column of that coloumn. 


            case 3 %If choice is 3, this part runs

                tspPlot(tsp) 
                %If edge_weight_type column of entered numeric value is
                %'EUC_2D', then it plots a graph, otherwise just displays
                %invalid and program continues
        
        end %To terminate switch statement
        
        choice=tspMenu;
        %Calling a function which would display a menu and return choice of
        %the option selected in menu, to the variable choice.
        
        close % To close the figure

    end %To terminate while statement
end %To terminate the main function








%It display a menu and return choice of the option selected in menu, to a
%variable if choice entered is between 0 and 3(included), otherwise
%re-prompts user to enter a value, until proper value is not entered

%Format to call: choice=tspMenu

%Side effect: It prints text on command window(as shown in comments where
%it prints) {Specifically- prints a choice menu}, asks the user for a
%specific choice
%Input arguments: No input argument 
%Output arguments: choice

function choice=tspMenu

    disp(' ') %Display empty line on command window
    fprintf('MAIN MENU\n') %Display text on command window
    fprintf('0. Exit program\n') %Display text on command window
    fprintf('1. Print database\n') %Display text on command window
    fprintf('2. Limit dimension\n') %Display text on command window
    fprintf('3. Plot one tour\n') %Display text on command window
    disp(' ') %Display empty line on command window
    choice = nan;
    %Assigned it as Not a number, as it would be required to enter the while loop
    % ,initially so that the input statement appears.


    while errorchecking(choice,0,3)
        %Keeps on giving this prompt to enter a value until a proper value 
        %between 0 and 3 is not entered

        choice = input('Choice (0-3)? ');
        %Input statement to get the choice from the user
        
    end %Terminating while loop

end %Terminating the function statement








%It accepts a structure and prints the number, filename, data type,
% dimension and comment for all entries of the structure.

%Function to call: tspPrint(tsp)

%Side effect: It prints text on command window(as shown in comments where
%it prints) {Specifically- prints all the entries into the structure}
%Input arguments: tsp 
%Output arguments: No output argument

function tspPrint(tsp)

    disp(' ') %Display empty line on command window
    fprintf('NUM  FILE NAME  DATA TYPE  DIMENSION  COMMENT\n')
    %Display text on command window
    format = '%3d  %-9.9s  %-9.9s  %9d  %s\n';
    %Provides the format in which data should be displayed on command
    %window when used.

    for k = 1:numel(tsp)
        %k gets the value from 1 to the number of elements in the structure.
       
        name = tsp(k).name;
        %assigns the value asscociated with 'name' column of the structure
        %for that k value to a variable
        edge = tsp(k).edge_weight_type;
        %assigns the value asscociated with 'edge_weight_type' column 
        % of the structure for that k value to a variable
        dimension = tsp(k).dimension;
        %assigns the value asscociated with 'dimension' column 
        % of the structure for that k value to a variable
        comment = tsp(k).comment;
        %assigns the value asscociated with 'comment' column 
        % of the structure for that k value to a variable

        fprintf(format,k,name,edge,dimension,comment)
        %Displays the above variable in the format described above on
        %command window

    end %Terminating for loop

end %Terminating function statement










%It accepts a structure and asks user to input value, then calculates
%corresponding value in edge_weight_type column for structure. If that
%value is 'EUC_2D', then calls another function(to display graph),
%otherwise displays invalid and program continues.

%Function to call: tspPlot(tsp)

%Side effect: It prints text on command window(as shown in comments where
%it prints), asks the user for a valid number.
%Input arguments: tsp 
%Output arguments: No output argument

function tspPlot(tsp)

    num = input('Number (EUC_2D)? ');
    %Prompts user to enter a number

    length_tsp=length(tsp);

    while errorchecking(num,1,length_tsp)
        %Keeps on giving the prompt to enter a value until a proper value 

        num = input('Number (EUC_2D)? ');
        %Input statement to get the proper choice from the user
        
    end %Terminating while loop



    edge = tsp(num).edge_weight_type;
    %assigns the value asscociated with 'edge_weight_type' column of the structure 
    % for the above num value to a variable

    switch edge
        %Introduce switch statement for edge variable

        case 'EUC_2D'
            %If edge variable is EUC_2D, this part runs

            fprintf('See tspPlot.tif\n')
            %Displays text on command window

            tspPlotEUC2D(tsp(num));
            %Calls a function

        otherwise
            %If edge variable is not EUC_2D, this part runs

            fprintf('Invalid (%s)!!!\n',edge)
            %Displays text with edge value on command window


    end %Terminate switch statement

end %Terminate function Statement













%It displays a graph having title,legend,x-label and y-label. This function
% displays the plot as an image to a file- tspPlot.tif. It plots for the
% node co-ordinates, for the tsp1, which it had accepted in the function header. 

%Function to call: tspPlotEUC2D(tsp1)

%Side effect: It prints text on command window(as shown in comments where
%it prints), and prints a plot.
%Input arguments: tsp1
%Output arguments: No output argument

function tspPlotEUC2D(tsp1)

    len=double(tsp1.dimension); 
    %Dimension tells how many locations present/also tells number of x,y co-ordinates
    % present for that name. 
    
    x_starting=tsp1.node_coord(1,1); %Starting x co-ordinates for tsp1
    x_ending=tsp1.node_coord(len,1); %Ending y co-ordinates for tsp1
    x_net=[x_starting x_ending]; 
    %Starting and ending x co-ordinate for tsp1, saved in vector

    y_starting=tsp1.node_coord(1,2); %Starting y co-ordinates for tsp1
    y_ending=tsp1.node_coord(len,2); %Ending y co-ordinates for tsp1
    y_net=[y_starting y_ending]; 
    %Starting and ending y co-ordinate for tsp1, saved in vector
    
    plot(tsp1.node_coord(:,1),tsp1.node_coord(:,2),'.-b',x_net,y_net,'.-k')
    %Plots multiple lines: one group of lines between all the different locations 
    % in blue colour line with ending points as blue dots, second between 
    %the starting and ending points in black line. 


    xlabel('x-Coordinate'); %Giving the label of x-axis to graph
    ylabel('y-Coordinate'); %Giving the label of y-axis to graph
    legend(tsp1.name); %Creating a legend which tells what the line represent
    title(tsp1.comment); %Giving title to the graph
    print -dtiff tspPlot 
    %function displays the plot as an image in a file- tspPlot.tif

end %Terminate function Statement











%It displays the maximum and minimum value of the dimension column of tsp
%and gets an input of limit which removes the entry from the structure, if
%the entered limit is greater than the value of dimension column of that coloumn. 
%It then returns the new structure

%Function to call: tspLimit(tsp)
%Returns a new structure, modifying the previous structure(It has side
%effects)

%Side effect: It prints text on command window(as shown in comments where
%it prints), asks the user for a valid Limit
%Input arguments: tsp
%Output arguments: tsp_new. Returns a new structure, modifying the previous structure

function tsp_new=tspLimit(tsp)
    
    Vector_dim=[tsp.dimension]; %Creates a vector having dimension's of tsp as elements
    fprintf('Minimum value:%d\n',min(Vector_dim)) %Displays minimum value on command window
    fprintf('Maximum value:%d\n',max(Vector_dim)) %Displays maximum value on command window
    Limit=input('Limit Value?'); %Asks the user to input a value

    while error_checking(Limit,min(Vector_dim),max(Vector_dim))
        %Keeps on giving the prompt to enter a value until a proper value 
            
        Limit=input('Limit Value?');
        %Asks the user to input a value

    end %Terminate while loop

    disp(' ') %Used to leave a line on the command window
    copytsp=tsp; %Create a copy of the structure

    counter=1; 
    %Used this to create a psuedo counter, which whould assign itself as index or number 
    %in the structure

    for i=[copytsp.dimension]
        %Iterates through the dimensions of the structures

       if i>Limit
           %If dimension is greater than limit then deletes it

           copytsp(counter)=[];
           %Deleting that column in the structure

       else

           counter=counter+1; 
           %Increasing the iteration part by 1

       end%Terminate if statement

    end %Terminate for statement

    tsp_new=copytsp;%Replace the original tsp with the new tsp

end %Terminating switch statement

%This function is used for checking whether the entered number is within a
%specified range, is not a scalar, is a single number, is not an integer and is
%numeric

%Function to call:errorchecking(number,min,max)

%Side effect: Not printing anything on the commmand window
%Input arguments: number,min,max.
%Output arguments: condition(which is either true or false)

function condition = errorchecking(number,min,max)
    
    %This statement checks whether all the conditions are met
    if number>=min && number<=max && isa(number,'double') && numel(number)==1 && round(number)==number && isnumeric(number)

        condition=false; %evaluates this is the condition is met

    else

        condition=true; %Evaluates this is the condition is not met

    end %Terminate if loop

    
end %Terminate function statement
