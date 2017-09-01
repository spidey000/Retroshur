MCRC=EB73213C
MVersion=1.7.1

; This library allows access to various supported methods from the RocketLauncher.dll
; Instantiated by creating the RLDLL instance first:
; RLObject := new RLDLL(PathtoRLDLLFile)
class RLDLL
{
	;vars
	CLRObject := ""	; the .NET CLR object that communicates with the DLL

	__New(fullFilePath)
	{
		this.CLRObject := this.Start(fullFilePath)
	}

	__Delete()
	{
		this.CLRObject := ""
	}

	;--- Startup Function ---

	; Required to create the RL dll object before using any of the dll's methods
	Start(fullFilePath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Creating new Object for RL DLL from file: """ . fullFilePath . """")
		try {
			If !FileExist(fullFilePath)
			{	MsgBox, 16, Error, Missing %fullFilePath%, 5
				ExitApp
			}
			CLR_Start()
			If !hModule := CLR_LoadLibrary(fullFilePath)
				ScriptError("Error loading the DLL: " . fullFilePath)
			If !Object := CLR_CreateObject(hModule,"RocketLauncher.Utils.MainDriver")
				ScriptError("Error creating object. There may be something wrong with the dll file: " . fullFilePath)
			Return Object
		}
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	;--- Zip Functions ---


	; Sets the path to the 7z Library
	; public void set7zdllPath(String sevenzdllPath)
	set7zdllPath(sevenzdllPath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Setting 7z DLL Path to: """ . sevenzdllPath . """")
		try
			Return this.CLRObject.set7zdllPath(sevenzdllPath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the first found file inside a supported archive when only supplying an extension. Returns empty string if no matches are found.
	; public String findByExtension(String zipfilepath, String extensions)
	findByExtension(zipfilepath,extensions) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Finding first found file inside """ . zipfilepath . """ that matches any of these extensions: """ . extensions . """")
		try
			Return this.CLRObject.findByExtension(zipfilepath,extensions)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the length of the path for deepest file inside the archive. This can be used to check if extracting an archive won't break the 255 character limit that exists in Windows.
	; public int getLongestPathSize(String zipfilepath)
	getLongestPathSize(zipfilepath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting length of deepest file inside this archive: """ . zipfilePath . """")
		try
			Return this.CLRObject.getLongestPathSize(zipfilepath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the number of files inside the archive (folders are not considered).
	; public int getZipFileCount(String zipfilepath)
	getZipFileCount(zipfilepath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting number of files inside this archive: """ . zipfilePath . """")
		try
			Return this.CLRObject.getZipFileCount(zipfilepath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns a | separated string of all files inside a supported archive. Also returns the compression method for each file. Output format is "filename 1|compression type/filename 2|compression type/..." This can be useful for example to debug situations while the progress bar stays at 0% for a while due to the compression method used
	; public String getZipFileList(String zipfilepath)
	getZipFileList(zipfilepath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting a list of all files inside this archive: """ . zipfilePath . """")
		try
			Return this.CLRObject.getZipFileList(zipfilepath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Check if compressed files contain illegal filename characters which wouldn't allow it to be uncompressed under Windows. This is needed for the WinUAE module for example as some invalid Windows characters are actually valid AmigaDOS filenames. Returns 1 - Has invalid chars; 0 - No invalid chars
	; public int checkInvalidCharacters(String zipfilepath)
	checkInvalidCharacters(zipfilepath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Checking if this archive contains any illegal characters in its contents: """ . zipfilePath . """")
		try
			Return this.CLRObject.checkInvalidCharacters(zipfilepath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Searches for a specific file inside a supported archive. The first file matching the conditions will be returned. Returns empty string if no matches are found
	; public String findFileInZip(String zipfilepath, String filenames, String extensions)
	findFileInZip(zipfilepath,filenames,extensions) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Searching for these filename(s) """ . filenames . """ with these extensions """ . extensions . """ inside this archive: """ . zipfilePath . """")
		try
			Return this.CLRObject.findFileInZip(zipfilepath,filenames,extensions)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the uncompressed size in bytes, or size on disk, of all files an archive will use when extracted.
	; public ulong getZipExtractedSize(String zipfilepath)
	getZipExtractedSize(zipfilepath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting extracted size of this archive: """ . zipfilePath . """")
		try
			Return this.CLRObject.getZipExtractedSize(zipfilepath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns a | separated string of the current file being extracted and a percentage for the global extraction. Used as a method to determine extraction progress. Only use the Fast Extraction Mode (mode=1) when you are expecting a folder with hundreds of small files inside it otherwise always use the Accurate one (mode=0).
	; public String getExtractionProgress(String extractionPath, long totalSize, int mode)
	getExtractionProgress(extractionPath,totalSize,mode) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Using mode " . mode . " and total size of " . totalSize . " bytes, getting extraction progress of: """ . zipfilePath . """")
		try
			Return this.CLRObject.getExtractionProgress(extractionPath,totalSize,mode)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns a | separated string of the current file being extracted and current size on disk. Used as a method to determine extraction progress. Only use the Fast Extraction Mode (mode=1) when you are expecting a folder with hundreds of small files inside it otherwise always use the Accurate one (mode=0).
	; public String getExtractionSize(String path, int mode)
	getExtractionSize(path,mode) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting extraction progress using mode " . mode . " in path: """ . path . """")
		try
			Return this.CLRObject.getExtractionSize(path,mode)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the size in bytes of the specified folder and all it's contents including sub-folders. Only use the Fast Extraction Mode (mode=1) when you are expecting a folder with hundreds of small files inside it otherwise always use the Accurate one (mode=0).
	; public long getFolderSize(String path, int mode)
	getFolderSize(path,mode) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Using mode " . mode . ", getting size of this path: """ . path . """")
		try
			Return this.CLRObject.getFolderSize(path,mode)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Detects if the specified archive contains a unique folder as the archive root. It will return an empty String if there are multiple folders in the archive root or if any file is found in the archive root
	; public String getZipRootFolder(String zipfilepath)
	getZipRootFolder(zipfilepath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Checking if this archive contains a unique folder: """ . zipfilePath . """")
		try
			Return this.CLRObject.getZipRootFolder(zipfilepath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- PDF Functions ---


	; Converts a PDF file to several PNG files (one per page). firstPage and lastPage are optional and if not provided it will convert the whole PDF file. PNG files will be generated to outputPath and will be named pageX.png where X is the page number.
	; public void generatePngFromPdf(String inputPath, String outputPath, int dpiResolution, int maximumHeight = 0, int firstPage = 1, int lastPage = 0, String pageLayout = null)
	generatePngFromPdf(inputPath,outputPath,dpiResolution,maximumHeight=0,firstPage=1,lastPage=0,pageLayout="null") {
		Global RLLog,logIncludeDLLLogs
		try
			Return this.CLRObject.generatePngFromPdf(inputPath,outputPath,dpiResolution,maximumHeight,firstPage,lastPage,pageLayout)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the number of pages of a PDF file
	; public int getPdfPageCount(String inputPath, String pageLayout = null)
	getPdfPageCount(inputPath,pageLayout="null") {
		Global RLLog,logIncludeDLLLogs
		try
			Return this.CLRObject.getPdfPageCount(inputPath,pageLayout)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Controller Functions ---


	; Returns a binary string with 16 characters representing the 16 possible joystick ports windows supports. Example 1100000000000000. A 1 represents a joystick is in that port, 0 means no joystick. You read the binary from left to right with left most number being port 0 and right most port being port 15 (16 ports in total).
	; public String getConnectedJoysticks()
	getConnectedJoysticks() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting connected joystick listing")
		try
			Return this.CLRObject.getConnectedJoysticks()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Module Functions ---


	; Checks if a Module CRC matches the one in the module header can also test Library or Extensions
	; For Module CRC Checking use: checkModuleCRC(PATH_TO_AHK_FILE, "", true)
	; For Ahk Library CRC Checking (CLR,Gdip,etc.) use: checkModuleCRC(PATH_TO_AHK_FILE, CRC_VALUE, false)
	; For RocketLauncher Extensions Checking (Pause,FadeAnimations,etc.) use: checkModuleCRC(PATH_TO_AHK_FILE, "", false)
	; Returns: -1 - Module file not found; 0 - CRC doesn't match; 1 - CRC matches; 2 - Module has no CRC defined on the header
	; public int checkModuleCRC(string fileName, string crc, bool isModule)
	checkModuleCRC(fileName,crc,isModule) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Checking " . (crc ? "for CRC:" . crc : "CRC for") . " " . (isModule ? "module" : "lib") . " file: """ . fileName . """")
		try
			Return this.CLRObject.checkModuleCRC(fileName,crc,isModule)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Rom Functions ---


	; Validates if the contents of a CUE file is valid, namely if all files referenced by it exist. Returns 0-If CUE is invalid, 1-If CUE is valid, 2-If CUE cannot be found.
	; public int validateCUE(String cueFilePath)
	validateCUE(cueFilePath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Validating CUE file: """ . cueFilePath . """")
		try
			Return this.CLRObject.validateCUE(cueFilePath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	;  Validates if GDI file is valid, namely if all files referenced by it exist. Returns 0-If GDI is invalid, 1-If GDI is valid, 2-If GDI cannot be found, 3-If Invalid Double Quotes were found.
	; public int validateGDI(String gdiFilePath, bool acceptDoubleQuotes)
	validateGDI(gdiFilePath,acceptDoubleQuotes) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Validating GDI file: """ . cueFilePath . """ and " . (acceptDoubleQuotes ? "" : "not") . " accepting double quotes")
		try
			Return this.CLRObject.validateGDI(gdiFilePath,acceptDoubleQuotes)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Searches CUE file for tracks with the specified file extensions. Useful to determine if mp3 files are being referenced by the CUE file for example since Daemon Tools Lite won't support them. Returns 0-Not found, 1-Found, 2-CUE file cannot be found, 3-CUE is invalid.
	; public int findCUETracksByExtension(String cueFilePath, String file_extensions)
	findCUETracksByExtension(cueFilePath,file_extensions) {
		Global RLLog,logIncludeDLLLogs
		try
			Return this.CLRObject.findCUETracksByExtension(cueFilePath,file_extensions)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Lists all files referenced by the provided CUE file split with the | character. The CUE file won't be validated so make sure you call validateCUE before calling this method if you want to be sure the file is valid. cueIndex=0 will list all entries, cueIndex=1 will list only the first entry and so on.
	; public String listCUEFiles(String cueFilePath, int cueIndex = 0)
	listCUEFiles(cueFilePath,cueIndex=0) {
		Global RLLog,logIncludeDLLLogs
		try
			Return this.CLRObject.listCUEFiles(cueFilePath,cueIndex)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- File Functions ---


	; Converts a relative path to an absolute one from a base path
	; public String getFullPathFromRelative(String basePath, String relativePath)
	getFullPathFromRelative(basePath,relativePath) {
		Global RLLog,logIncludeDLLLogs
		If !relativePath
			Return
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Converting """ . relativePath . """")
		try {
			absPath := this.CLRObject.getFullPathFromRelative(basePath,relativePath)
		} catch e {
			RLLog.Error(A_ThisFunc . " - Exception thrown:`n" e.message)
		}
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Converted to """ . absPath . """")

		Return absPath
	}

	; Gets the File Encoding from a file based on the byte order mark (BOM) character in a text file if one exists. If the BOM character isn't set or not recognized it will return an empty string.
	; Will return "ERROR" if the file cannot be accessed. Further info will be on the DLL log.
	; public String getFileEncoding(String filePath)
	getFileEncoding(filePath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting file encoding for: """ . filePath . """")
		try
			Return this.CLRObject.getFileEncoding(filePath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Converts an absolute path to relative from a provided basePath
	; forceDotAtBeginning: Should be 0 or 1 depending on if you want relative paths below a base folder to start with a . or not. (ie "folder\sub-folder" or ".\folder\sub-folder")
	; basePath: Can have a backslash at the end or not, it will work either way.
	; public String getRelativePathFromFull(String basePath, String absolutePath, int forcedotatbeginning)
	getRelativePathFromFull(basePath,absolutePath,forceDotAtBeginning=0) {
		Global RLLog,logIncludeDLLLogs
		If !absolutePath
			Return
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Converting """ . absolutePath . """")
		try {
			relPath := this.CLRObject.getRelativePathFromFull(basePath,absolutePath,forceDotAtBeginning)
		} catch e {
			RLLog.Error(A_ThisFunc . " - Exception thrown:`n" e.message)
		}
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Converted to """ . relPath . """")

		Return relPath
	}

	; Reads file contents with a certain length and starting with a specified offset. Return data read, if an invalid mode is specified will return ERROR.
	; public String readFileData(String filePath, int startOffset, int bytesToRead, String mode)
	readFileData(filePath,startOffset,bytesToRead,mode) {
		Global RLLog,logIncludeDLLLogs
		try
			Return this.CLRObject.readFileData(filePath,startOffset,bytesToRead,mode)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Removes BOM character from a text file if it exists. Returns 1-If BOM character was removed; 0-If there was nothing to remove.
	; Will return -1 if there is an error while reading the file encoding. Further info will be on the DLL log.
	; public int removeBOM(String filePath)
	removeBOM(filePath) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Removing BOM character if exists from: """ . filePath . """")
		try
			Return this.CLRObject.removeBOM(filePath)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns SplitPath information in a vector array: [0]=FileName, [1]=Dir, [2]=Extension, [3]=NameNoExt, [4]=Drive
	; public String[] splitPath(String path)
	splitPath(path,log=1) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true" && log)
			RLLog.TraceDLL(A_ThisFunc . " - Splitting """ . path . """")
		try {
			v := this.CLRObject.splitPath(path)
			Return v
		}
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Service Functions ---


	; Returns status of the service. Returns -1 if status could not be determined; 0 if not running; 1 if running.
	; public int getServiceStatus(String serviceName)
	getServiceStatus(serviceName) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting status of service: """ . serviceName . """")
		try
			Return this.CLRObject.getServiceStatus(serviceName)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Display Functions ---


	; Checks if it's possible to change the display settings to the desired values. Returns 1 is it's possible, error message otherwise.
	; public String checkDisplaySettings(String displayName, uint width, uint height, uint bitDepth, uint frequency)
	checkDisplaySettings(displayName,width,height,bitDepth,frequency) {
		Global RLLog,logIncludeDLLLogs
		try
			Return this.CLRObject.checkDisplaySettings(displayName,width,height,bitDepth,frequency)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Changes display settings to the specified values. Returns 1 if change succeeded, error message otherwise.
	; public String changeDisplaySettings(String displayName, uint width, uint height, uint bitDepth, uint frequency)
	changeDisplaySettings(displayName,width,height,bitDepth,frequency) {
		Global RLLog,logIncludeDLLLogs
		try
			Return this.CLRObject.changeDisplaySettings(displayName,width,height,bitDepth,frequency)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns display settings for the specified monitor in format: width|height|bits|frequency|orientation
	; public String getDisplaySettings(String displayName)
	getDisplaySettings(displayName) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting display settings for: """ . displayName . """")
		try
			Return this.CLRObject.getDisplaySettings(displayName)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; This will return the current scaling percentage of the selected monitor. If anything other than 100 is returned, then scaling is active.
	; public long getDisplayScalingPercentage(String displayName)
	getDisplayScalingPercentage(displayName) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting display scaling percentage for: """ . displayName . """")
		try
			Return this.CLRObject.getDisplayScalingPercentage(displayName)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Windows Functions ---


	; Returns the language in which the Windows UI is displayed right now. This might be different from the windows install UI if there's a MUI or LIP installed.
	; public String getWindowsUILanguage()
	getWindowsUILanguage() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting current Windows language being displayed")
		try
			Return this.CLRObject.getWindowsUILanguage()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the Locale specified for formats. This should be exposed by Control Panel >> Region and Language >> Formats
	; public String getFormatsLocale()
	getFormatsLocale() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting current locale format")
		try
			Return this.CLRObject.getFormatsLocale()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the encoding for the operating system's current ANSI code page.
	; public String getTextEncoding()
	getTextEncoding() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting ANSI text encoding for Windows")
		try
			Return this.CLRObject.getTextEncoding()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns the current system locale. This controls the language used when displaying text in programs that do not support Unicode. Should be exposed by ControlPanel >> Region and Language >> Administrative >> Change System Locale.
	; public String getSystemLocale()
	getSystemLocale() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting current system locale")
		try
			Return this.CLRObject.getSystemLocale()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Log Functions ---


	; Sets current Log Mode. newlogMode can be one of: 0-Disabled; 1-Log to File (RocketLauncher.DLL.log); 2-Log to Memory (use readLogData() to retrieve log entries).
	; public void setLogMode(String newlogMode, int newFile, String logThread)
	setLogMode(newlogMode,newFile,logThread) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Setting DLL log mode in thread """ . logThread . """ to """ . newlogMode . """ in file """ . newFile . """")
		try {
			v := this.CLRObject.setLogMode(newlogMode,newFile,logThread)
			Return v
		}
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Redirects log to a different file other than the default one. Default name is RocketLauncher.DLL.log
	; public void setLogFilename(String filename)
	setLogFilename(filename) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Setting DLL log filename to """ . filename . """")
		try {
			v := this.CLRObject.setLogFilename(filename)
			Return v
		}
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Returns all log entries from memory
	; public String readLogData()
	readLogData() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Getting log data")
		try
			Return this.CLRObject.readLogData()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Writes all log entries from memory to the log file
	; public void writeLogData()
	writeLogData() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Writing all log data to file")
		try
			Return this.CLRObject.writeLogData()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Security Functions ---


	; Verifies if the specified password is valid
	; public int VerifyPassword(String plainValue, String hashedValue)
	VerifyPassword(plainValue,hashedValue) {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - Plain value " . (plainValue ? "" : "not") . " sent and hashed value " . (hashedValue ? "" : "not") . " sent")
		try
			Return this.CLRObject.VerifyPassword(plainValue,hashedValue)
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}


	;--- Test Functions ---


	; Testing purposes, returns "OK"
	; public String test()
	test() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - TEST SHOULD RETURN OK")
		try
			Return this.CLRObject.test()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}

	; Testing purposes, always throw an Exception
	; public String testException()
	testException() {
		Global RLLog,logIncludeDLLLogs
		If (logIncludeDLLLogs = "true")
			RLLog.TraceDLL(A_ThisFunc . " - TEST SHOULD SHOW EXCEPTION")
		try
			Return this.CLRObject.testException()
		catch e
			ScriptError(A_ThisFunc . " - Exception thrown:`n" e.message)
	}
}
