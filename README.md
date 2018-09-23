Flexible Autonomous Scripting with XML

The flexible autonomous scripting system consists of two parts: Creation of the XML autonomous file, creation of the autonomous commands, and execution of the autonomous file. During creation of the file, the user uses the mouse and keyboard to script the routine they want. During creation of the commands, the computer takes the user-made command templates and converts them into a form the robot can run. During execution, the robot parses the file to read and execute the autonomous commands. 

Creation:
The user is greeted with a blank text box. A list of commands is to the left. (For information on creating commands, see section Creating Commands). Two of the options in the box, sequential and parallel, are not commands, but are instead structural elements. Any commands inside a sequential block will be executed one after another, and any in a parallel block will be executed at the same time. Structural elements can be nested for complex behavior. 

To add a command or a structural element to the routine, select it in the command box, then left click the text box where you want to put it. You may only click at the end of a line, right after the closing ">" of a tag to validly add a new command/structure (collectively called tags from now on).

Clicking ESC unselects the current selected command from the command box.

If placing a command, a window will open with entries for the command's parameters. (See Creating Commands). The OK button will confirm what you have entered, while clicking Cancel or closing the window will cancel the placing of the command. 

The routine can be modified by double clicking. A double click will bring up a window with options. You do not have to double click at the end of the line. Current supported operations are Edit, Delete, and Clear, with a Move option in progress. Edit allows the user to edit the parameters of the tag. Delete deletes the tag. Clear deletes the entire routine.

There are, of course, the well known Load From Local, Save to Local, and Export to Robot buttons and a selection box with the names of the currently existing auto files. These do what you would expect.

Execution:
Execution runs on the robot the ExecuteXML file takes in a file path, and will execute the file. It pareses the file, looking for sequential and parralel blocks, and the command tags. When it gets to a command, it passes the command name and array of command parameters (represented as strings) to the special, automatically generated, ExecuteCommand VI, which will select the correct command VI and run it. The VIs it runs are also automatically generated, and have the "-C" addition to their name. 


Creating Commands:
Commands are created via templates. To create a command, create a VI in the CreatingCommands\CommandTemplates Folder. Any VIs in this folder will show up when creating the autonomous files, and be automatically added to the ExecuteCommand file. Add controls to the VI for each parameter you want passed to your command, and program the VI as you would want it to execute on the robot. These VIs will mostly be wrappers around our Command and Control VIs. 

When you are satisfied with all of your command templates, open and run the GenerateCode VI under the MyComputer section of the robot project. This VI will first take your templates, and modify them to take in an string array of name:value parameters instead of the actual number, boolean, or string controls. This way they all take in the same data type, and can all easily be put into the case structure in the ExecuteCommand VI, which is the next VI GenerateCode automatically creates.  

Currently, only boolean, number, and string parameters are supported. 

Using this Proof Of Concept Project:
To create files, use the GenerateXML VI. To execute a file, use the ExecuteXML VI. The Routine Data cluster demonstrates which commands are being executed. 

Setup: 

Making this work requires coding the correct file paths into GenerateXML, CreateCommandsFromTemplates, and CreateExecuteCommands. All the required paths are string on the block diagram, and the paths should be relative to the path of the project holding each VI. (Eventually the paths will be controls)
GenerateXML: Requires path to command templates folder and teh path to save the auto files to.
CreateCommandsFromTemplates: Requires path to command templates folder, ArrageValuesByName.vi, the creating commands Utils folder, and the path to save the command vis to.
CreateExecuteCommands: requires path the command vis, CreateExecuteCommandTemplate.vi, and where to save the new ExecuteCommand vi.

Concerns:
This process creates three different versions of a command (the one from our robot's command and control implementation, the command template wrapper, and the executable command).  

Other Things:
The text based interface could, and probably should, be replaced with a graphical one. 
Using LabVIEW might limit our ability to do that, but if we use another language it needs to be able to interface with labview to read the command VIs (maybe using a .exe) and I would like it to be able to use scp to get the files on the robot. 

You are supposed to close references to things you open, but I don't know if not doing so negativley affect performance.
