--1 8.	Write a PYTHON program to input any alphabet and check whether it is vowel or consonant.


SET SERVEROUTPUT ON
DECLARE 

ALPHA_01 CHAR := &ALPHA;




BEGIN

IF  LOWER(ALPHA_01)  IN ('a' ,'e','i','o','u')
    THEN 
	DBMS_OUTPUT.PUT_LINE(' IT IS vowel');
	
ELSE 
    DBMS_OUTPUT.PUT_LINE('IT IS CONSONANT');
	

END IF;
	


 

END ;

--2 11.	Write a Python program to input week number and print week day.

SET SERVEROUTPUT ON 
DECLARE 

WEEK_DAY_NO NUMBER := &nuM;

BEGIN 
IF WEEK_DAY_NO = 1
   THEN 
   DBMS_OUTPUT.PUT_LINE('MONDAY');
ELSIF  WEEK_DAY_NO = 2
   THEN 
   DBMS_OUTPUT.PUT_LINE('TUESDAY');
   
ELSIF WEEK_DAY_NO = 3
    THEN 
	DBMS_OUTPUT.PUT_LINE('WEDNESDAY');
ELSIF WEEK_DAY_NO = 4
    THEN 
	DBMS_OUTPUT.PUT_LINE('THRUSDAY');
ELSIF WEEK_DAY_NO = 5
     THEN 
	 DBMS_OUTPUT.PUT_LINE('FRIDAY');
ELSIF WEEK_DAY_NO = 6
      THEN 
	  DBMS_OUTPUT.PUT_LINE('SATURDAY');
ELSIF WEEK_DAY_NO = 7
      THEN 
      DBMS_OUTPUT.PUT_LINE('SUNDAY');
ELSE 
   DBMS_OUTPUT.PUT_LINE('INVALID WEEK NUMBER ');
END IF;
END ;

/*--319.	Write a Python program to input marks of five subjects Physics, Chemistry, Biology, Mathematics and Computer. Calculate percentage and grade according to following:
Percentage >= 90% : Grade A
Percentage >= 80% : Grade B
Percentage >= 70% : Grade C
Percentage >= 60% : Grade D                  --PERCENTAGE (PART I GOT /TOTAL MARKS IN EXAM )*100;
Percentage >= 40% : Grade E
Percentage < 40% : Grade F*/

SET SERVEROUTPUT ON 
DECLARE 
Physics_M NUMBER := &PHY;
CHEMISTRY NUMBER := &CHEM;
BIOLOGY NUMBER := &BIO;
MATHS NUMBER := &NUM;
COMPUTER NUMBER := &COM;
TOTAL NUMBER := Physics_M  +CHEMISTRY+ BIOLOGY+ MATHS + COMPUTER ;


BEGIN
IF (TOTAL /500)*100 >= 40
    THEN
    IF  (TOTAL /500)*100 >= 60
	    THEN 
		IF (TOTAL/500)*100 >= 70
		    THEN 
			IF (TOTAL/500)*100>= 80
			    THEN 
				IF (TOTAL /500)*100 >= 90
				  THEN
				    DBMS_OUTPUT.PUT_LINE('GRADE A');
				ELSE 
				    DBMS_OUTPUT.PUT_LINE('GRADE B');
				END IF;
			ELSE 
			    DBMS_OUTPUT.PUT_LINE('GRADE C');
			END IF;
		ELSE 
		  DBMS_OUTPUT.PUT_LINE('GRADE D');
		END IF;
	
		
		   
				
			
    ELSE
	   DBMS_OUTPUT.PUT_LINE('GRADE E');
	   
    END IF; 
ELSIF (TOTAL /500)*100 < 40
   THEN
     DBMS_OUTPUT.PUT_LINE('GRADE F') ;
     
ELSE 
  DBMS_OUTPUT.PUT_LINE('INVALID MARKS');
   
   
    --FAIL
END IF ;
END ;
	 

--4 
/*
20.	Write a Python program to input basic salary of an employee and calculate its Gross salary according to following:
Basic Salary <= 10000 : HRA = 20%, DA = 80%
Basic Salary <= 20000 : HRA = 25%, DA = 90%
Basic Salary > 20000 : HRA = 30%, DA = 95%
*/

SET SERVEROUTPUT ON 
DECLARE 
GROSS_SAL NUMBER ;
F_NAME VARCHAR2(20) ;
EMP_ID  NUMBER := &EP;
SAL NUMBER ;
BEGIN

SELECT FIRST_NAME , SALARY  INTO F_NAME , Sal
FROM EMPLOYEES
WHERE EMPLOYEE_ID = EMP_ID;

DBMS_OUTPUT.PUT_LINE(F_NAME || sal);


IF SAL >  20000
  THEN 
   GROSS_SAL := SAL + SAL*0.30 + SAL+ SAL*0.95;
   DBMS_OUTPUT.PUT_LINE(GROSS_SAL);
   
