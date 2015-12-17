EXCLUDE_ARCHS += eldk
EXCLUDE_VERSIONS += 3.15.2

include ${EPICS_ENV_PATH}/module.Makefile

PROJECT = tpg300_freia

STARTUPS = $(wildcard src/main/ioc/*.cmd)
