EXCLUDE_ARCHS += eldk
EXCLUDE_VERSIONS += 3.14.12.5

include ${EPICS_ENV_PATH}/module.Makefile

USR_DEPENDENCIES += tpg300,freia_1_3_2
USR_DEPENDENCIES += asyn,4.31.0+

PROJECT = ioc_tpg300_freia

STARTUPS = $(wildcard src/main/ioc/*.cmd)
OPIS= src/main/boy

