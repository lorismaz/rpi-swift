import Foundation
import SwiftyGPIO

// get a dictionnary of all the gpio pins
let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi3)

// get the pin that the led is connected to.

guard let ledGpio = gpios[GPIOName.P17] else { fatalError("Could not initialize the gpio")}

// set the pin direction to .OUT and turn it off
ledGpio.direction = .OUT
ledGpio.value = 0

//read user input from keyboard and switch the led on/off
print("Press return to switch the led on/off. To quit type exit")
while let userInput = readLine(strippingNewline: true), userInput != "exit" {
    print("Switching led")
    ledGpio.value = ledGpio.value == 0 ? 1 : 0
}
