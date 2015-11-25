
.. _ref_tutorial_intro:

#########
Tutorials
#########


******************
Basic with Arduino
******************

.. image:: _static/tutorials/arduinozero_wifi101.png
	:width: 70%
	:align: center

This is a quick example using **Arduino Zero** to send data to Tago.
For the connectivity board, we selected the shield **Atmel WiFi101**.
To learn about the Arduino Zero and how to get started, click `here. <https://www.arduino.cc/en/Guide/ArduinoZero>`_

In this example, let's send the temperature reading from the Arduino to Tago. We will visualize the temperature in the dashboard, and use
the actions capability to send e-mails when the temperature reaches a threshold.


Diagram
*******
.. image:: _static/tutorials/arduino_tmp36.gif
	:width: 70%
	:align: center

Adding the Device
*****************

Log in your account, click on Devices (side bar), then click on 'Add Device'.

On the left side bar, click on **Devices**. Then, click on **Add Device** blue button, enter with the name 'dev01' and click on 'Save'.

For each device, you have to define a :ref:`bucket <ref_concepts_bucket>` to store its data. You can let Tago to create a new bucket with the same name as the device.

All devices should use a valid :ref:`token <ref_concepts_token>` when accessing Tago. This token is automatically generated when a device is created.
Go to the 'General information' session of the device, click on 'QR Code' or 'Tokens' and copy the token to be added in the Arduino code later.

.. raw:: html

	<video style="max-width: 100%;" src="_static/getstarted/add_device.mp4" autobuffer controls></video><br><br>


Building the Dashboard
**********************


Sending e-mail
**************

Now, let's add an :ref:`action <ref_actions_define_actions>` to send an e-mail notification when the device sensor overheat.
First, create an action for the device:


.. image:: _static/tutorials/create_actions.png
	:width: 80%
	:align: center

.. image:: _static/tutorials/action_name.png
	:width: 50%
	:align: center

Then, configure the action to send the e-mail. Tago can include dynamic variables in the body of the message! For example, using $VALUE$ in the message, we can send the last temperature value with the text.
An e-mail body written as: ``Hi, the temperature is $VALUE$``, could in fact send an e-mail like: ``Hi, the temperature is 26.5``

.. image:: _static/tutorials/action_defined.png
	:width: 70%
	:align: center

To make sure that you will receive only one notification each time the temperature passes the threshold, we will define values to **Set** and **Reset** the trigger. It will create a hysteresis function to prevent the system from sending e-mails continuously.
Basically, we just need to configure Set Trigger and Reset Trigger as showed below.
You can change the threshold values later, by now, let's send an e-mail when the temperature goes over 50C and reset the trigger when it goes back to less than 30C.
Enter with your e-mail in the 'To' field.

.. image:: _static/tutorials/trigger_set.png
	:width: 70%
	:align: center

Sending Data
************

Your setup is ready at Tago! Now, you just need to put your device to send data to Tago.

When communicating with devices, Tago uses JSON format. For example, to send the temperature @ 26.5C, the device just need to POST the data like:

.. code-block:: json

	{
	    "variable": "temperature",
	    "value": "26.5",
	    "unit": "C",
	    "time": "2015-11-23 03:43:59"
	}



There is no need to send all the JSON fields. For example, if you don't send the 'time', Tago will automatically stamp the data with the time it arrived at the server (UTC).

Arduino Code
============


	.. code-block:: javascript

	  {
	    console.log(meu teste)
	  }

Running the application
***********************

Open your dashboard, and run the code in your Arduino board. Note the widget display the value in realtime.
Try to heat the sensor to reach the 50C. You should then receive an e-mail from Tago. Cool down the sensor below 30C, and try again!
If you have any issue or question about this application, access our :ref:`forum <ref_forum_forum>`


Conclusion
**********

That was a very simple example that shows how easy and quick is to set the ecosystem around Tago and your device.
To extract more from Tago, check out this :ref:`tutorial <ref_tutorials_advanced_arduino>` . Here you will be able to
send and receive data from Tago, run scripts in the Analysis and combine data.


.. _ref_tutorials_advanced_arduino:

*********************
Advanced with Arduino
*********************

Diagram
*******

** COMING SOON **


*****************
Beagle Bone Black
*****************

Diagram
*******

Adding the Device
*****************

Log in your account, click on Devices (side bar), then click on 'Add Device'.

On the left side bar, click on **Devices**. Then, click on **Add Device** blue button, enter with the name 'dev01' and click on 'Save'.

For each device, you have to define a :ref:`bucket <ref_concepts_bucket>` to store its data. You can let Tago to create a new bucket with the same name as the device.

All devices should use a valid :ref:`token <ref_concepts_token>` when accessing Tago. This token is automatically generated when a device is created.
Go to the 'General information' session of the device, click on 'QR Code' or 'Tokens' and copy the token to be added in the Arduino code later.

.. raw:: html

	<video style="max-width: 100%;" src="_static/getstarted/add_device.mp4" autobuffer controls></video><br><br>
