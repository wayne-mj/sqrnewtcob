       IDENTIFICATION DIVISION.
      * A rewrite of a fortran program that is rewrite of a REXX script
      * to find the square root of a number

       PROGRAM-ID.    SQRNEWT.
       AUTHOR.        Wayne.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WORK-AREA.
           05 MAX-ITER      PIC  9(3)       VALUE  100.
           05  ITER         PIC  9(3).
           05  TOL          PIC  9(3)V9(12)  VALUE  0.0000000001.
           05  RR           PIC S9(3)V9(12).
           05  R            PIC S9(3)V9(12).
           05  N            PIC S9(3)V9(12).
           05  N-TEXT       PIC X(15).
           05  DIS-RESULTS  PIC Z(3).9(12).

       PROCEDURE DIVISION.
           DISPLAY "Enter a 3 digit value <> 0:"
      *    ACCEPT N FROM PARMS
      *    MOVE 4 TO N
           ACCEPT N-TEXT

           PERFORM VALID-INPUT
           STOP RUN.

      *    Validate the input
      *    If less than 0 ie negative, make it positive
      *    If 0 then drop out
       VALID-INPUT.
           INSPECT N-TEXT REPLACING ALL "," BY "."
           COMPUTE N = FUNCTION NUMVAL(N-TEXT)
      *    DISPLAY N

           IF N LESS THAN ZERO THEN
             COMPUTE N = N * (- 1)
             DISPLAY "CORRECTED FOR NEGATIVE VALUE"
           END-IF.

           IF N NOT EQUAL ZERO THEN
             PERFORM FIND-SQRROOT
           ELSE
             DISPLAY "CANNOT BE ZERO"
           END-IF.
       END-VALID-INPUT.

      *    Find the SQR Root of a number
       FIND-SQRROOT.
           MOVE 0 to ITER
           MOVE 1 to R

           PERFORM UNTIL ITER GREATER OR EQUAL MAX-ITER
             COMPUTE ITER = ITER + 1
             COMPUTE RR = (N / R + R) / 2

             IF (FUNCTION ABS(RR - R) <= TOL) THEN
               EXIT PERFORM
             END-IF

             MOVE RR TO R
           END-PERFORM

           MOVE RR TO DIS-RESULTS
           DISPLAY DIS-RESULTS.
       END-FIND-SQRROOT.

