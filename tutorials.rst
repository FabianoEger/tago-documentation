
.. _ref_tutorial_intro:

#########
Tutorials
#########


*******
Arduino
*******

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

Log in your account, click on Devices (side bar), then click on 'Add Device' blue button.
The Arduino board will be the device to be added, we will give it the name 'dev01'. Therefore, enter with the name 'dev01' and click on 'Save'.

For each device, you have to define a :ref:`bucket <ref_concepts_bucket>` to store its data. You can let Tago to create a new bucket with the same name as the device.

All devices should use a valid :ref:`token <ref_concepts_token>` when accessing Tago. This token is automatically generated when a device is created.
Go to the 'General information' session of the device, click on 'QR Code' or 'Tokens' and copy the token to be added in the Arduino code later.

.. raw:: html

	<video style="max-width: 100%;" src="_static/getstarted/add_device.mp4" autobuffer controls></video><br><br>


Building the Dashboard
**********************

Let's build a simple :ref:`dashboard <ref_dashboard_dashboard>` to visualize the data sent by your Arduino. Click '+ New Dashboard' on the left side bar, type the name of your dashboard, and click on 'Create'.
Let's add one widget to show the variable *temperature*. Click on 'Add Widget' blue bottom and pick the widget *Dial*.

Start the configuration of this widget by adding the variable to be displayed.
Type the variable name that will be sent by the device as 'temperature', click on 'add' below the name. Select your bucket [dev01], your device [dev01], and click 'OK'.
Then, click 'Create', and your widget will be ready!

.. raw:: html

	<video style="max-width: 100%;" src="_static/tutorials/add_var_dash.mp4" autobuffer controls></video><br><br>

Great! As soon as your device start to send data, the values will be showed on this dial.

Sending e-mail
**************

Now, let's add an :ref:`action <ref_actions_define_actions>` to send an e-mail notification when the sensor overheat.
First, create an action for the device:


.. image:: _static/tutorials/create_actions.png
	:width: 80%
	:align: center

.. image:: _static/tutorials/action_name.png
	:width: 50%
	:align: center

Configure the action to send the e-mail, enter with the destination e-mail address in the 'To' field, and the Subject. Tago can include dynamic variables in the body of the message! For example, using $VALUE$ in the message, we can send the last temperature value with the text.
An e-mail body written as: ``Hi, the temperature is $VALUE$``, could in fact send an e-mail like: ``Hi, the temperature is 26.5``

.. image:: _static/tutorials/action_defined.png
	:width: 70%
	:align: center

To make sure that you will receive only one notification each time the temperature passes the threshold, we will define values to **Set** and **Reset** the trigger. It will create a hysteresis function to prevent the system from sending e-mails continuously.
Basically, we just need to configure Set Trigger and Reset Trigger as showed below.
You can change the threshold values later, by now, let's send an e-mail when the temperature goes over 50C and reset the trigger when it goes back to less than 30C.


.. image:: _static/tutorials/trigger_set.png
	:width: 70%
	:align: center

Sending data from Arduino
*************************

Your setup is ready at Tago! Now, you just need to code your Arduino to send the data to Tago.

When communicating with devices, Tago uses the JSON format. For example, to send the temperature @ 26.5C, the device just need to POST the data like:

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
	    console.log(we are reviewing our library for Arduino!  As soon as we finalize the tests we will show it here!)
	  }

Running the application
***********************

Open your dashboard, and run the code in your Arduino board. Note the widget display the value in realtime.
Try to heat the sensor to reach the 50C. You should then receive an e-mail from Tago. Cool down the sensor below 30C, and try again!
If you have any issue or question about this application, access our `Forum <https://community.tago.io/>`_ .


Conclusion
**********

That was a very simple example that showed how easy and quick is to set the ecosystem around Tago and your device.
To extract more from Tago, check out this :ref:`tutorial <ref_tutorials_advanced_arduino>` . Here you will be able to
send and receive data from Tago, run scripts in the Analysis and combine data.


.. _ref_tutorials_advanced_arduino:

******************
Arduino - Advanced
******************

** COMING SOON **


*****************
Beagle Bone Black
*****************

.. image:: _static/tutorials/BBB.jpg
	:width: 70%
	:align: center

This simple tutorial using the **Beagle Bone Black - BBB** board will show you some principles to integrate your solution with Tago. More than just connect the BBB to the cloud, you will learn how to easily reuse this code into your own application later.

In this example, let's send the status of a digital input from a BBB board. We will visualize its status in the dashboard. By using the Actions capability, we will configure the system to send out an e-mail whenever the switch changes to the *closed* state.

