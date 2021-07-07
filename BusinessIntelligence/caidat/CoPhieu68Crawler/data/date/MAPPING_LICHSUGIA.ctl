-- /****************************************************************************
--  
--  Generator Version           : 11.2.0.1.0
--  Created Date                : Sun Jul 04 17:02:01 ICT 2021
--  Modified Date               : Sun Jul 04 17:02:01 ICT 2021
--  Created By                  : work_owb
--  Modified By                 : work_owb
--  Generated Object Type       : SQL*Loader Control File
--  Generated Object Name       : "MAPPING_LICHSUGIA"

--  Copyright (c) 2000, 2021, Oracle. All rights reserved.
-- ****************************************************************************/


OPTIONS (BINDSIZE=50000,ERRORS=50,ROWS=200,READSIZE=65536)
LOAD DATA
  CHARACTERSET WE8MSWIN1252
  INFILE 'C:\Users\LAP11777-local\Documents\GitHub\backup2\master_2nd_semester\BusinessIntelligence\caidat\CoPhieu68Crawler\data\date\01-01-2016.csv' 
INTO TABLE "WORK_OWB"."LICHSUGIA"
  APPEND
  REENABLE DISABLED_CONSTRAINTS
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
(
"MACP" POSITION(1) CHAR ,
"NGAY" DATE ,
"GIAMOCUA" FLOAT EXTERNAL ,
"GIACAONHAT" FLOAT EXTERNAL ,
"GIATHAPNHAT" FLOAT EXTERNAL ,
"GIADONGCUA" FLOAT EXTERNAL ,
"VOLUME" INTEGER EXTERNAL 
)