#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SSD1306_Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SSD1306_Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Main.c I2C.c SSD1306_OLED.c Terminal6.c delay.c Terminal12.c Microchip_logo_img.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Main.o ${OBJECTDIR}/I2C.o ${OBJECTDIR}/SSD1306_OLED.o ${OBJECTDIR}/Terminal6.o ${OBJECTDIR}/delay.o ${OBJECTDIR}/Terminal12.o ${OBJECTDIR}/Microchip_logo_img.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Main.o.d ${OBJECTDIR}/I2C.o.d ${OBJECTDIR}/SSD1306_OLED.o.d ${OBJECTDIR}/Terminal6.o.d ${OBJECTDIR}/delay.o.d ${OBJECTDIR}/Terminal12.o.d ${OBJECTDIR}/Microchip_logo_img.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Main.o ${OBJECTDIR}/I2C.o ${OBJECTDIR}/SSD1306_OLED.o ${OBJECTDIR}/Terminal6.o ${OBJECTDIR}/delay.o ${OBJECTDIR}/Terminal12.o ${OBJECTDIR}/Microchip_logo_img.o

# Source Files
SOURCEFILES=Main.c I2C.c SSD1306_OLED.c Terminal6.c delay.c Terminal12.c Microchip_logo_img.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/SSD1306_Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F45K80
MP_PROCESSOR_OPTION_LD=18f45k80
MP_LINKER_DEBUG_OPTION=  -u_DEBUGSTACK
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Main.o   Main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/I2C.o: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/I2C.o.d 
	@${RM} ${OBJECTDIR}/I2C.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/I2C.o   I2C.c 
	@${DEP_GEN} -d ${OBJECTDIR}/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/SSD1306_OLED.o: SSD1306_OLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SSD1306_OLED.o.d 
	@${RM} ${OBJECTDIR}/SSD1306_OLED.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/SSD1306_OLED.o   SSD1306_OLED.c 
	@${DEP_GEN} -d ${OBJECTDIR}/SSD1306_OLED.o 
	@${FIXDEPS} "${OBJECTDIR}/SSD1306_OLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Terminal6.o: Terminal6.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Terminal6.o.d 
	@${RM} ${OBJECTDIR}/Terminal6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Terminal6.o   Terminal6.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Terminal6.o 
	@${FIXDEPS} "${OBJECTDIR}/Terminal6.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/delay.o: delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay.o.d 
	@${RM} ${OBJECTDIR}/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/delay.o   delay.c 
	@${DEP_GEN} -d ${OBJECTDIR}/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Terminal12.o: Terminal12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Terminal12.o.d 
	@${RM} ${OBJECTDIR}/Terminal12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Terminal12.o   Terminal12.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Terminal12.o 
	@${FIXDEPS} "${OBJECTDIR}/Terminal12.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Microchip_logo_img.o: Microchip_logo_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Microchip_logo_img.o.d 
	@${RM} ${OBJECTDIR}/Microchip_logo_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Microchip_logo_img.o   Microchip_logo_img.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Microchip_logo_img.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip_logo_img.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/Main.o: Main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Main.o   Main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Main.o 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/I2C.o: I2C.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/I2C.o.d 
	@${RM} ${OBJECTDIR}/I2C.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/I2C.o   I2C.c 
	@${DEP_GEN} -d ${OBJECTDIR}/I2C.o 
	@${FIXDEPS} "${OBJECTDIR}/I2C.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/SSD1306_OLED.o: SSD1306_OLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SSD1306_OLED.o.d 
	@${RM} ${OBJECTDIR}/SSD1306_OLED.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/SSD1306_OLED.o   SSD1306_OLED.c 
	@${DEP_GEN} -d ${OBJECTDIR}/SSD1306_OLED.o 
	@${FIXDEPS} "${OBJECTDIR}/SSD1306_OLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Terminal6.o: Terminal6.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Terminal6.o.d 
	@${RM} ${OBJECTDIR}/Terminal6.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Terminal6.o   Terminal6.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Terminal6.o 
	@${FIXDEPS} "${OBJECTDIR}/Terminal6.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/delay.o: delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/delay.o.d 
	@${RM} ${OBJECTDIR}/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/delay.o   delay.c 
	@${DEP_GEN} -d ${OBJECTDIR}/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Terminal12.o: Terminal12.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Terminal12.o.d 
	@${RM} ${OBJECTDIR}/Terminal12.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Terminal12.o   Terminal12.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Terminal12.o 
	@${FIXDEPS} "${OBJECTDIR}/Terminal12.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/Microchip_logo_img.o: Microchip_logo_img.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Microchip_logo_img.o.d 
	@${RM} ${OBJECTDIR}/Microchip_logo_img.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms --extended -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/Microchip_logo_img.o   Microchip_logo_img.c 
	@${DEP_GEN} -d ${OBJECTDIR}/Microchip_logo_img.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip_logo_img.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SSD1306_Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" -u_EXTENDEDMODE -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/SSD1306_Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/SSD1306_Test.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION_LD)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map" -u_EXTENDEDMODE -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/SSD1306_Test.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