Diagram
*******

The circuit is pretty simple as we are using only one digital input connected to a normally open switch (connector P8, pin 19). A 2.2k Ohm resistor keeps the signal in state low (0) when the switch is closed.

.. image:: _static/tutorials/bbboard_switch.png
	:width: 50%
	:align: center

Adding the Device
*****************

Log in your account, click on Devices (side bar), then click on 'Add Device' blue button.
The BBB board will be the device to be added, we will give it the name 'dev01'. Therefore, enter with the name 'dev01' and click on 'Save'.

For each device, you have to define a :ref:`bucket <ref_concepts_bucket>` to store its data. You can let Tago to create a new bucket with the same name as the device.

All devices should use a valid :ref:`token <ref_concepts_token>` when accessing Tago. This token is automatically generated when a device is created.
Go to the 'General information' session of the device, click on 'QR Code' or 'Tokens' and copy the token to be added into the BBB code later.

.. raw:: html

	<video style="max-width: 100%;" src="_static/getstarted/add_device.mp4" autobuffer controls></video><br><br>


Building the Dashboard
**********************

Let's build a simple :ref:`dashboard <ref_dashboard_dashboard>` to visualize the data sent by your BBB. Click '+ New Dashboard' on the left side bar, type the name of your dashboard, and click on 'Create'.
Let's add one widget to show the variable *switch* status (open/closed). Click on 'Add Widget' blue bottom and pick the widget *Display*.

Start the configuration of this widget by adding the variable to be displayed.
Type the variable name that will be sent by the device as 'switch', click on 'add' below the name. Select your bucket [dev01], your device [dev01], and click 'OK'. As there is no data yet, it will display *N/A*.
Then, click 'Create', and your widget will be ready!

.. raw:: html

	<video style="max-width: 100%;" src="_static/tutorials/dash_bbb.mp4" autobuffer controls></video><br><br>

Your dashboard will look like this one:

.. image:: _static/tutorials/dash_bbb1.png
	:width: 50%
	:align: center

Great! As soon as your device starts to send data, the values will be showed on this display.

Sending e-mail
**************

Now, let's add an :ref:`action <ref_actions_define_actions>` to send an e-mail notification when the switch state changes to closed.
First, add an action to be executed:


.. image:: _static/tutorials/create_actions.png
	:width: 80%
	:align: center

.. image:: _static/tutorials/action_name.png
	:width: 50%
	:align: center

Configure the action to *send e-mail*, enter with the destination e-mail address and the subject. You can enter with a message that will say something like: ``Hi, the switch on your BBB is closed!``.

.. image:: _static/tutorials/bbb_email_config.png
	:width: 70%
	:align: center

To make sure that you will receive only one notification each time the switch changes status, we will define values to **Set** and **Reset** the trigger. It will create a hysteresis function to prevent the system from sending e-mails continuously.
Basically, we just need to configure Set Trigger and Reset Trigger as showed below.
Let's **Set trigger** to send an e-mail when the sensor is *closed* and **Reset trigger** when it goes back to *open*. So, if another data with *closed* status is sent before it goes back to *open*, it will not send the e-mail.


.. image:: _static/tutorials/trigger_bbb.png
	:width: 70%
	:align: center

Your setup at Tago is ready! Now, you just need to code your BBB to send the data.

Sending data from BBB
*********************

When communicating with the devices, Tago uses the `JSON <http://json-schema.org/example1.html>`_  format. For example, to send the information that the switch is closed, the device just needs to make a POST in HTTP using the data like:

	.. code-block:: json

		{
		    "variable": "switch",
		    "value": "closed"
		}

Yep! That is all!  You can add a lot of more information with the variable, like its location, time, and unit. Several fields can be added when more features of our :ref:`API's <ref_api_api>`.

Python Code
===========

The code developed for this example was done in `Python <https://www.python.org/>`_. But, you can also code in other languages, such as C, C# or Node.js. Using Debian distribution installed in the BBB, and Python 2.7.9, we wrote and tested the code below. You should have no problem with a different linux distributions or Python versions.

In case you need some background about how to instal and run Python on a BBB, visit these sites from `beaglebone.org <http://beagleboard.org/getting-started>`_ and `adafruit <https://learn.adafruit.com/setting-up-io-python-library-on-beaglebone-black>`_ .

Before running the code, you will need to install Tago library for Python. In your BBB, type the follow command:

``$ sudo pip install -U tago``

Then, create a file .py with the code below. Make sure you replace the token with that one created for your device.

