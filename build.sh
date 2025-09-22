# this ensures it is run in a subshell to avoid messing with the current shell config
(
    # this makes sure the script is run in the directory of where its placed
    cd "$(dirname "$0")" || exit 1
    # makes sure zephyr and .venv are active when building
    source "$HOME/zephyrproject/activate_zephyr.sh"

    # build code
    west build ./app_m7 --board nucleo_h755zi_q/stm32h755xx/m7 --build-dir build_m7 --pristine
    west build ./app_m4 --board nucleo_h755zi_q/stm32h755xx/m4 --build-dir build_m4 --pristine
    # board location: /home/tommy/zephyrproject/zephyr/boards/st/nucleo_h755zi_q

    # copy paste output to a nicer folder structure
    cp ./build_m7/zephyr/zephyr.bin ./out/m7/m7.bin
    cp ./build_m7/zephyr/zephyr.elf ./out/m7/m7.elf
    cp ./build_m7/zephyr/zephyr.hex ./out/m7/m7.hex

    cp ./build_m4/zephyr/zephyr.bin ./out/m4/m4.bin
    cp ./build_m4/zephyr/zephyr.elf ./out/m4/m4.elf
    cp ./build_m4/zephyr/zephyr.hex ./out/m4/m4.hex
)

