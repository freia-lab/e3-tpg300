#require tpg300_freia,konrad
require ioc_tpg300_freia

epicsEnvSet("PREFIX-1", "TPG300-1")
epicsEnvSet("PREFIX-2", "TPG300-2")
epicsEnvSet("PREFIX-3", "TPG300-3")
epicsEnvSet("PREFIX-4", "TPG300-4")
epicsEnvSet("PREFIX-5", "TPG300-5")

epicsEnvSet("TPG_ADDR-1", "192.168.10.9:4015")
epicsEnvSet("TPG_PORT-1", "TPG-1")
epicsEnvSet("TPG_ADDR-2", "192.168.10.9:4016")
epicsEnvSet("TPG_PORT-2", "TPG-2")
epicsEnvSet("TPG_ADDR-3", "192.168.10.9:4014")
epicsEnvSet("TPG_PORT-3", "TPG-3")
epicsEnvSet("TPG_ADDR-4", "192.168.10.9:4011")
epicsEnvSet("TPG_PORT-4", "TPG-4")
epicsEnvSet("TPG_ADDR-5", "192.168.10.9:4013")
epicsEnvSet("TPG_PORT-5", "TPG-5")
epicsEnvSet("TPG_SCAN", "1 second")

#epicsEnvSet("STREAM_PROTOCOL_PATH", "${CODAC_ROOT}/protocol")

drvAsynIPPortConfigure(${TPG_PORT-1}, ${TPG_ADDR-1})
drvAsynIPPortConfigure(${TPG_PORT-2}, ${TPG_ADDR-2})
drvAsynIPPortConfigure(${TPG_PORT-3}, ${TPG_ADDR-3})
drvAsynIPPortConfigure(${TPG_PORT-4}, ${TPG_ADDR-4})
drvAsynIPPortConfigure(${TPG_PORT-5}, ${TPG_ADDR-5})

tpg300InterposeConfig(${TPG_PORT-1})
tpg300InterposeConfig(${TPG_PORT-2})
tpg300InterposeConfig(${TPG_PORT-3})
tpg300InterposeConfig(${TPG_PORT-4})
tpg300InterposeConfig(${TPG_PORT-5})

## Load record instances
dbLoadRecords("tpg300.db", "PREFIX=${PREFIX-1},TPG_PORT=${TPG_PORT-1},SCAN_RATE=${TPG_SCAN}")
dbLoadRecords("tpg300.db", "PREFIX=${PREFIX-2},TPG_PORT=${TPG_PORT-2},SCAN_RATE=${TPG_SCAN}")
dbLoadRecords("tpg300.db", "PREFIX=${PREFIX-3},TPG_PORT=${TPG_PORT-3},SCAN_RATE=${TPG_SCAN}")
dbLoadRecords("tpg300.db", "PREFIX=${PREFIX-4},TPG_PORT=${TPG_PORT-4},SCAN_RATE=${TPG_SCAN}")
dbLoadRecords("tpg300.db", "PREFIX=${PREFIX-5},TPG_PORT=${TPG_PORT-5},SCAN_RATE=${TPG_SCAN}")

#dbLoadTemplate("aliases.substitutions")
dbLoadRecords("aliases.template","PREFIX=TPG300-1,P=CstatH-Vac,CHA1=PT010,CHA2=PT011,CHB1=PT012,CHB2=PT013")
dbLoadRecords("aliases.template","PREFIX=TPG300-2,P=CstatH-Vac,CHA1=PT016,CHA2=PT014,CHB1=PT017,CHB2=PT015")
dbLoadRecords("aliases.template","PREFIX=TPG300-3,P=CstatH-Vac,CHA1=PT020,CHA2=PT021,CHB1=PT022,CHB2=PT023")
dbLoadRecords("aliases.template","PREFIX=TPG300-4,P=CstatH-Vac,CHA1=PT024,CHA2=PT025,CHB1=PT026,CHB2=PT027")
dbLoadRecords("aliases.template","PREFIX=TPG300-5,P=CstatH-Vac,CHA1=PT028,CHA2=PT095,CHB1=PT030,CHB2=PT031")

dbLoadRecords("isol_vac_intrl.db", "P=CstatH-Vac,B=HNOSS,ACT1=StartPmp,ACT2=StopPmp,P_IN=PT004,P_OUT1=PT015,T_IN=LN2:TT214A,FV=FV001,TP=TP002")
dbLoadRecords("isol_vac_intrl.db", "P=CstatH-Vac,B=IBox,ACT1=StartPmp,ACT2=StopPmp,P_IN=PT001,P_OUT1=PT014,T_IN=IBoxN2:TT401B,FV=FV000,TP=TP001")
dbLoadRecords("vac_intrl_TPs.db", "P=CstatH-Vac,ACT1=StartPmp")

iocInit
