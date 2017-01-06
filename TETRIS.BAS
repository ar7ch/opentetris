'OpenTetris, v. 07.2016
'Published under GNU GPL v3 license
'Enjoy!

DECLARE FUNCTION CanRotate% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
DECLARE FUNCTION CanDown% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
DECLARE FUNCTION CanRight% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
DECLARE FUNCTION canleft% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
DECLARE SUB KillFig (t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
DECLARE SUB DrawFig (t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
CLS
DIM username AS STRING
INPUT "Enter your name:", username

RANDOMIZE TIMER
DIM als AS INTEGER, score AS INTEGER, r2 AS INTEGER, t2 AS INTEGER, GGG AS SINGLE
DIM a(0 TO 21, 0 TO 11) AS INTEGER, r AS INTEGER, k AS STRING, t AS INTEGER, x AS INTEGER, y AS INTEGER
DIM sc(1 TO 100) AS INTEGER, un(1 TO 100) AS STRING
SCREEN 12
score = 0
GGG = 14700
LOCATE 2, 1
PRINT score
LINE (220, 0)-(220, 401), 7
LINE (220, 401)-(421, 401), 7
LINE (421, 401)-(421, 0), 7
r = FIX(RND * 4) + 1
t = FIX(RND * 7)
t2 = FIX(RND * 7)
CALL DrawFig(t2, 5, 14, 1)
x = 1
y = 5
CALL DrawFig(t, x, y, r)


DO
k = INKEY$
DO WHILE INKEY$ <> ""
k = ""
LOOP
  IF k = CHR$(0) + CHR$(75) THEN
        IF canleft(a(), t, x, y, r) = 1 THEN
        CALL KillFig(t, x, y, r)
        y = y - 1
        CALL DrawFig(t, x, y, r)
  END IF
    END IF
    IF k = CHR$(0) + CHR$(77) THEN
        IF CanRight(a(), t, x, y, r) = 1 THEN
        CALL KillFig(t, x, y, r)
        y = y + 1
        CALL DrawFig(t, x, y, r)
  END IF
    END IF
  IF k = CHR$(0) + CHR$(72) THEN
  IF CanRotate(a(), t, x, y, r) = 1 THEN
    CALL KillFig(t, x, y, r)
    IF r = 4 THEN r = 1 ELSE r = r + 1
    CALL DrawFig(t, x, y, r)
    END IF
    END IF
  IF k = CHR$(0) + CHR$(80) THEN
    END IF
  IF k = "" THEN
    IF CanDown(a(), t, x, y, r) = 1 THEN
    CALL KillFig(t, x, y, r)
    x = x + 1
    CALL DrawFig(t, x, y, r)
    ELSE
      SELECT CASE t
      CASE 0
        a(x, y) = 2
        a(x, y + 1) = 2
        a(x + 1, y) = 2
        a(x + 1, y + 1) = 2
      CASE 1
      IF r = 1 OR r = 3 THEN
        a(x, y - 1) = 5
        a(x, y) = 5
        a(x, y + 1) = 5
        a(x, y + 2) = 5
      ELSE
        a(x - 1, y) = 5
        a(x, y) = 5
        a(x + 1, y) = 5
        a(x + 2, y) = 5
      END IF
      CASE 2
      IF r = 1 OR r = 3 THEN
        a(x, y) = 4
        a(x, y + 1) = 4
        a(x + 1, y - 1) = 4
        a(x + 1, y) = 4
      ELSE
        a(x - 1, y) = 4
        a(x, y) = 4
        a(x, y + 1) = 4
        a(x + 1, y + 1) = 4
      END IF
      CASE 3
      IF r = 1 OR r = 3 THEN
        a(x, y - 1) = 5
        a(x, y) = 5
        a(x + 1, y) = 5
        a(x + 1, y + 1) = 5
      ELSE
        a(x, y) = 5
        a(x + 1, y) = 5
        a(x - 1, y + 1) = 5
        a(x, y + 1) = 5
      END IF
      CASE 4
        SELECT CASE r
        CASE 1
          a(x - 1, y) = 6
          a(x, y) = 6
          a(x + 1, y) = 6
          a(x + 1, y + 1) = 6
        CASE 2
          a(x, y - 1) = 6
          a(x, y) = 6
          a(x, y + 1) = 6
          a(x + 1, y - 1) = 6
        CASE 3
          a(x - 1, y - 1) = 6
          a(x - 1, y) = 6
          a(x, y) = 6
          a(x + 1, y) = 6
        CASE 4
          a(x, y - 1) = 6
          a(x, y) = 6
          a(x, y + 1) = 6
          a(x - 1, y + 1) = 6
        END SELECT
      CASE 5
        SELECT CASE r
        CASE 1
          a(x + 1, y - 1) = 1
          a(x - 1, y) = 1
          a(x, y) = 1
          a(x + 1, y) = 1
        CASE 2
          a(x, y - 1) = 1
          a(x, y) = 1
          a(x, y + 1) = 1
          a(x - 1, y - 1) = 1
        CASE 3
          a(x - 1, y) = 1
          a(x, y) = 1
          a(x + 1, y) = 1
          a(x - 1, y + 1) = 1
        CASE 4
          a(x, y - 1) = 1
          a(x, y) = 1
          a(x, y + 1) = 1
          a(x + 1, y + 1) = 1
        END SELECT
      CASE 6
        SELECT CASE r
        CASE 1
          a(x, y - 1) = 1
          a(x, y) = 1
          a(x, y + 1) = 1
          a(x + 1, y) = 1
        CASE 2
          a(x, y - 1) = 1
          a(x - 1, y) = 1
          a(x, y) = 1
          a(x + 1, y) = 1
        CASE 3
          a(x, y - 1) = 1
          a(x, y) = 1
          a(x, y + 1) = 1
          a(x - 1, y) = 1
        CASE 4
          a(x - 1, y) = 1
          a(x, y) = 1
          a(x + 1, y) = 1
          a(x, y + 1) = 1
        END SELECT
      END SELECT
      LINE (220, 0)-(220, 401), 7
      LINE (220, 401)-(421, 401), 7
      LINE (421, 401)-(421, 0), 7


CYCL = 0
228
FOR i = 20 TO 1 STEP -1
als = 0
FOR j = 1 TO 10
IF a(i, j) = 0 THEN als = 1
NEXT j
IF als = 0 THEN
LINE (0, 0)-(150, 150), 0, BF
score = score + 10 + CYCL
CYCL = CYCL + 2
LOCATE 2, 1
PRINT score
FOR l = i TO 2 STEP -1
FOR j = 1 TO 10
a(l, j) = a(l - 1, j)
LINE (221 + (j - 1) * 20, 1 + (l - 1) * 20)-(220 + j * 20, l * 20), a(l, j), BF
NEXT j
NEXT l
GOTO 228
END IF
NEXT i
      r = FIX(RND * 4) + 1
      t = t2
      CALL KillFig(t2, 5, 14, 1)
      t2 = FIX(RND * 7)
      CALL DrawFig(t2, 5, 14, 1)
      x = 1
      y = 5
      CALL DrawFig(t, x, y, r)

    END IF
  END IF
  IF a(x, y) > 1 THEN
  CLS
  LOCATE 15, 30
  SOUND 500, 3
  PRINT "GAME OVER"
  LOCATE 20, 30
  PRINT score
  SLEEP 2
  OPEN "records.txt" FOR INPUT AS #1
  fl = 0
  DO UNTIL EOF(1)
  fl = fl + 1
  INPUT #1, un(fl)
  INPUT #1, sc(fl)

  LOOP
  fl = fl + 1
  un(fl) = username
  sc(fl) = score
  FOR g = 1 TO fl
    FOR h = fl TO 2 STEP -1
      IF sc(h) > sc(h - 1) THEN
        SWAP sc(h), sc(h - 1)
        SWAP un(h), un(h - 1)
      END IF
    NEXT h
  NEXT g
  CLOSE #1
  SCREEN 0
  FOR g = 1 TO fl
    PRINT g, un(g), sc(g)
  NEXT g
  OPEN "records.txt" FOR OUTPUT AS #2
  FOR g = 1 TO fl
    PRINT #2, un(g)
    PRINT #2, sc(g)
  NEXT g
  CLOSE #2
  END
  END IF
  IF CYCL >= 6 THEN
  CLS
  LOCATE 15, 30
  PRINT "YOU WON!"
  LOCATE 17, 34
  PRINT "YOUR SCORE:"; score
  END
  END IF
  IF score > 1000 THEN
  CLS
  LOCATE 15, 30
  PRINT "YOU WON!"
  LOCATE 17, 34
  PRINT "SCORE:"; score
  END
  END IF

FOR i = 1 TO GGG
NEXT i
IF GGG > 4700 THEN GGG = GGG - .25
LOOP UNTIL k = CHR$(27)


FUNCTION CanDown% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
CanDown = 1
SELECT CASE t
  CASE 0
    IF x = 19 OR a(x + 2, y) > 0 OR a(x + 2, y + 1) > 0 THEN CanDown = 0
  CASE 1
    IF r = 2 OR r = 4 THEN
      IF x = 18 OR a(x + 3, y) > 0 THEN CanDown = 0
    END IF
    IF r = 1 OR r = 3 THEN
      IF x = 20 OR a(x + 1, y - 1) > 0 OR a(x + 1, y) > 0 OR a(x + 1, y + 1) > 0 OR a(x + 1, y + 2) > 0 THEN CanDown = 0
    END IF
  CASE 2
    IF r = 1 OR r = 3 THEN
      IF x = 19 OR a(x + 2, y - 1) > 0 OR a(x + 2, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
    ELSE
      IF x = 19 OR a(x + 1, y) > 0 OR a(x + 2, y + 1) > 0 THEN CanDown = 0
    END IF
  CASE 3
    IF r = 1 OR r = 3 THEN
      IF x = 19 OR a(x + 1, y - 1) > 0 OR a(x + 2, y) > 0 OR a(x + 2, y + 1) > 0 THEN CanDown = 0
    ELSE
      IF x = 19 OR a(x + 2, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
    END IF
  CASE 4
    SELECT CASE r
      CASE 1
        IF x = 19 OR a(x + 2, y) > 0 OR a(x + 2, y + 1) > 0 THEN CanDown = 0
      CASE 2
        IF x = 19 OR a(x + 2, y - 1) > 0 OR a(x + 1, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
      CASE 3
        IF x = 19 OR a(x, y - 1) > 0 OR a(x + 2, y) > 0 THEN CanDown = 0
      CASE 4
        IF x = 20 OR a(x + 1, y - 1) > 0 OR a(x + 1, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
    END SELECT
  CASE 5
    SELECT CASE r
      CASE 1
        IF x = 19 OR a(x + 2, y) > 0 OR a(x + 2, y - 1) > 0 THEN CanDown = 0
      CASE 2
        IF x = 20 OR a(x + 1, y - 1) > 0 OR a(x + 1, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
      CASE 3
        IF x = 19 OR a(x + 2, y) > 0 OR a(x, y + 1) > 0 THEN CanDown = 0
      CASE 4
        IF x = 19 OR a(x + 1, y - 1) > 0 OR a(x + 1, y) > 0 OR a(x + 2, y + 1) > 0 THEN CanDown = 0
    END SELECT
  CASE 6
    SELECT CASE r
      CASE 1
        IF x = 19 OR a(x + 1, y - 1) > 0 OR a(x + 2, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
      CASE 2
        IF x = 19 OR a(x + 1, y - 1) > 0 OR a(x + 2, y) > 0 THEN CanDown = 0
      CASE 3
        IF x = 20 OR a(x + 1, y - 1) > 0 OR a(x + 1, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
      CASE 4
        IF x = 19 OR a(x + 2, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanDown = 0
    END SELECT
  END SELECT
END FUNCTION

FUNCTION canleft% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
canleft = 1
SELECT CASE t
  CASE 0
    IF y = 1 OR a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 THEN canleft = 0
  CASE 1
    IF r = 1 OR r = 3 THEN
      IF y = 2 OR a(x, y - 2) > 0 THEN canleft = 0
      END IF
    IF r = 2 OR r = 4 THEN
      IF y = 1 OR a(x - 1, y - 1) > 0 OR a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 OR a(x + 2, y - 1) > 0 THEN canleft = 0
    END IF
  CASE 2
    IF r = 1 OR r = 3 THEN
      IF y = 2 OR a(x, y - 1) > 0 OR a(x + 1, y - 2) > 0 THEN canleft = 0
    END IF
    IF r = 2 OR r = 4 THEN
      IF y = 1 OR a(x - 1, y - 1) > 0 OR a(x, y - 1) > 0 OR a(x + 1, y) > 0 THEN canleft = 0
    END IF
  CASE 3
    IF r = 1 OR r = 3 THEN
      IF y = 2 OR a(x, y - 2) > 0 OR a(x + 1, y - 1) THEN canleft = 0
    END IF
    IF r = 2 OR r = 4 THEN
      IF y = 1 OR a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 OR a(x - 1, y) > 0 THEN canleft = 0
    END IF
  CASE 4
    SELECT CASE r
    CASE 1
      IF y = 1 OR a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 OR a(x + 2, y - 1) > 0 THEN canleft = 0
    CASE 2
      IF y = 2 OR a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 THEN canleft = 0
    CASE 3
      IF y = 2 OR a(x, y - 1) > 0 OR a(x + 1, y) > 0 OR a(x + 2, y) > 0 THEN canleft = 0
    CASE 4
      IF y = 2 OR a(x, y - 1) > 0 OR a(x - 1, y + 1) > 0 THEN canleft = 0
    END SELECT
  CASE 5
    SELECT CASE r
    CASE 1
      IF y = 2 OR a(x, y - 2) > 0 OR a(x - 1, y - 1) > 0 OR a(x - 2, y - 1) > 0 THEN canleft = 0
    CASE 2
      IF y = 2 OR a(x, y - 1) > 0 OR a(x - 1, y - 1) > 0 THEN canleft = 0
    CASE 3
      IF y = 1 OR a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 OR a(x + 2, y - 1) > 0 THEN canleft = 0
    CASE 4
      IF y = 2 OR a(x, y - 2) > 0 OR a(x + 1, y) > 0 THEN canleft = 0
    END SELECT
  CASE 6
    SELECT CASE r
    CASE 1
      IF y = 2 OR a(x, y - 2) > 0 OR a(x + 1, y - 1) > 0 THEN canleft = 0
    CASE 2
      IF y = 2 OR a(x - 1, y - 1) > 0 OR a(x, y - 2) > 0 OR a(x + 1, y - 1) > 0 THEN canleft = 0
    CASE 3
      IF y = 2 OR a(x, y - 2) > 0 OR a(x - 1, y - 1) > 0 THEN canleft = 0
    CASE 4
      IF y = 1 OR a(x - 1, y - 1) > 0 OR a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 THEN canleft = 0
    END SELECT
  END SELECT
END FUNCTION

FUNCTION CanRight% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
CanRight = 1
SELECT CASE t
CASE 0
  IF y = 9 OR a(x, y + 2) > 0 OR a(x + 1, y + 2) > 0 THEN CanRight = 0
CASE 1
  IF r = 1 OR r = 3 THEN
    IF y = 8 OR a(x, y + 3) > 0 THEN CanRight = 0
  END IF
  IF r = 2 OR r = 4 THEN
    IF y = 10 OR a(x + 3, y) > 0 THEN CanRight = 0
  END IF
CASE 2
  IF r = 1 OR r = 3 THEN
    IF y = 9 OR a(x, y + 2) > 0 OR a(x + 1, y + 1) > 0 THEN CanRight = 0
  END IF
  IF r = 2 OR r = 4 THEN
    IF y = 9 OR a(x - 1, y + 1) > 0 OR a(x, y + 2) > 0 OR a(x + 1, y + 2) > 0 THEN CanRight = 0
  END IF
CASE 3
  IF r = 1 OR r = 3 THEN
    IF y = 9 OR a(x, y + 1) > 0 OR a(x + 1, y + 2) > 0 THEN CanRight = 0
  END IF
  IF r = 2 OR r = 4 THEN
    IF y = 9 OR a(x - 1, y) > 0 OR a(x, y + 1) > 0 OR a(x + 1, y + 1) > 0 THEN CanRight = 0
  END IF
CASE 4
  SELECT CASE r
  CASE 1
    IF y = 9 OR a(x - 1, y + 1) > 0 OR a(x, y + 1) > 0 OR a(x + 1, y + 2) > 0 THEN CanRight = 0
  CASE 2
    IF y = 9 OR a(x, y + 2) > 0 OR a(x + 1, y) > 0 THEN CanRight = 0
  CASE 3
    IF y = 10 OR a(x - 1, y + 1) > 0 OR a(x, y + 1) > 0 OR a(x + 1, y + 1) > 0 THEN CanRight = 0
  CASE 4
    IF y = 9 OR a(x - 1, y + 2) > 0 OR a(x, y + 2) > 0 THEN CanRight = 0
  END SELECT
CASE 5
  SELECT CASE r
  CASE 1
    IF y = 10 OR a(x - 1, y + 1) > 0 OR a(x, y + 1) > 0 OR a(x + 1, y + 1) > 0 THEN CanRight = 0
  CASE 2
    IF y = 9 OR a(x, y + 2) > 0 OR a(x - 1, y) > 0 THEN CanRight = 0
  CASE 3
    IF y = 9 OR a(x - 1, y + 2) > 0 OR a(x, y + 1) > 0 OR a(x + 1, y + 1) > 0 THEN CanRight = 0
  CASE 4
    IF y = 9 OR a(x, y + 2) > 0 OR a(x + 1, y + 2) > 0 THEN CanRight = 0
  END SELECT
CASE 6
  SELECT CASE r
  CASE 1
    IF y = 9 OR a(x, y + 2) > 0 OR a(x + 1, y + 1) > 0 THEN CanRight = 0
  CASE 2
    IF y = 10 OR a(x - 1, y + 1) > 0 OR a(x, y + 1) > 0 OR a(x + 1, y + 1) > 0 THEN CanRight = 0
  CASE 3
    IF y = 9 OR a(x - 1, y + 1) > 0 OR a(x, y + 2) > 0 THEN CanRight = 0
  CASE 4
    IF y = 9 OR a(x, y + 2) > 0 OR a(x - 1, y + 1) > 0 THEN CanRight = 0
   END SELECT
END SELECT
END FUNCTION

FUNCTION CanRotate% (a() AS INTEGER, t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
CanRotate = 1
  SELECT CASE t
    CASE 1
      IF r = 1 OR r = 3 THEN
        IF a(x - 1, y) > 0 OR a(x + 1, y) > 0 OR a(x + 2, y) > 0 OR x > 18 THEN CanRotate = 0
      END IF
      IF r = 2 OR r = 4 THEN
        IF a(x, y - 1) > 0 OR a(x, y + 1) > 0 OR a(x, y + 2) > 0 OR y = 1 OR y = 10 OR y = 9 THEN CanRotate = 0
      END IF
    CASE 2
      IF r = 1 OR r = 3 THEN
        IF a(x - 1, y) > 0 OR a(x + 1, y + 1) > 0 THEN CanRotate = 0
      END IF
      IF r = 2 OR r = 4 THEN
        IF a(x + 1, y) > 0 OR a(x + 1, y - 1) > 0 OR y = 1 OR y = 10 THEN CanRotate = 0
      END IF
    CASE 3
      IF r = 1 OR r = 3 THEN
        IF a(x - 1, y + 1) > 0 OR a(x, y + 1) > 0 THEN CanRotate = 0
      END IF
      IF r = 2 OR r = 4 THEN
        IF a(x, y - 1) > 0 OR a(x + 1, y + 1) > 0 OR y = 1 THEN CanRotate = 0
      END IF
    CASE 4
      SELECT CASE r
        CASE 1
          IF a(x, y - 1) > 0 OR a(x + 1, y - 1) > 0 OR a(x, y + 1) > 0 OR y = 1 THEN CanRotate = 0
        CASE 2
          IF a(x - 1, y) > 0 OR a(x + 1, y) > 0 OR a(x + 1, y - 1) > 0 THEN CanRotate = 0
        CASE 3
          IF a(x, y - 1) > 0 OR a(x, y + 1) > 0 OR a(x - 1, y + 1) > 0 OR y = 10 THEN CanRotate = 0
        CASE 4
          IF a(x + 1, y) > 0 OR a(x - 1, y) > 0 OR a(x + 1, y + 1) > 0 OR x = 20 THEN CanRotate = 0
      END SELECT
    CASE 5
      SELECT CASE r
        CASE 1
          IF a(x, y - 1) > 0 OR a(x, y + 1) > 0 OR a(x - 1, y - 1) > 0 OR y = 10 THEN CanRotate = 0
        CASE 2
          IF a(x - 1, y) > 0 OR a(x + 1, y) > 0 OR a(x - 1, y + 1) > 0 OR x = 20 THEN CanRotate = 0
        CASE 3
          IF a(x, y - 1) > 0 OR a(x, y + 1) > 0 OR a(x + 1, y + 1) > 0 OR y = 1 THEN CanRotate = 0
        CASE 4
          IF a(x - 1, y) > 0 OR a(x + 1, y) > 0 OR a(x + 1, y - 1) > 0 THEN CanRotate = 0
      END SELECT
    CASE 6
      SELECT CASE r
        CASE 1
          IF a(x - 1, y) > 0 THEN CanRotate = 0
        CASE 2
          IF a(x, y + 1) > 0 OR y = 10 THEN CanRotate = 0
        CASE 3
          IF a(x + 1, y) > 0 OR x = 20 THEN CanRotate = 0
        CASE 4
          IF a(x, y - 1) > 0 OR y = 1 THEN CanRotate = 0
      END SELECT
  END SELECT
END FUNCTION

SUB DrawFig (t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
SELECT CASE t
CASE 0
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(220 + 40 + (y - 1) * 20, 0 + 40 + (x - 1) * 20), 2, BF' 䨣��� 0
CASE 1
IF r = 1 OR r = 3 THEN
LINE (221 - 20 + (y - 1) * 20, 1 + (x - 1) * 20)-(280 + (y - 1) * 20, 0 + (x * 20)), 5, BF
ELSE
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(220 + y * 20, 60 + (x - 1) * 20), 5, BF
END IF
CASE 3
IF r = 1 OR r = 3 THEN
LINE (201 + (y - 1) * 20, 1 + (x - 1) * 20)-(240 + (y - 1) * 20, 0 + 20 + (x - 1) * 20), 4, BF
LINE (221 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + 20 + (x - 1) * 20), 4, BF
ELSE
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 4, BF
LINE (241 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + 20 + (y - 1) * 20, 20 + (x - 1) * 20), 4, BF
END IF
CASE 2
IF r = 1 OR r = 3 THEN
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + 20 + (x - 1) * 20), 5, BF
LINE (221 - 20 + (y - 1) * 20, 21 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 5, BF
ELSE
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(220 + 20 + (y - 1) * 20, 20 + (x - 1) * 20), 5, BF
LINE (241 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 40 + (x - 1) * 20), 5, BF
END IF
CASE 4
SELECT CASE r
CASE 1
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 6, BF
LINE (241 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 40 + (x - 1) * 20), 6, BF
CASE 2
LINE (221 + (y - 2) * 20, 1 + (x - 1) * 20)-(220 + (y + 1) * 20, 20 + (x - 1) * 20), 6, BF
LINE (221 + (y - 2) * 20, 21 + (x - 1) * 20)-(220 + (y - 1) * 20, 40 + (x - 1) * 20), 6, BF
CASE 3
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + (y - 1) * 20, 0 + 40 + (x - 1) * 20), 6, BF
LINE (201 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(220 + (y - 1) * 20, 0 + (x - 1) * 20), 6, BF
CASE 4
LINE (221 - 20 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 6, BF
LINE (241 + (y - 1) * 20, -19 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + (x - 1) * 20), 6, BF
END SELECT
CASE 5
SELECT CASE r
CASE 1
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 1, BF
LINE (201 + (y - 1) * 20, 21 + (x - 1) * 20)-(220 + (y - 1) * 20, 40 + (x - 1) * 20), 1, BF
CASE 2
LINE (201 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 1, BF
LINE (201 + (y - 1) * 20, -19 + (x - 1) * 20)-(220 + (y - 1) * 20, 0 + (x - 1) * 20), 1, BF
CASE 3
LINE (221 + (y - 1) * 20, -19 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 1, BF
LINE (241 + (y - 1) * 20, -19 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + (x - 1) * 20), 1, BF
CASE 4
LINE (221 - 20 + (y - 1) * 20, 1 + (x - 1) * 20)-(280 - 20 + (y - 1) * 20, 20 + (x - 1) * 20), 1, BF
LINE (241 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 40 + (x - 1) * 20), 1, BF
END SELECT
CASE 6
SELECT CASE r
CASE 1
LINE (201 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 1, BF
LINE (221 + (y - 1) * 20, 21 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 1, BF
CASE 2
LINE (221 + (y - 1) * 20, -19 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 1, BF
LINE (201 + (y - 1) * 20, 21 + (x - 1) * 20)-(220 + (y - 1) * 20, 0 + (x - 1) * 20), 1, BF
CASE 3
LINE (201 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + (x - 1) * 20), 1, BF
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(240 + (y - 1) * 20, -20 + (x - 1) * 20), 1, BF
CASE 4
LINE (221 + (y - 1) * 20, -19 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 1, BF
LINE (241 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 1, BF
END SELECT
END SELECT
END SUB

SUB KillFig (t AS INTEGER, x AS INTEGER, y AS INTEGER, r AS INTEGER)
SELECT CASE t
CASE 0
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(220 + 40 + (y - 1) * 20, 0 + 40 + (x - 1) * 20), 0, BF' 䨣��� 0
CASE 1
IF r = 1 OR r = 3 THEN
LINE (221 - 20 + (y - 1) * 20, 1 + (x - 1) * 20)-(280 + (y - 1) * 20, 0 + (x * 20)), 0, BF
ELSE
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(220 + y * 20, 60 + (x - 1) * 20), 0, BF
END IF
CASE 3
IF r = 1 OR r = 3 THEN
LINE (201 + (y - 1) * 20, 1 + (x - 1) * 20)-(240 + (y - 1) * 20, 0 + 20 + (x - 1) * 20), 0, BF
LINE (221 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + 20 + (x - 1) * 20), 0, BF
ELSE
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
LINE (241 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + 20 + (y - 1) * 20, 20 + (x - 1) * 20), 0, BF
END IF
CASE 2
IF r = 1 OR r = 3 THEN
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + 20 + (x - 1) * 20), 0, BF
LINE (221 - 20 + (y - 1) * 20, 21 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
ELSE
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(220 + 20 + (y - 1) * 20, 20 + (x - 1) * 20), 0, BF
LINE (241 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
END IF
CASE 4
SELECT CASE r
CASE 1
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
LINE (241 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
CASE 2
LINE (221 + (y - 2) * 20, 1 + (x - 1) * 20)-(220 + (y + 1) * 20, 20 + (x - 1) * 20), 0, BF
LINE (221 + (y - 2) * 20, 21 + (x - 1) * 20)-(220 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
CASE 3
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + (y - 1) * 20, 0 + 40 + (x - 1) * 20), 0, BF
LINE (201 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(220 + (y - 1) * 20, 0 + (x - 1) * 20), 0, BF
CASE 4
LINE (221 - 20 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 0, BF
LINE (241 + (y - 1) * 20, -19 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + (x - 1) * 20), 0, BF
END SELECT
CASE 5
SELECT CASE r
CASE 1
LINE (221 + (y - 1) * 20, 1 - 20 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
LINE (201 + (y - 1) * 20, 21 + (x - 1) * 20)-(220 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
CASE 2
LINE (201 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 0, BF
LINE (201 + (y - 1) * 20, -19 + (x - 1) * 20)-(220 + (y - 1) * 20, 0 + (x - 1) * 20), 0, BF
CASE 3
LINE (221 + (y - 1) * 20, -19 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
LINE (241 + (y - 1) * 20, -19 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + (x - 1) * 20), 0, BF
CASE 4
LINE (221 - 20 + (y - 1) * 20, 1 + (x - 1) * 20)-(280 - 20 + (y - 1) * 20, 20 + (x - 1) * 20), 0, BF
LINE (241 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
END SELECT
CASE 6
SELECT CASE r
CASE 1
LINE (201 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 0, BF
LINE (221 + (y - 1) * 20, 21 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
CASE 2
LINE (221 + (y - 1) * 20, -19 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
LINE (201 + (y - 1) * 20, 21 + (x - 1) * 20)-(220 + (y - 1) * 20, 0 + (x - 1) * 20), 0, BF
CASE 3
LINE (201 + (y - 1) * 20, 21 + (x - 1) * 20)-(260 + (y - 1) * 20, 0 + (x - 1) * 20), 0, BF
LINE (221 + (y - 1) * 20, 1 + (x - 1) * 20)-(240 + (y - 1) * 20, -20 + (x - 1) * 20), 0, BF
CASE 4
LINE (221 + (y - 1) * 20, -19 + (x - 1) * 20)-(240 + (y - 1) * 20, 40 + (x - 1) * 20), 0, BF
LINE (241 + (y - 1) * 20, 1 + (x - 1) * 20)-(260 + (y - 1) * 20, 20 + (x - 1) * 20), 0, BF
END SELECT
END SELECT
END SUB
