MCRC=2281FF7D
MVersion=1.0.0

; Not instantiated, access functions directly
class CustomFunction
{
	; This method gets ran right before the primaryExe
	PreLaunch()
	{
		Global RLLog
		RLLog.Trace(A_ThisFunc . " - Starting")
		PreLaunch%zz%()
		RLLog.Trace(A_ThisFunc . " - Ending")
		Return
	}

	; This method gets ran right after the primaryExe
	PostLaunch()
	{
		Global RLLog
		RLLog.Trace(A_ThisFunc . " - Starting")
		PostLaunch%zz%()
		RLLog.Trace(A_ThisFunc . " - Ending")
		Return
	}

	; This method gets ran right after FadeInExit(), after the emulator is loaded
	PostLoad()
	{
		Global RLLog
		RLLog.Trace(A_ThisFunc . " - Starting")
		PostLoad%zz%()
		RLLog.Trace(A_ThisFunc . " - Ending")
		Return
	}

	; This method gets ran after the module thread ends and before RL exits
	PostExit()
	{
		Global RLLog
		RLLog.Trace(A_ThisFunc . " - Starting")
		PostExit%zz%()
		RLLog.Trace(A_ThisFunc . " - Ending")
		Return
	}
}
