       IDENTIFICATION DIVISION.
       PROGRAM-ID. HALF-YOUR-AGE-PLUS-SEVEN.
       AUTHOR. WILLIAM-KEILSOHN.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 USER-AGE PIC 9(3) VALUE ZEROS.
       01 PARTNER-AGE.
           02 PARTNER-UPPER PIC 9(3) VALUE ZEROS.
           02 PARTNER-LOWER PIC 9(3) VALUE ZEROS.
       01 USER-INPUT PIC X(3) VALUE ZEROS.
       01 USER-SELECT-NUM PIC 9 VALUE 0.
       01 USER-END PIC 9 VALUE 0.
       01 PAGE1 PIC 9(3) VALUE ZEROS.
       01 PAGE2 PIC 9(3) VALUE ZEROS.
       01 AGE-OK PIC 9 VALUE 0.
       01 AGEFORMAT1 PIC ZZZ VALUE ZEROS.
       01 AGEFORMAT2 PIC ZZZ VALUE ZEROS.

       PROCEDURE DIVISION.

       MAIN-PARA.
           PERFORM SELECTION-PARA UNTIL USER-END = 1.
           STOP RUN.

       SELECTION-PARA.
           DISPLAY "PLEASE SELECT AN OPTION BELOW:".
           DISPLAY "1: CALCULATE MY RANGE OF PARTNERS".
           DISPLAY "2: DETERMINE IF TWO PEOPLE ARE WITHIN RANGE".
           DISPLAY "0: END OPPERATION".
           DISPLAY "ENTER SELECTION: " WITH NO ADVANCING
           ACCEPT USER-SELECT-NUM.
           EVALUATE USER-SELECT-NUM
               WHEN 1
                   PERFORM CALC-PARTNERS-PARA
               WHEN 2
                   PERFORM CALC-ACCEPT-PARA
               WHEN OTHER
                   MOVE 1 TO USER-END
           END-EVALUATE.



       CALC-PARTNERS-PARA.
           *> Get input from the user.
           DISPLAY "How old are you? " WITH NO ADVANCING.
           ACCEPT USER-INPUT.
           *> Convert user input into a number. 
           COMPUTE USER-AGE = FUNCTION NUMVAL(USER-INPUT).
           *> Calculate the age range.
           COMPUTE PARTNER-LOWER ROUNDED = (USER-AGE / 2) + 7.
           COMPUTE PARTNER-UPPER ROUNDED = (USER-AGE - 7) * 2.
           *> Output the results
           MOVE PARTNER-LOWER TO AGEFORMAT1.
           MOVE PARTNER-UPPER TO AGEFORMAT2.
           DISPLAY "You can date people within the age range of ", 
               AGEFORMAT1, " to ", AGEFORMAT2.

       CALC-ACCEPT-PARA.
           DISPLAY USER-END.
           DISPLAY "PLEASE ENTER THE FIRST PERSON'S AGE: " WITH NO 
           ADVANCING.
           ACCEPT PAGE1.
           DISPLAY "PLEASE ENTER THE SECOND PERSON'S AGE: " WITH NO
           ADVANCING.
           ACCEPT PAGE2.
           IF PAGE1 = PAGE2 THEN
               MOVE 1 TO AGE-OK
           END-IF.
           IF PAGE1 > PAGE2 THEN
               COMPUTE PARTNER-LOWER ROUNDED = (PAGE1 /2) + 7
               IF PAGE2 >= PARTNER-LOWER THEN
                   MOVE 1 TO AGE-OK
           END-IF.
           IF PAGE1 < PAGE2 THEN
               COMPUTE PARTNER-UPPER ROUNDED = (PAGE1 - 7) * 2
               IF PAGE2 <= PARTNER-LOWER THEN 
                   MOVE 1 TO AGE-OK
           END-IF.
           IF AGE-OK = 1 THEN
               DISPLAY "THESE PEOPLE MEET THE RULE."
           ELSE
               DISPLAY "THESE PEOPLE DO NOT MEET THE RULE."
           END-IF.


       STOP RUN.
