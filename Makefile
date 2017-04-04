EXCLUDE_ARCHS += eldk
#EXCLUDE_VERSIONS += 3.15.2

include ${EPICS_ENV_PATH}/module.Makefile

USR_DEPENDENCIES += tpg300,freia_1_3_2
PROJECT = ioc_tpg300_freia

STARTUPS = $(wildcard src/main/ioc/*.cmd)
OPIS= src/main/boy

