Getting Started
***************
Welcome! Here is how to get started with Tago.io

Step 1. Create a device
-----------------------
In order to allow the connection with Tago.io, you need to create a device that will be linked to your external source of data.
In this example, let's send a room temperature data from an external device.

mostra como criar um device....

You have the option to select where you want the data to be stored, we call this a data bucket. By default, the bucket takes the same name as the same as the bucket.

mostra como criar o bucket automaticamente.

For security, a token should be 

First Steps
===========

Hi, to introduce you the Tago features, let’s start with a hands on example. In this example, let’s create a full ecosystem that communicates with an emergency power generator localized in Chicago, Il.

The following real-time information will be obtained:

* Fuel level
* Oil pressure
* Battery level
* Running hours
* Location

Also, we will setup actions that will be triggered when some variables reach a defined value. In this case, Tago will send an SMS to the operating manager when the Fuel level is lower than 10%.

Let's do this!

Creating Bucket
---------------

Bucket is your storage tool; all data received from your devices or subscriptions are stored here. You may create as many buckets as you wish. Let’s create one for the Power generator device.

First, access the Tago Admin and click on **Data** on the sidebar. Then, click on **Add new bucket** blue button.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_bucket_1.png" alt="" width="800" height="600">

Now, enter with the bucket name and description. You can edit the fields later if needed.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_bucket_2.png" alt="" width="800" height="600">

Great! You created your bucket! It should be something like this:

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_bucket_3.png" alt="" width="800" height="600">

Creating Device
---------------

Device is your I/O; you need to create a device in order to establish communication with your source of data. Let’s create one device!

First, in the Tago Admin, click on Devices on the side bar. Then, click on Add new device blue button.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_1.png" alt="" width="800" height="600">

Now, enter with the device name and description, and select the bucket. Again, you can edit the field later at any time.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_2.png" alt="" width="800" height="600">

After clicking on Save, you should see something like this:

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_3.png" alt="" width="800" height="600">

Creating Device Token
---------------------

Device Token is the secret key used between Tago and your device. You will use this token to build scripts to send or receive data from Tago. It doesn’t hurt to say that this token should be kept in secret or only be shared with those you trust.

To generate a device token, click on your list of devices.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_token_1.png" alt="" width="800" height="600">

Scroll down and you will see the token section. Click on New blue button.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_token_2.png" alt="" width="800" height="600">

Enter the name for this token, select the permission type and expiration time.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_token_3.png" alt="" width="800" height="600">

Click on Save, and you should see something like this:

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/create_device_token_4.png" alt="" width="800" height="600">

.. raw:: html

	<small>Tip: We have APIs to create devices and anything else that is shown here. You may check the full API documentation if you want to build automated scripts. <br><br></small>

Sending data
------------

Sending data from a device to Tago system is very easy. Tago API is RESTful.

Basically, when you are sending data to Tago, you are writing on its database. So, you only need to POST the data in the route https://api.tago.io/data and use a device token in the header.

All API responses are in JSON format. Also, you can send your data in the JSON format. Some types of data are available.

The variable structure is:

* variable - string - required
* value - string/int/float - required
* unit - string - required
* type - string
* time - string/js_dateformat
* location - string/geojson
* Here is one example:

.. code-block:: json

	{ 'value': 32, 'variable': 'fuel_level', 'unit': '%' }

Now, let’s send this variable using **curl** and **httpie**. We will need the device token created in the earlier step.

curl
^^^^

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/sending_data_1.png" alt="" width="800" height="600">

httpie
^^^^^^

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/sending_data_2.png" alt="" width="800" height="600">

It was very easy, right? We may even have an SDK for your language for simple plug-and-play. Check out our `Github page <https://github.com/tago-io>`_.

This is an example using node.js. You can copy the code from our github page.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/sending_data_3.png" alt="" width="800" height="600">

Just to contiue the tutorial, let's add some data:

``$ http -f POST api.tago.io/data Device-Token:972cdc70-7a66-11e4-95c1-295f66956ea3 variable=fuel_level unit="%" value=32``

``$ http -f POST api.tago.io/data Device-Token:972cdc70-7a66-11e4-95c1-295f66956ea3 variable=oil_pressure unit="psi" value=25``

``$ http -f POST api.tago.io/data Device-Token:972cdc70-7a66-11e4-95c1-295f66956ea3 variable=battery_level unit="%" value=9.2``

``$ http -f POST api.tago.io/data Device-Token:972cdc70-7a66-11e4-95c1-295f66956ea3 variable="location" location="41.878876,-87.635915"``

You can add all data using only one request by sending an array of objects.

Note: All string locations are automatically transformed into geojson. You will see more details in the next step.

Reading Data
------------

Read data from Tago is also very easy. Tago API is RESTful.

For reading data, you need to perform a GET method adding the device token in the header, and use the route **https://api.tago.io/data**.

All responses are in JSON format. As showed below, we have several options to read the data.

Without using params, the default will show the last 15 records.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/reading_data_1.png" alt="" width="800" height="600">

You can use params to change the default. For example, by using qty=2 in the query string, the response will be:

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/reading_data_2.png" alt="" width="800" height="600">

You may want to specify the variables to be returned. If you use variable=fuel_level or variables=['fuel_level', ‘oil_pressure']

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/reading_data_3.png" alt="" width="800" height="600">

Also, you can count on some predefined queries from Tago. There are several query options available, check out our complete API documentation. For this example, let’s use count and last_value.

.. raw:: html

	<img src="https://tago.io/assets/img/screenshot/reading_data_4.png" alt="" width="800" height="600">
	<img src="https://tago.io/assets/img/screenshot/reading_data_5.png" alt="" width="800" height="600">
