cmake_minimum_required(VERSION 3.20.0)

#set(BOARD nucleo_h755zi_q) # see https://docs.zephyrproject.org/latest/boards/ for more options
# in this case invalid, because we have a dual core mcu and both cores have to be built seperatly with --board nucleo_h755zi_q/stm32h755xx (/m7 or /m4)
#set(SHIELD <your_shield>) # see https://docs.zephyrproject.org/latest/hardware/porting/shields.html#shields for more info
# in this case not needed, because the periferals of the dev board are contained by the nucleo_h755zi_q BOARD value
set(CONF_FILE "prj.conf" "../shared/shared.conf")
list(APPEND DTC_OVERLAY_FILE "app.overlay" "../shared/shared.overlay")
# for more options see https://docs.zephyrproject.org/latest/develop/application/index.html#creating-an-application-by-hand

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(app_m7)

# include directory for both cores (for code used in both cores or for data synconization)
zephyr_include_directories(${CMAKE_CURRENT_LIST_DIR}/../shared/include)
# local include for this core
zephyr_include_directories(${CMAKE_CURRENT_LIST_DIR}/include)

target_sources(app PRIVATE src/main.c)