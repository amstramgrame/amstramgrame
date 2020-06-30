# Gramophone Autoloader

The ESP32 autoloader app is developed to flash binary files created using the faustservice using the esp32Flash command. It is developed in python and bundled into a single executable using pyinstaller. To use, download the needed executable for your operating system and run. It should not have any dependencies. Gui translations into French are avalible inside of frenchDistRe.

## Known Bugs/TODOs

* UI freezes when app is loading onto the Gramophone. This could be fixed by running the loading in a dedicated thread.
* The app is missing an icon

## Credit

This tool has been implemented by Dirk Roosenburg as part of an internship that he carried out at GRAME-CNCM in January 2020.
