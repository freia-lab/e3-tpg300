#- Only Relays 1 - -4 are supported (there is no support for relays A and B, see TPG300 documentation).
#- One can attach one or two relays to any controller's channel (relay can be attched only to one channel)
#- Some macro macro definitions are connected with each other and MUST be always the same like below:

#- RELAY1_SOURCE = A, RELAY1 = 1
#- RELAY1_SOURCE = B, RELAY1 = 2
#- RELAY1_SOURCE = C, RELAY1 = 3
#- RELAY1_SOURCE = D, RELAY1 = 4

#- RELAY1_SOURCE = A, RELAY2 = 1
#- RELAY1_SOURCE = B, RELAY2 = 2
#- RELAY1_SOURCE = C, RELAY2 = 3
#- RELAY1_SOURCE = D, RELAY2 = 4

# CHANNEL = A1, SOURCE = A
# CHANNEL = A2, SOURCE = B
# CHANNEL = B1, SOURCE = C
# CHANNEL = B2, SOURCE = D

#- BOARD - must be PE or PI and correspond to the board sitting in the controller
#- GAUGE - any string describing the gauge connected to a given channel
#- CONTROLLER - any string - is the prefix to the PVs related to the controller
#- DEVICENAME - is the prefix for the PVs of the gauge connected to a given channel

require tpg300

epicsEnvSet("STREAM_PROTOCOL_PATH","$(tpg300_DB)")
epicsEnvSet ("IOCNAME", "ioc01-tpg300")

iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-9, IPADDR = 192.168.10.7, PORT = 4014")

#dbLoadRecords("$(asyn_DB)/asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='TPG300-1',ADDR='0',IMAX='1024',OMAX='256'")
#dbLoadRecords("asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='TPG300-1',ADDR='0',IMAX='1024',OMAX='256'")

#iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_freia.iocsh, "DEVICENAME = CH-A1, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = A, RELAY1 = 1, RELAY2_SOURCE = B, RELAY2 = 2")
#iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CH-A1, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = A, RELAY1 = 1")
#iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_no_relays_freia.iocsh, "DEVICENAME = CH-A1, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = TPR18")

# TPG300-9 configuration: Sensor A1 Relay1, Sensor B1 Relay2, Sensor A2 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT052, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-9, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT053, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-9, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT054, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-9, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT055, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-9, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = D, RELAY1 = 4")

