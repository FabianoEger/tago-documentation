Getting Started
***************
Here is how to get started with Tago.io

Log in to Tago.io. If you haven't created an account yet, signup for free now.

Step 1. Add a device
-----------------------
You can start by adding a **device** to your account. This will enable a link between your data and the external world. In this example, let's send a variable called *temperature* from your device.

On the left side bar, click on **Devices**. Then, click on **Add Device** blue button, enter with the name 'dev01' and click on 'Save'.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_2.png" alt="" width="800" height="600">
For each device, you have the option to define a **bucket** that will store its data. You can pick a bucket with the same name as the device.

For security, all devices should use a valid token when accessing Tago. One token is automatically generated when a device is created.
Later in this example, you will need this token. Go to the 'General information' session of the device, click on 'QR Code' or 'Tokens' and copy the token code that was created for your device.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_token_2.png" alt="" width="800" height="600">

Step 2. Build a dashboard
--------------------------
You can build great dashboards to visualize data, interact with your devices and share them with others. You can pick the widgets that best fit your needs.

Click on '+ New Dashboard' on the left side bar, type the name of your dash board, and click on 'Create'.

.. image:: _static/getstarted/newdash.png
	:height: 360
	:width: 360


.. image:: _static/getstarted/mydash.png
		:height: 260
		:width: 260
Let's add one widget to show the variable *temperature*. Click on 'Add Widget' blue bottom and pick the widget *Dial*.

To configure this widget, first you need to add a variable to be displayed.
Type the variable name that will be sent by the device as 'temperature', click on 'add' below the name.
Select your bucket [dev01], your device [dev01], click on 'OK'.
Then, click on 'Create', and your widget is ready!

.. image:: _static/getstarted/variable_input.gif
	:height: 300
	:width: 600
		:align: center

Good! As soon as your device start to send data, the values will be showed on this dial.

Step 3. Send/Get data
---------------------
Now you are ready to integrate Tago system with your electronic devices or apps. You can use one of our **SDK's** designed for your platform.
Or we can simulate your device, by exchanging data remotely with your bucket using **curl** (use **wget**  or **Postman** if you are using Windows).
Here, you will need to use that **token** created earlier for your device.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/sending_data_1.png" alt="" width="800" height="600">

Try to send more data by changing the value of the 'temperature' variable. Keep an eye on your dashboard. You should see something like this.

.. image:: _static/getstarted/dial.gif
	:align: center




Explore Tago.io
----------------------------------
This is just the beginning! Check out how powerful the Tago platform is.

It is very easy to get data from your buckets, and share your *dashboards* and *buckets*.

Check out the external sources of data that can be combined with your own data set.

Create powerful realtime analysis using our script capabilities in Java Script. Take actions based on your rules.

Visit our Marketplace! [beta] You will find dashboards ready to use in interesting applications.
