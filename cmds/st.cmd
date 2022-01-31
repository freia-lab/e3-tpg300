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
epicsEnvSet ("IOCNAME", "ioc06-tpg300")

iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-1, IPADDR = 192.168.10.9, PORT = 4015")
iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-2, IPADDR = 192.168.10.9, PORT = 4016")
iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-3, IPADDR = 192.168.10.9, PORT = 4014")
iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-4, IPADDR = 192.168.10.9, PORT = 4011")
iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-5, IPADDR = 192.168.10.9, PORT = 4013")
iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-7, IPADDR = 192.168.10.7, PORT = 4016")
iocshLoad(${tpg300_DIR}/vac_ctrl_tpg300_500_moxa.iocsh, "DEVICENAME = TPG300-8, IPADDR = 192.168.10.7, PORT = 4015")

#dbLoadRecords("$(asyn_DB)/asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='TPG300-1',ADDR='0',IMAX='1024',OMAX='256'")
dbLoadRecords("asynRecord.db","P=$(IOCNAME),R=:asynRec,PORT='TPG300-1',ADDR='0',IMAX='1024',OMAX='256'")

#iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_freia.iocsh, "DEVICENAME = CH-A1, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = A, RELAY1 = 1, RELAY2_SOURCE = B, RELAY2 = 2")
#iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CH-A1, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = A, RELAY1 = 1")
#iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_no_relays_freia.iocsh, "DEVICENAME = CH-A1, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = TPR18")

# TPG300-1 configuration: Sensor A1 Relay1, Sensor A2 Relay2, Sensor B1 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT010, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-1, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT011, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-1, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT012, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-1, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT013, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-1, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = D, RELAY1 = 4")

# TPG300-2 configuration: Sensor A1 Relay1, Sensor B1 Relay2, Sensor A2 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT016, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-2, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT014, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-2, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT017, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-2, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT015, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-2, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = D, RELAY1 = 4")

# TPG300-3 configuration: Sensor A1 Relay1, Sensor B1 Relay2, Sensor A2 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT020, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-3, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT021, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-3, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT022, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-3, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT023, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-3, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = D, RELAY1 = 4")

# TPG300-4 configuration: Sensor A1 Relay1, Sensor B1 Relay2, Sensor A2 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT024, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-4, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT025, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-4, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT026, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-4, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatH-Vac:PT027, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-4, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = D, RELAY1 = 4")

# TPG300-5 configuration: Sensor A1 Relay1, Sensor B1 Relay2, Sensor A2 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CM-Vac:PT10, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-5, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CM-Vac:NonA2, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-5, BOARD = PE, GAUGE = None, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CM-Vac:PT20, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-5, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CM-Vac:NonB2, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-5, BOARD = PE, GAUGE = None, RELAY1_SOURCE = D, RELAY1 = 4")

# TPG300-7 configuration: Sensor A1 Relay1, Sensor B1 Relay2, Sensor A2 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT040, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-7, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT041, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-7, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT042, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-7, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT043, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-7, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = D, RELAY1 = 4")

# TPG300-8 configuration: Sensor A1 Relay1, Sensor B1 Relay2, Sensor A2 relay3, Sensor B2 Relay4

iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT044, CHANNEL = A1, SOURCE = A,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = IKR50, RELAY1_SOURCE = A, RELAY1 = 1")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT047, CHANNEL = A2, SOURCE = B,  CONTROLLERNAME = TPG300-8, BOARD = PE, GAUGE = TPR18, RELAY1_SOURCE = C, RELAY1 = 3")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT046, CHANNEL = B1, SOURCE = C,  CONTROLLERNAME = TPG300-8, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = B, RELAY1 = 2")
iocshLoad(${tpg300_DIR}/_vac_gauge_tpg300_vgc_1_relay_freia.iocsh, "DEVICENAME = CstatV-Vac:PT045, CHANNEL = B2, SOURCE = D,  CONTROLLERNAME = TPG300-8, BOARD = PI, GAUGE = TPR18, RELAY1_SOURCE = D, RELAY1 = 4")

