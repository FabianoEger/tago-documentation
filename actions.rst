
.. _ref_actions_actions:

Actions
*******

**Actions** is a very powerful feature that gives you the total control over your devices based on events determined by you.
More than sending e-mail or SMS based on certain conditions, with Actions, it is also possible to send data back to the device, run scripts in the Analysis, and make a HTTP Post end-point.
With these capabilities combined, there a limitless possibilities to create any event condition, not limited to simple an if/else condition.

Create Actions
==============

To create a new Action, just click on the button 'Actions' located at the sidebar, give a name to your new action and click on **Save**.

// DEPOIS MUDAR PARA UM VIDEO COM ACTIONS.

.. raw:: html

	<video style="max-width: 100%;" src="_static/dashboard/dashboard_create.mp4" autobuffer controls></video><br><br>

Define Actions
==============
First thing to do when configuring an Action, is to define which action it will should be taken. Each type of action is described in the sessions below.

Send e-mail
-----------

An e-mail will be sent when the condition :ref:`actions_set_trigger` is met.
To create an action, select the *Action to be taken* as: **Send e-mail**, enter with the e-mail address, and a subject.

The message body can be as simple as a text: 'Hi, your car is over the speed limit'.
Or you can special fields on the message to personalize it with real-time data from your bucket and devices.
You can use most of the JSON field from our API:

1. $VARIABLE$
2. $BUCKET$
3. $VALUE$
4. $UNIT$
5. $TIME$
6. $LOCATION$
7. $DEVICE$

For example, a personalized message like this:  'Hi, your $DEVICE$ reached $VALUE$ $UNIT$ at $LOCATION$', could created an e-mail like: 'Hi, your Passat reached 73 mph at 43.0533,-86.4534'

To avoid sending e-mail continuously when a trigger condition is met, you may have to define a reset trigger condition.
Check :ref:`actions_reset_trigger` to avoid issues with your logic and even your account.

E-mails can be sent directly from scripts in the Analysis. For such action, you can use the service(e-mail)  //ADD LINK HERE.
Check the terms of use, and your plan before using the E-mail service.

Send SMS
--------

An SMS will be sent when the condition :ref:`actions_set_trigger` is met.
To create an action, select the *Action to be taken* as: **Send SMS**, and enter with the phone number, including the country code. If there is no country code, the system will assume the USA code (+1).

The message body can be as simple as a text: 'Hi, your car is over the speed limit'.
Or you can special fields on the message to personalize it with real-time data from your bucket and devices.
You can use most of the JSON field from our API:

1. $VARIABLE$
2. $BUCKET$
3. $VALUE$
4. $UNIT$
5. $TIME$
6. $LOCATION$
7. $DEVICE$

For example, a personalized message like this:  'Hi, your $DEVICE$ reached $VALUE$ $UNIT$ at $LOCATION$',
would text: 'Hi, you Passat reached 73 mph at 43.0533,-86.4534'

To prevent from sending SMS's continuously when a trigger condition is met, you may have to define a reset trigger condition.
Check :ref:`actions_reset_trigger` to avoid issues with your logic and even with your account.

Some costs may occur when using the SMS service, which varies based on the country of operation. Check pricing, terms of use, and your plan before using the SMS service.

Send to Device
--------------

Data can be sent directly to your device by using the Socket.io realtime capability.
Of course, you can program your device to get data from the buckets using the GET method, but it may not know when to try to get data if it doesn't know if the value of the variable change.
This action is similar to a push notification, where the information is sent to a device without the need of a GET command being issued from its side.
Every time the condition defined in the **Trigger Setup** is met, that variable is sent to all the devices connected to the bucket where the variable is stored.
In the example below, the variable 'setpoint' is sent to all devices connected to the bucket Python, every time a new value arrives.

.. image:: _static/actions/send_to_device.png
	:width: 100%

Although the variable can be sent by another device, it is common to send variables that are originated by the scripts that are running in the Analysis or from a Form in the Dashboard.


**Note:** When using socket.io to receive data, the device should be in the *listening* mode. Check our out :ref:`ref_sdk_sdk` to get code example to quickly implement this function in your platform.

Run Analysis Script
-------------------

HTTP Post End-Point
-------------------

.. _actions_set_trigger:

Define condition
================
In order to initiate an action process, certain conditions should be met. Internally, Tago uses a *trigger* as the flag to monitor this process.

Set Trigger
-----------
One condition to start the action is when the selected variable meets the criteria defined in **Set Trigger**.
Enter with the variable to be tested (it is tested every time a new value arrives), the Condition, and the value to be compared against.

.. image:: _static/actions/set_trigger.png
	:width: 100%


The available test conditions are:

1. **Less than**  - condition is true when the value of the variable is less than the value defined
2. **Greater than** - condition is true when the value of the variable is greater than the value defined
3. **Equal to** - condition is true when the value of the variable is equal to the value defined
4. **Different from** - condition is true when the value of the variable is different from the value defined
5. **Any**- condition is true whenever a new value of the variable is sent to the bucket

Another condition depends on the *Define Reset Trigger Condition* switch status. If it is **NO**, the action will be taken solely based on the **Set Trigger** condition explained above.
If it is set to **YES**, the condition above will only be tested if the Trigger is not Locked.  The status of the trigger can be manually changed as showed below, that is under the session 'More'.
A more common option to unlock the trigger is to use the :ref:`actions_reset_trigger` setup.

.. image:: _static/actions/trigger_locked.png
	:width: 100%



**Note:** Combined logic tests can be easily implemented in the :ref:`ref_analysis_analysis`. For example, if you want to take an action to send an SMS
when the (temperature > 95C) AND (time_of_day == night) AND (User_at_home == false), you can simply create an Action to Run a scripts in Analysis every time
the new temperature variable arrives, and just write a simple script to make the logic test. This method is very powerful to test basically any complex combination.


.. _actions_reset_trigger:

Reset Trigger
-------------
Each time a **Set Trigger** condition is met, the trigger is locked if the *Define Reset Trigger Condition* switch is set **YES**.
In this case, the **Set Trigger** condition will only be tested again when the **Reset Trigger** condition is met. This is helpful to create an hysteresis for example.

However, if the *Define Reset Trigger Condition* switch is set **NO**, the trigger will never be locked, and any time that the **Set Trigger** condition is met, it will take the defined action.
Depending on your logic, it may be undesirable.

One example of undesirable situation would be if you would want to receive an SMS when the temperature is above 95 C.
After reaching >95C the system will send a SMS. But, if the device continue sending more values above 95C the system would send another SMS for each value received!
You may want to implement an hysteresis using a **Reset Trigger** condition. If you define the condition to reset when temperature < 90 C for example, it would prevent this issue.
Only one SMS would be sent, and the system would be locked until the temperature goes below 90 C. Which seems much more reasonable in this example.
