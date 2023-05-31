-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "ALTER EXTENSION vector UPDATE TO '0.4.3'" to load this file. \quit

CREATE FUNCTION vector_mul(vector, vector) RETURNS vector
	AS 'MODULE_PATHNAME' LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE OPERATOR * (
	LEFTARG = vector, RIGHTARG = vector, PROCEDURE = vector_mul,
	COMMUTATOR = *
);
