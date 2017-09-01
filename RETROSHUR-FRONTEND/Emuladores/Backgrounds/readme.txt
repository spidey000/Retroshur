Frameless
Copyright (c) 2011-2016 Jody Holmes (Skwire Empire)
http://skwire.dcmembers.com/fp/?page=frameless

Description:
    Frameless is a borderless, captionless image viewer with commandline options for display placement.

Usage:
    Program syntax: Frameless.exe "<image path>" <parameters>
    
    Parameters: 
        x=<x coordinate> or either the letter L, C, or R (for Left, Center, or Right)
        y=<y coordinate> or either the letter T, C, or B (for Top, Center, or Bottom)
        w=<#>                    (Resize image width to this value)
        h=<#>                    (Resize image height to this value)
        mon=<monitor #>          (For use with L/C/R, T/C/B, and FullScreen options)
        taskbar=no               (No button in the Windows taskbar)
        duration=hh:mm:ss        (Window will auto-close after duration expires (unless msgbox parameter is set))
        msgbox="Some text here"  (Will display a message box before exiting, e.g., after the specified duration time expires)
        trans=<0-255> or "alpha" (Sets window transparency or uses alpha transparency present in some PNG files)
        caption="foo"            (Custom caption text)
        aot=yes                  (Sets window as "always on top")
        aob=yes                  (Sets window as "always on bottom")
        fullscreen=yes           (Resize the image to the resolution of the specified monitor)
        noexit=yes               (Removes the "Exit" entry from the context menu and also disables the Alt+F4 hotkey.  You can still kill it via the Task Manager.)
        noactivate=yes           (Shows the window without activating it.)
        noresize=yes             (Disables resizing of the window with the mouse.)
    
        e.g.: c:\path\to\Frameless.exe "c:\path\to\image.jpg" x=100 y=200 taskbar=no duration=00:00:10
        e.g.: c:\path\to\Frameless.exe "c:\path\to\image.jpg" x=C y=C mon=2
        e.g.: c:\path\to\Frameless.exe "c:\path\to\image.jpg" duration=00:00:10 msgbox="Don't forget!"
        e.g.: c:\path\to\Frameless.exe "c:\path\to\image.jpg" mon=2 fullscreen=yes
        e.g.: c:\path\to\Frameless.exe "c:\path\to\image.jpg" trans=128
        e.g.: c:\path\to\Frameless.exe "c:\path\to\image.jpg" trans=alpha
    
Notes:
    - All parameters are optional.
    - The x/y coordinates default to zero if not specified.
    - Pressing the Escape key while an image is focused will close it.
    - Right-clicking an image will bring up a small context menu.
    - You can move an image around by holding down left-click on it.
    - You can resize images as you would a normal window.  Hold down the
      shift key while resizing to keep the images's original aspect ratio.
      Resizing is not supported for GIF files nor when the trans=alpha option
      is in use.    
    - Supported formats (all Windows OS): GIF, JPG, BMP, ICO, CUR & ANI 
    - Supported formats (Windows XP or later): PNG, TIF, Exif, WMF & EMF
    
Hotkeys:
    - Up/Down/Left/Right arrow keys will move an image one pixel at a time.
    - Shift + Up/Down/Left/Right arrow keys will move an image ten pixels at a time.
    - Spacebar (or PageDown) will advance to the next image in the folder.
    - Backspace (or PageUp) will advance to the previous image in the folder.
    
Copyright:
    Program icon copyright Rokey @ http://www.rokey.net
    Icon license: Free for non-commercial use.
    http://www.iconarchive.com/category/system/seed-icons-by-rokey.html
    ------------------------------------------------------------------------
    AniGIF control is copyright of Antonis Kyprianou (http://www.winasm.net)     
    
Links:
    Homepage: http://skwire.dcmembers.com/fp/?page=frameless
    Forum:    http://www.donationcoder.com/Forums/bb/index.php?topic=26766.0
