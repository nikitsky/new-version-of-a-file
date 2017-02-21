#new-version-of-a-file automator workflow

Create a file copy with next version in the filename

test.html -> test v.1.html -> test v.2.html

##Installation 

1. Open Automator.app and create new service

2. Servise receives selected 'files or folders' in 'Finder.app'

3. Add action 'Run AppleScript'

4. Paste content of 'new_version.applescript' file

5. File -> Export .... and save as 'Create new version.workflow' in Services folder

[New_version_workflow.png]


##How to use

1. Select a file in Finder 

2. Right click on the filename -> Services -> Create new version

