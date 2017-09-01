MCRC=C0F691C1
MVersion=1.0.0

; Instantiated by creating an instance first:
; shooterInstance := new DemulShooter()
class DemulShooter extends Process
{
	;vars
	; inherits all vars from Process class

	__New()
	{
		Global RLLog,demulShooterPath
		base.__New(demulShooterPath)	; extends to use super class constructor so all Process methods can be used directly, (ex Run, Process, etc)
		this.FilePath := this.demulShooterPath
		RLLog.Trace(A_ThisFunc . " - Created new DemulShooter object of: """ . this.FileFullPath . """")
	}

	Launch(target,rom,params="")
	{
		Global RLLog
		this.Run("-target=" . target . " -rom=" . rom . (params ? = " " . params : ""))
	}
}

