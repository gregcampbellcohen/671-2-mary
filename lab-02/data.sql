/* Add your SQL below to extract analyze your state data from at least four layers */

/* *************************************************************** */

/* 1: Extract Virginia polygon */

create table
  virginia_polygon
as
select
  *
from
  US_States
where
/* Include only Virginia */
  "state_abbr" = 'VA'  
/* *************************************************************** */

/* 2: Extract Virginia's urban area polygons */

create table
	virginia_urbanareas
as
select
	*
from
/* Select from 'UrbanAreas' */
	UrbanAreas
where
/* Include Urban Areas that extend into other states */
	"state" LIKE '%VA%'

/* *************************************************************** */

/* 3: Extract Virginia's waterbodies polygons */

create table
	virginia_waterbodies
as
select
	*
from
/* Select from 'NHD_Waterbodies' */
	NHD_Waterbodies
where
/* Include waterbodies that extend into other states */
	"state" LIKE '%VA%'

/* *************************************************************** */

/* 4: Extract Virginia's stream lines ordered by size of stream */
create table
  virginia_streams
as
select
	*
from
	NHD_Streams
where
/* include streams that extend into other states */
	"state" LIKE '%VA%'
order by
/* order by size, from largest to smallest */
	"Shape_Length" DESC