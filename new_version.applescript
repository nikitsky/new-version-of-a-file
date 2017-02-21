tell application "Finder"
	set theItems to selection
	set fileName to name of item 1 of theItems
	set fileExtension to name extension of item 1 of theItems
	set src_file to POSIX path of (folder of item 1 of theItems as text) & name of item 1 of theItems
	set dest_file to POSIX path of (folder of item 1 of theItems as text) & getNewVersion(fileName, fileExtension) of me
	set cmd_script to "cp -n " & quoted form of src_file & " " & quoted form of dest_file
	try
		do shell script "cp -n " & quoted form of src_file & " " & quoted form of dest_file
	on error
		display dialog "File " & dest_file & " already exists" with icon 2 buttons {"Ok"} default button 1 with title "Info"
	end try
end tell

on getNewVersion(currentFile, fileExt)
	set versionNumber to ""
	repeat with theIncrementValue from ((length of currentFile) - (length of fileExt) - 1) to 1 by -1
		set LastChar to character theIncrementValue of currentFile
		if LastChar is not in {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"} then exit repeat
		set versionNumber to LastChar & versionNumber
	end repeat
	
	if versionNumber = "" then
		set newName to (characters 1 thru ((length of currentFile) - (length of fileExt) - 1) of currentFile as string) & " v.01." & fileExt
	else
		set newName to (characters 1 thru ((length of currentFile) - (length of fileExt) - (length of versionNumber) - 1) of currentFile as string) & versionNumber + 1 & "." & fileExt
	end if
	return newName
end getNewVersion