ELSIF SAL <= 20000
   THEN 
   GROSS_SAL := SAL + SAL*0.25 + SAL*0.90;
   DBMS_OUTPUT.PUT_LINE(GROSS_SAL);
   
ELSIF  SAL <= 10000
  THEN 
  GROSS_SAL := SAL + SAL*0.20 + SAL*0.80;
  DBMS_OUTPUT.PUT_LINE(GROSS_SAL);
   
    
END IF;
END ;


--521.	Write a Python program to input electricity unit charges and calculate total electricity bill according to the given condition:
/*For first 50 units Rs. 0.50/unit
For next 100 units Rs. 0.75/unit
For next 100 units Rs. 1.20/unit
For unit above 250 Rs. 1.50/unit
	An additional surcharge of 20% is added to the bill */
SET SERVEROUTPUT ON	
DECLARE
UNIT NUMBER := &NUM;
NET_BILL  NUMBER ;
BILL NUMBER ;


BEGIN
IF UNIT = 50 
   THEN 
   BILL := UNIT*0.50;
   NET_BILL := BILL + BILL*0.20;
   DBMS_OUTPUT.PUT_LINE(NET_BILL);
ELSIF UNIT <= 150 
    THEN 
	
	BILL := ((UNIT - 50) * 0.75) + (50*0.50);
	NET_BILL := BILL + BILL*0.20;
    DBMS_OUTPUT.PUT_LINE(NET_BILL);
ELSIF UNIT <= 250
    THEN 
	
	BILL := (50 * 0.50) + (100 * 0.75) + ((UNIT - 150) *1.20);
	NET_BILL := BILL + BILL*0.20;
    DBMS_OUTPUT.PUT_LINE(NET_BILL);
	

ELSIF UNIT > 250
    THEN
    BILL := (50 * 0.50) + (100 * 0.75) + (100 * 1.20) + ((UNIT - 250) * 1.50);
	NET_BILL := BILL + BILL*0.20;
    DBMS_OUTPUT.PUT_LINE(NET_BILL);
	
	
	
	
	
END IF;
END ;

--6 14.	Write a Python program to input angles of a triangle and check whether triangle is valid or not
   SET SERVEROUTPUT ON 
   DECLARE 
   ANGLE_1 NUMBER := &A1;
   ANGLE_2 NUMBER := &B2;
   ANGLE_3 NUMBER := &C3;
   BEGIN
   IF ANGLE_1 + ANGLE_2 + ANGLE_3 = 180
     THEN 
	 DBMS_OUTPUT.PUT_LINE('TRAIANGLE IS VALID');
	ELSE 
	  DBMS_OUTPUT.PUT_LINE('TRIANGLE IS NOT VALID');
   END IF;
   
   END ;

--7 15.	Write a Python program to input all sides of a triangle and check whether triangle is valid or not
    SET SERVEROUTPUT ON 
	DECLARE 
	A NUMBER := &SIDE1;
	B NUMBER := &SIDE2;
	C NUMBER := &SIDE3;
	BEGIN 
	IF A + B > C   
	   THEN 
	      IF B+ C > A
	        THEN
                IF C + A > B
                    THEN				
			
	                    DBMS_OUTPUT.PUT_LINE('TRIANGLE IS VALID');
				ELSE 
				    DBMS_OUTPUT.PUT_LINE('TRIANGLE IS NOT VALID');
				END IF;
	   
	       ELSE
	           DBMS_OUTPUT.PUT_LINE('TRIANGLE IS NOT VALID');
		   END IF;
	   
	ELSE 
	   DBMS_OUTPUT.PUT_LINE('TRIANGLE IS  NOT VALID');
	
	   
	END IF;
	END;
--8  18.	Write a Python program to calculate profit or loss.

   SET SERVEROUTPUT ON 
   DECLARE
   CP NUMBER := &COST;
   SELL_PRICE NUMBER  := &CP;
   PROFIT NUMBER ;
   LOSS NUMBER ;
   
   BEGIN 
   IF SELL_PRICE - CP  > 0
        
       THEN 
           PROFIT := SELL_PRICE - CP;
	       DBMS_OUTPUT.PUT_LINE('IT IS NET PROFIT '||' '|| PROFIT );
    ELSIF  SELL_PRICE - CP < 0
	    
	    THEN 
            LOSS := CP - SELL_PRICE;
		    DBMS_OUTPUT.PUT_LINE('LOSS HAS OCCURED OF AMMOUNT :'||' '|| LOSS);
	ELSE 
	    DBMS_OUTPUT.PUT_LINE('BREAK_EVEN');
	       
   
   
   END IF;
   END;
   
   
--- 9  17.	Write a Python program to find all roots of a quadratic equation.

        +
		 

