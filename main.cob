       IDENTIFICATION DIVISION.
       PROGRAM-ID. HALF-YOUR-AGE-PLUS-SEVEN.
       AUTHOR. WILLIAM-KEILSOHN.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 USER-AGE PIC 9(3) ZERO.
       01 PARTNER-AGE.
           02 PARTNER-UPPER 9(3) ZERO.
           02 PARTNER-LOWER 9(3) ZERO.
       01 USER-INPUT PIC X(3) ZERO.

       PROCEDURE DIVISION.

       *> Get input from the user.
       DISPLAY "How old are you? " WITH NO ADVANCING.
       ACCEPT USER-INPUT.
       *> Convert user input into a number. 
       COMPUTE USER-AGE = FUNCTION NUMVAL(USER-INPUT).
       *> Calculate the age range.
       COMPUTE PARTNER-LOWER ROUNDED = (USER-AGE / 2) + 7.
       COMPUTE PARTNER-UPPER ROUNDED = (USER-AGE - 7) * 2.
       *> Output the results
       DISPLAY "You can date people within the age range of ", 
       PARTNER-LOWER, " to ", PARTNER-UPPER.



       STOP RUN.