TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = tpg300-freia
# tpg300-freia.dbd will be created and installed
DBD += tpg300-freia.dbd

# tpg300-freia.dbd will be made up from these files:
tpg300-freia_DBD += base.dbd

# Include dbd files from all support applications:
tpg300-freia_DBD += base.dbd
tpg300-freia_DBD += asyn.dbd
tpg300-freia_DBD += drvAsynIPPort.dbd 
tpg300-freia_DBD += stream.dbd
tpg300-freia_DBD += tpg300.dbd


# Add all the support libraries needed by this IOC
tpg300-freia_LIBS += asyn
tpg300-freia_LIBS += stream
tpg300-freia_LIBS += tpg300

# tpg300-freia_registerRecordDeviceDriver.cpp derives from tpg300-freia.dbd
tpg300-freia_SRCS += tpg300-freia_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
tpg300-freia_SRCS_DEFAULT += tpg300-freiaMain.cpp
tpg300-freia_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#tpg300-freia_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
tpg300-freia_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

