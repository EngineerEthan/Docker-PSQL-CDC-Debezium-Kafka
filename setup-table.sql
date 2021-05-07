-- Postgres has to have a PK for replication, which has to occur for logical WAL

CREATE TABLE public.etltest (
	etlid int NOT NULL GENERATED ALWAYS AS IDENTITY,
	lastupdated timestamp(0) NOT NULL DEFAULT current_timestamp,
	editme varchar null,
  	CONSTRAINT pk_etltest PRIMARY KEY (etlid)
);

-- Column comments

COMMENT ON COLUMN public.etltest.lastupdated IS 'need to make sure users cannot edit it either';
