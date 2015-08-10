#!../../bin/linux-x86_64/tpg300-freia

## You may have to change tpg300-freia to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("PREFIX-1", "TPG300-1")
epicsEnvSet("PREFIX-2", "TPG300-2")
epicsEnvSet("PREFIX-3", "TPG300-3")
epicsEnvSet("PREFIX-4", "TPG300-4")

epicsEnvSet("TPG_ADDR-1", "192.168.10.9:4015")
epicsEnvSet("TPG_PORT-1", "TPG-1")
epicsEnvSet("TPG_ADDR-2", "192.168.10.9:4016")
epicsEnvSet("TPG_PORT-2", "TPG-2")
epicsEnvSet("TPG_ADDR-3", "192.168.10.9:4014")
epicsEnvSet("TPG_PORT-3", "TPG-3")
epicsEnvSet("TPG_ADDR-4", "192.168.10.9:4011")
epicsEnvSet("TPG_PORT-4", "TPG-4")
epicsEnvSet("TPG_SCAN", "1 second")

epicsEnvSet("STREAM_PROTOCOL_PATH", "${CODAC_ROOT}/protocol")

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/tpg300-freia.dbd"
tpg300_freia_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure(${TPG_PORT-1}, ${TPG_ADDR-1})
drvAsynIPPortConfigure(${TPG_PORT-2}, ${TPG_ADDR-2})
drvAsynIPPortConfigure(${TPG_PORT-3}, ${TPG_ADDR-3})
drvAsynIPPortConfigure(${TPG_PORT-4}, ${TPG_ADDR-4})

tpg300InterposeConfig(${TPG_PORT-1})
tpg300InterposeConfig(${TPG_PORT-2})
tpg300InterposeConfig(${TPG_PORT-3})
tpg300InterposeConfig(${TPG_PORT-4})

## Load record instances
dbLoadRecords("${EPICS_MODULES}/tpg300/db/tpg300.db", "PREFIX=${PREFIX-1},TPG_PORT=${TPG_PORT-1},SCAN_RATE=${TPG_SCAN}")
dbLoadRecords("${EPICS_MODULES}/tpg300/db/tpg300.db", "PREFIX=${PREFIX-2},TPG_PORT=${TPG_PORT-2},SCAN_RATE=${TPG_SCAN}")
dbLoadRecords("${EPICS_MODULES}/tpg300/db/tpg300.db", "PREFIX=${PREFIX-3},TPG_PORT=${TPG_PORT-3},SCAN_RATE=${TPG_SCAN}")
dbLoadRecords("${EPICS_MODULES}/tpg300/db/tpg300.db", "PREFIX=${PREFIX-4},TPG_PORT=${TPG_PORT-4},SCAN_RATE=${TPG_SCAN}")
cd ${TOP}/db
dbLoadTemplate("aliases.substitutions")
dbLoadRecords("isol_vac_intrl.db", "P=CstatH-Vac,B=HNOSS,ACT1=StartPmp,ACT2=StopPmp,P_IN=PT004,P_OUT1=PT015,T_IN=LN2:TT214A,FV=FV001,TP=TP002")
dbLoadRecords("isol_vac_intrl.db", "P=CstatH-Vac,B=IBox,ACT1=StartPmp,ACT2=StopPmp,P_IN=PT001,P_OUT1=PT014,T_IN=IBoxN2:TT401B,FV=FV000,TP=TP001")
dbLoadRecords("vac_intrl_TPs.db", "P=CstatH-Vac,ACT1=StartPmp")

cd ${TOP}/iocBoot/${IOC}
iocInit
