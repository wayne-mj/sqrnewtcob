//SQRNEWT JOB 1,NOTIFY=&SYSUID
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(SQRNEWT),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(SQRNEWT),DISP=SHR
//***************************************************/
// IF (RC = 0) THEN
//***************************************************/
//RUN     EXEC PGM=SQRNEWT
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//SYSOUT    DD SYSOUT=*
//SYSIN     DD *
15
/*
//SYSUDUMP  DD DUMMY
//***************************************************/
// ENDIF