.. code-block:: python

 from tago import Tago
 import Adafruit_BBIO.GPIO as GPIO

 PIN = "P8_19"
 GPIO.setup(PIN, GPIO.IN)
 LOW = 0
 HIGH = 1
 Level = GPIO.input(PIN) and HIGH or LOW

 MY_DEVICE_TOKEN = '### INSERT YOUR TOKEN HERE ###'
 my_device = Tago(MY_DEVICE_TOKEN).device

 send_close = {
    'variable' : 'switch',
    'value'    : 'closed'
 }

 send_open = {
    'variable' : 'switch',
    'value'    : 'open'
 }

 def send_data(data_to_insert):
    response = my_device.insert(data_to_insert)
    print data_to_insert
    print response

 while True:
    if Level == LOW:
        if GPIO.input(PIN):
            send_data(send_close)
            Level = HIGH
    elif GPIO.input(PIN) == LOW:
        send_data(send_open)
        Level = LOW

As we know that you will want to apply this in your own application later, here goes some tips for your code:

 | 1. import the Tago lib for Python. Also, we have libs for several languages to simplify your code, check out ours :ref:`SDKs <ref_sdk_sdk>`
 		``from tago import Tago``
 | 2. replace MY_DEVICE_TOKEN with the token created for your device
		``MY_DEVICE_TOKEN = ###  INSER THE TOKEN FOR YOUR DEVICE HERE ###``
 | 3. prepare a JSON with the data to be sent

	.. code-block:: python

		data_to_insert = {
		 	'variable' : 'switch',
		 	'value'    : 'closed'
 		}

 | 4. send your data to Tago
 	``result = my_device.insert(data_to_insert)``
 | 5. read the API response to treat any error and check the success of the request.


Running the application
***********************

Look at your dashboard at Tago, and run the code in your BBB. Note the widget will display the value of the variable in realtime.
Wait few seconds for the Python to start the program and press the button on the switch. You should then receive an e-mail from Tago. Release the button, and you will see the status on the display. Press again, and receive another e-mail ;-)
If you have any issue or question about this application, access our `Forum <https://community.tago.io/>`_ .

Right, we know... you can do much more with the BBB and Tago! But at least, we hope you got the idea about how to set the ecosystem around Tago and your device.
Take a look at the :ref:`concepts <ref_concepts>` , our :ref:`API's <ref_api_api>` and :ref:`SDK's <ref_sdk_sdk>` to bring the full potential of Tago to your system!

.. raw:: html

	<video style="max-width: 100%;" src="_static/tutorials/bbb_switch_demo1.mp4" autobuffer controls></video><br><br>


************
Raspberry Pi
************

	.. image:: _static/tutorials/raspberry_pi.png
		:width: 60%
		:align: center

This setup will show you how to remotely control a digital load of a Raspberry PI using Tago. For this example, will be using a LED to simulate our digital load.

Diagram
*******

Connect the LED through a 330Ω resistor to the Raspberry PI GPIO pin (connect to the pin number 18), the figure bellow shows how the connection is made.

.. image:: _static/tutorials/raspberry_diagram.png
		:width: 50%
		:align: center

Adding the Device
*****************

Log in your account, click on Devices (side bar), then click on ‘Add Device’ blue button. The Raspeberry PI board will be the device to be added, we will give it the name ‘dev01’. Therefore, enter with the name ‘dev01’ and click on ‘Save’.
For each device, you have to define a bucket to store its data. You can let Tago to create a new bucket with the same name as the device.
All devices should use a valid token when accessing Tago. This token is automatically generated when a device is created. Go to the ‘General information’ session of the device, click on ‘QR Code’ or ‘Tokens’ and copy the token to be added into the Raspberry PI code later.

.. raw:: html

		<video style="max-width: 100%;" src="_static/getstarted/add_device.mp4" autobuffer controls></video><br><br>


Building the Dashboard
**********************

Let’s build a simple dashboard with only one widget that will control the digital load.
Click ‘+ New Dashboard’ on the left side bar, type the name of your dashboard, and click on ‘Create’.
To add one widget, click on ‘Add Widget’ blue button, and select the type: **Input**. Then click on **Control*, and 'Create' to get your widget.

Start the configuration of this widget by adding the title to be displayed.
Type a variable name that will be sent to the device as *control_signal*, click on ‘add’ below the name.
Select your bucket [dev01], your device [dev01], select switch (true/false) and enter with a label to be showed closed to the switch (i.e LED).
Then, click ‘Create’, and your widget is ready!


.. raw:: html

	<video style="max-width: 100%;" src="_static/tutorials/build_dash_rpi.mp4" autobuffer controls></video><br><br>

