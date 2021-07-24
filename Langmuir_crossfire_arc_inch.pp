+================================================
+                                                
+ Langmuir_Crossfire
+                                                
+================================================
+                                                
+ History                                        
+                                                
+ Who      		When       	What                         
+ ======== 		========== 	===========================
+ Mike Hoffman
+ Dick Zimmmerman 
+ Mohammed Albasri   03/016/2021 	Written and compared output to Fusion 360 post 
       
+================================================

POST_NAME = "Langmuir Crossfire (inch) (*.nc)"

FILE_EXTENSION = "nc"

UNITS = "inches"

+------------------------------------------------
+    Line terminating characters                 
+------------------------------------------------

LINE_ENDING = "[13][10]"

+------------------------------------------------
+    Block numbering                             
+------------------------------------------------

LINE_NUMBER_START     = 10
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999

+================================================
+                                                
+    Formating for variables                     
+                                                
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|C|X|1.4]
VAR Y_POSITION = [Y|C|Y|1.4]
VAR Z_POSITION = [Z|C|Z|1.4]
VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.4]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.4]
VAR X_HOME_POSITION = [XH|A|X|1.4]
VAR Y_HOME_POSITION = [YH|A|Y|1.4]
VAR Z_HOME_POSITION = [ZH|A|Z|1.4]

+================================================
+                                                
+    Block definitions for toolpath output       
+                                                
+================================================

+---------------------------------------------------
+  Commands output at the start of the file
+  (v1.6-fc) may need to be updated for latter versions of Crossfire
+---------------------------------------------------

begin HEADER
"(v1.6-fc)"
"G90" 
"G94"
"G17"
"G20"
"H0"


+---------------------------------------------------
+  Commands output at toolchange
+---------------------------------------------------

begin TOOLCHANGE

"[N] M06 T[T]"
"[N] G43H[T]"
"[N] [S] M03"


+---------------------------------------------------
+  Commands output for rapid moves 
+---------------------------------------------------

begin RAPID_MOVE

"G00 [X] [Y] [Z]"

+---------------------------------------------------
+  Commands output for Plunge Moves
+---------------------------------------------------
begin PLUNGE_MOVE
"M3"
"G4 P0.6"

+---------------------------------------------------
+  Commands output for the first feed rate move
+---------------------------------------------------

begin FIRST_FEED_MOVE

"G01 [X] [Y] [Z] [F]"


+---------------------------------------------------
+  Commands output for feed rate moves
+---------------------------------------------------

begin FEED_MOVE

"[X] [Y] [Z]"

+---------------------------------------------------
+  Commands output for Retract Moves
+---------------------------------------------------
begin RETRACT_MOVE
"M5"
"G0 Z1"

+---------------------------------------------------
+  Commands output for the first clockwise arc move
+---------------------------------------------------

begin FIRST_CW_ARC_MOVE

"G02 [X] [Y] [I] [J] [F]"


+---------------------------------------------------
+  Commands output for clockwise arc  move
+---------------------------------------------------

begin CW_ARC_MOVE

"G02 [X] [Y] [I] [J]"


+---------------------------------------------------
+  Commands output for the first counterclockwise arc move
+---------------------------------------------------

begin FIRST_CCW_ARC_MOVE

"G03 [X] [Y] [I] [J] [F]"


+---------------------------------------------------
+  Commands output for counterclockwise arc  move
+---------------------------------------------------

begin CCW_ARC_MOVE

"G03 [X] [Y] [I] [J]"


+---------------------------------------------------
+  Commands output at the end of the file
+---------------------------------------------------

begin FOOTER
"M30"
"(PS75)"


