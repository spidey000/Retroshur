MCRC=A287DD35
MVersion=1.0.0

; Not instantiated, access functions directly
class Registry
{
	Read(RootKey,SubKey,ValueName="",RegistryVersion=32,log=1)
	{	Global winVer,RLLog
		If log
			RLLog.Debug(A_ThisFunc . " - Reading from Registry : RootKey=" . RootKey . ", SubKey=" . SubKey . ", ValueName=" . ValueName . ",RegistryVersion=" . RegistryVersion)
		If (RegistryVersion = "Auto") ;Try finding the correct registry reading based on the windows version
		{
			If (winVer = "64")
				If !OutputVar := this.Read(RootKey, SubKey, ValueName, "64",0)
				OutputVar := this.Read(RootKey, SubKey, ValueName, "32",0)
			Else
				OutputVar := this.Read(RootKey, SubKey, ValueName,"",0)
		} Else If (RegistryVersion = "32")
			RegRead, OutputVar, %RootKey%, %SubKey%, %ValueName%
		Else
			OutputVar := RegRead64(RootKey, SubKey, ValueName)
		If log
			RLLog.Debug(A_ThisFunc . " - Registry Read finished, returning " . OutputVar)
		Return OutputVar
	}

	Write(ValueType,RootKey,SubKey,ValueName="",Value="",RegistryVersion=32,log=1)
	{
		Global RLLog
		If log
			RLLog.Debug(A_ThisFunc . " - Writing to Registry : RootKey=" . RootKey . ", SubKey=" . SubKey . ", ValueName=" . ValueName . ",Value=" . Value . ",ValueType=" . ValueType . ",RegistryVersion=" . RegistryVersion)
		If (RegistryVersion = "32")
			RegWrite, %ValueType%, %RootKey%, %SubKey%, %ValueName%, %Value%
		Else
			RegWrite64(ValueType, RootKey, SubKey, ValueName, Value)
		If log
			RLLog.Debug(A_ThisFunc . " - Registry Write finished")
	}
}