Your dashboard will look like this one:

.. image:: _static/tutorials/input_control.png
		:width: 40%
		:align: center

Great! As soon as your device starts to send data, the values will be showed on this display.

Creating Action
***************

Now let’s create an action to send data to our device every time we change the status of our switch.
First, add an action to be executed:


	.. image:: _static/tutorials/rpi_add_action.png
		:width: 80%
		:align: center

	.. image:: _static/tutorials/rpi_action_name.png
		:width: 40%
		:align: center

In the field ‘Action to be taken’ select ‘Send data to device’, add a name to the action:

	.. image:: _static/tutorials/rpi_select_sendtodevice.png
		:width: 70%
		:align: center


Now, let's set the trigger condition. Under 'Set trigger', enter with the variable that we created before (control_signal), and Set Trigger condition to 'Any' - it means that any time a value for that variable arrives from the switch on the dash, it will send it to the Raspberry Pi board.
As the system has no data for this variable yet, you will need to add it. Type the name, and click on 'Click here to add this variable' just below the name.

.. image:: _static/tutorials/add_new_var1.png
		:width: 70%
		:align: center

Then, select the bucket [dev01] and the device [dev01] for the variable.

.. image:: _static/tutorials/add_new_var2.png
				:width: 70%
				:align: center

We will not define a condition for 'Reset Trigger'. You need to change the status of 'Define Reset Trigger condition?' to NO. Just save it now, and your action should look like this:

.. image:: _static/tutorials/rpi_final_action.png
		:width: 70%
		:align: center

Your setup at Tago is ready! Now, you just need to code your Raspberry Pi to receive the data from Tago.

Sending data from the Raspberry
*******************************

The code developed for this example was done in Python . But, you can also code in other languages, such as C, C# or Node.js. Using Raspbian distribution installed in the Raspberry PI, and Python 2.7, we wrote and tested the code below. You should have no problem with a different linux distribution or Python versions.

Before running the code, you will need to install Tago library for Python. In your terminal type the follow command:
``$ sudo pip install –U tago``

If you don’t have pip installed, just install it by typing the following command in your terminal:
``$ sudo apt-get install python-pip``

Python Code
===========

Create a file .py with the code below. Make sure you replace the token with that one created for your device.
When you use Tago's lib, as you are doing now, you don't need to go in details of the HTTP command. In this example, you are using the socket.io capability that pushes notifications to the Raspberry Pi device! With this capability you don't need add a code to continuously request data from Tago (polling), instead the Raspberry Pi will be simply in the listening mode. That is a very fast and clean way of control devices remotely.

.. code-block:: python

  import RPi.GPIO as GPIO
  from tago import Tago
  PIN_NUMBER = 18
  MY_DEVICE_TOKEN = '### INSERT YOUR TOKEN HERE ###'
  my_device = Tago(MY_DEVICE_TOKEN).device
  GPIO.setmode(GPIO.BOARD)
  GPIO.setup(PIN_NUMBER,GPIO.OUT,initial=0)

  def func_callback_data(data):
        Logic_Port = data['value']
        GPIO.output(PIN_NUMBER,Logic_Port)
        print(data['value'])

  my_device.listening(func_callback_data)


As we know that you will want to apply this in your own application later, here goes some tips for your code:

	 | 1. import the Tago lib for Python. ``from tago import Tago``
	 | 2. replace MY_DEVICE_TOKEN with the token created for your device
			``MY_DEVICE_TOKEN = ###  INSER THE TOKEN FOR YOUR DEVICE HERE ###``
	 | 3. Use the ‘listening’ method to run the callback function generated by action
	 | 4. If you have more than one action set, you may want to check which was the variable that arrived in the board before doing anything with it (filter)

Again, we have libs for several languages to simplify your code, check out ours :ref:`SDKs <ref_sdk_sdk>` and try other methods, like to send data from your board to Tago.

Running the application
***********************

Look at your dashboard at Tago, and run the code in your Raspberry PI. Go to your dashboard and turn your button ‘on’ the LED will turn on, now you can turn on and off a digital load across the planet using the power of Tago. If you have any issue or question about this application, access our Forum .
You can also try the modify the tutorial done for the BeagleBlackBone board to your Raspberry, by just by changing the GPIO library and the methods.
Right, we know... you can do much more with the Raspberry and Tago! But at least, we hope you got the idea about how to set the ecosystem around Tago and your device.
Take a look at the :ref:`concepts <ref_concepts>` , our :ref:`API's <ref_api_api>` and :ref:`SDK's  <ref_sdk_sdk>` to bring the full potential of Tago to your system!
