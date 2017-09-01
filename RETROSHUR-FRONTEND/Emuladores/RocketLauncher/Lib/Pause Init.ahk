MCRC=FA11B693
MVersion=1.0.3

pauseKey := xHotKeyVarEdit(pauseKey,"pauseKey","~","Add")
pauseBackToMenuBarKey := xHotKeyVarEdit(pauseBackToMenuBarKey,"pauseBackToMenuBarKey","~","Remove")
pauseZoomInKey := xHotKeyVarEdit(pauseZoomInKey,"pauseZoomInKey","~","Remove")
pauseZoomOutKey := xHotKeyVarEdit(pauseZoomOutKey,"pauseZoomOutKey","~","Remove")
pauseScreenshotKey := xHotKeyVarEdit(pauseScreenshotKey,"pauseScreenshotKey","~","Remove")

XHotKeywrapper(pauseKey,"TogglePauseMenuStatus")
XHotKeywrapper(pauseScreenshotKey,"SaveScreenshot")
