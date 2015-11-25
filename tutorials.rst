
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
the actions capability to send e-mails when the temperature reached a threshold.


Diagram
-------
.. image:: _static/tutorials/arduino_tmp36.gif
	:width: 70%
	:align: center

Adding the Device
-----------------

Log in your account, click on Devices (side bar), then click on 'Add Device'.

On the left side bar, click on **Devices**. Then, click on **Add Device** blue button, enter with the name 'dev01' and click on 'Save'.

For each device, you have to define a :ref:`bucket <ref_concepts_bucket>` to store its data. You can let Tago to create a new bucket with the same name as the device.

All devices should use a valid :ref:`token <ref_concepts_token>` when accessing Tago. This token is automatically generated when a device is created.
Go to the 'General information' session of the device, click on 'QR Code' or 'Tokens' and copy the token to be added in the Arduino code later.

.. raw:: html

	<video style="max-width: 100%;" src="_static/getstarted/add_device.mp4" autobuffer controls></video><br><br>

Sending Data
------------
When communicating with devices, Tago uses JSON format. To send the temperature @ 26.5C, the device just need to POST the data like:

.. code-block:: json

  {
    "variable": "temperature",
    "value": "26.5",
    "unit": "C",
    "time": "2015-11-23 03:43:59"
  }



There is no need to send all the JSON fields. If you don't send the 'time', Tago will automatically stamp the server time on it based on UTC.

Arduino Code
^^^^^^^^^^^^


.. code-block:: javascript

  {
    console.log(meu teste)
  }


Building the Dashboard
----------------------


Sending e-mail
--------------

Advanced tutorial
-----------------
That was a very simple example. To extract more from Tago, check out this :ref:`tutorial <ref_tutorials_advanced_arduino>` . Here you will be able to
send and receive data from Tago, run a script in the analysis and combine data.


.. _ref_tutorials_advanced_arduino:

*********************
Advanced with Arduino
*********************

Diagram
-------

** COMING SOON **


*****************
Beagle Bone Black
*****************

Diagram
-------

** COMING SOON **
