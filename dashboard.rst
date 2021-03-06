.. _ref_dashboard_dashboard:

#########
Dashboard
#########

A dashboard is where you place your widgets to visualize and interact with data, all in real-time. All your dashboards are listed on the sidebar of the screen. On the top right you will find the **Dashboard options** menu. From there you will have access to other dashboard functionalities such as **rename**, **share** and **delete**.

.. image:: _static/dashboard/dashboard_list.png

You can organize them in the way that best fit your needs by moving and resizing your widgets.

.. raw:: html

	 <video style="max-width: 100%;" preload="none" src="_static/dashboard/dashboard_1.mp4"   controls></video><br><br>

*******************
Building dashboards
*******************

To create a new dashboard, just click on the button **+ New Dashboard**, give a name to your new dashboard and click on **Create**.

.. raw:: html

	 <video style="max-width: 100%;" preload="none" src="_static/dashboard/dashboard_create.mp4"   controls></video><br><br>

Widgets
*******

Dashboards are composed by widgets. Tago provides a variety of widgets to handle your data in real time. The available options  cover from simple **dials** to **tables**, **maps** and even **forms** that you can use to allow the user to input data.

.. image:: _static/dashboard/widget_types.png

.. _widget-data:

Variables
*********

As most widgets handle sometime of data, they need a data source. The data source of your widgets are the variables created when you send data from your device or the analysis to Tago. Therefore you will need to select which variable, and from which device and bucket, you want to add in each widget.

.. image:: _static/dashboard/widget_vars.png
	:width: 50%
	:align: center

You'll notice that many widgets use your variable's name in order to identify, for example, a line of a chart or a device in a map. And we know that sometimes the original name of the variable is not the most appropriate name for the end user to see. Because of that, every variable selected may have a **label**. A label is simply an alias that will be used by the widget whenever it needs to display your variable name. To add an alias to a variable, just click on top of it, and you'll see a little balloon with the alias field. The label will be used only for visualization in that specific widget, it will not be recorded in the database, neither associate with that variable for future use.

Along with the alias field, you'll see that you can change the bucket and the device of this variable. We understand that sometimes the user needs change or that a new device would be responsible for sending an specific data. Whatever the reason, you're covered. You can change your variable settings if you need.

.. image:: _static/dashboard/widget_var_edit.png
	:width: 30%
	:align: center

.. _widget-config:

Configuration
*************

Besides the data sources, every kind of widget has its own particular configurations in regards to how to display the data. So when creating a widget, you're going to find **basic** options - generally these are critical to the algorithm that builds your widget - and **advanced** options, which allows you to give a personal touch to each widget and also provides advanced features you might need. Two advanced features included in every widget are:

* Help text
* Hide variables name

The **help text** allows you to add a short help text that will be placed on the top-right corner of your widget, under a question mark icon.

.. image:: _static/dashboard/widget_help.png
	:width: 50%
	:align: center

The second one gives you the ability to hide the variables name in the widget. It can be useful if you don't want to show the widget names in some of your widgets. We recommend you to add a descriptive title in such cases though.

You will notice that some widgets are more powerful and complex than others. While a dial only needs the mininum and maximum values, a **multiple axis chart** needs more configuration fields that are related to each variable, in this particular case you'll have to define the type (bar, line, etc) of each data source as well. This kind of customization, while takes a little more time to get done, offers you a lot of flexibility.

.. image:: _static/dashboard/widget_var_configuration.png
	:width: 50%
	:align: center

.. _widget-time:

Time
****

When creating your widgets, you are going to see that some of them present only the latest value added by your variable and keep it updated through the real time updates. Others can exhibit data in a range of time while keeping it updated through real time updates, and some widgets just show the data in a fixed period of time. When more than one of the previous options are available in a widget, its up to you to choose the best one that fits your needs. These options may be like the following:

* Only the last value
* Realtime
* Fixed time

And don't worry by time zone differences, because you'll find an option under **Advanced Options** to choose the time zone that the devices are related to.

.. image:: _static/dashboard/widget_time.png
	:width: 100%
	:align: center

Dial
****

Dials are one of the simplest and more useful widgets. They make it easy to visualize the values relatevily to a defined range (maximum and minimum limits).

The configuration of a dial is very simple. You can pick as many :ref:`variables <widget-data>` as you need, each one of them will have its own dial chart inside a single widget. The minimum and maximum limits of each dial is automatically set to the range of 0 and 100 for your convenience, but you can easily change it.

Advanced Options
================

In the advanced options you will see an option to change de format of the number to be show in regard to the number of decimal places.

You will also see an option to set the unit of your value. You must be aware that even if your data contains a ``unit`` property, it will be overridden by this setting.

Display
*******

Display is a widget that displays the last value of its :ref:`variables <widget-data>`, regardless of the format of the value (string or number). You can pick as many :ref:`variables <widget-data>` as you want, each one of them will have its own box and the values will be shown simultaneously.

Advanced Options
================

This widget only have the generic advanced options as mentioned earlier in the :ref:`configuration section<widget-config>`.

Line / Area / Bar charts
************************

Charts are a very powerful way to visualize your data and look for insights. At Tago you'll find a variety of charts to use.

Charts are very easy to be configured, you just neet to select the :ref:`variables <widget-data>` and to define the :ref:`time <widget-time>` settings to exhibit the data.

Advanced Options
================

Under the **advanced options**, you'll find the :ref:`timezone <widget-time>` selector and a few additional options:

**Maximum number of points to be displayed**: this option will help you to filter exactly the amount of data you need, while it still keeps showing the most recent ones.

**Stack graphics**: this option determines whether to stack the values of each series on top of each other.

**Show device name associated with each variable**: this option tells the chart to show the device name near the variable name. It's useful when you have variables with the same name in the chart.

Multiple Axis charts
********************

This kind of chart allows you to plot your data using bars, lines, columns and areas in the same chart. Therefore, you will have to set the type of your chart for each variable you add on it. Besides that, you will also have to choose which :ref:`time <widget-time>` settings to use.

.. image:: _static/dashboard/widget_multiple_axis.png

Advanced Options
================

Under the **advanced options**, you'll find the :ref:`timezone <widget-time>` selector and a few specific options:

**Maximum number of points to be displayed**: this option will help you to filter exactly the amount of data you need, while it still keeps showing the most recent ones.

**Group the samples by**: by default, the X axis of the chart will be the time of the values. But, sometimes you need to group your data through the X axis even if they don't have the exactly same time, in that cases you must make use of a :ref:`serie <concepts-serie>`.

**Stack graphics**: this option determines whether to stack the values of each series on top of each other.

**Show device name associated with each variable**: this option tells the chart to show the device name near the variable name. It's useful when you have variables with the same name in the chart.

Map
***

If your selected variable has a location information [#f1]_ about the device of origin attached, you can visualize it in a map. This is easy as choosing one or more :ref:`variables <widget-data>` and selecting which :ref:`time filters<widget-time>` to use.

As you pick variables for your map, you'll have two more options to fill about its device of origin:

**Icon**: choose an icon and color to represent the device on the map.

**Label**: give that device an alias to be shown inside the information window. This is useful to differentiate devices with the same icon and color on the map.

.. image:: _static/dashboard/widget_map_variables.png

.. rubric:: Notes:

.. [#f1] If you don't know how to send location coordinates within your data, please read our :ref:`API docs<ref_api_api>`

Color Options 
=============
You are able to dinamically define colors for the icons on the map. By default, the color of the icon is defined inside widget configuration screen. However, if you use metadata when sending a variable from your device to Tago, you are able to redefine the icon color of that specific variable.

.. code-block:: javascript

    {
        "variable" : "location",
        "value": "My Address",
		"location": { "lat": 42.2974279, "lng": -85.628292 }
        "metadata": {"color":"green"}
    }

Advanced Options
================

Under the **advanced options**, you'll find the :ref:`timezone <widget-time>` selector and a few specific options:

**Connect markers with lines**: this option makes every point of the same device to be connected through a line, as a route.

**Ignore heading direction from variable**: if checked, the `heading` property of your location data will be ignoring during the build of the map. So, instead of having an arrow pointing exactly to your heading direction in each point of your route, you'll have automatically generated arrows placed all over your route.

**Do not open info windows automatically**: if checked, the window with the data values won't automatically open when the widget is shown or when new points are plotted in real time.

**Show icons for all values**: this option will make the device icon appear for every point of his route in the map.

**Do not display (0, 0) coordinates**: sometimes GPS devices send locations with latitude 0 and longitude 0 when they are not able to obtain a precise location, which can affect the routes on your map. Check this option if you are having this kind of problem.  Have in mind that if you use 'Only Last Location' together with this option, and the GPS sends a location (0,0) no icon will be showed in the map. If you want to continue showing the latest valid location in this case, you will need to create an script to treat that.

**Maximum number of points to be displayed**: this option will help you to filter exactly the amount of data you need, while it still keeps the mostly recent.

**Group the samples by**: sometimes only one of your variables has the location information, but there are other variables related to it that you would like to display together on the map, in this case you must make use of a :ref:`serie <concepts-serie>`. Otherwise it will be grouped using the ``time`` and ``location`` of each data.

Table
*****

Table widgets present your data in a tabular way. It is one of the special kinds of widgets that unlike the others, you won't find the traditional variable selector, initially there's only two fields to fill: the number of **rows** and **columns**. After selecting these two values, you'll have a scheme of how the table is going to look like with all your rows and cells.

To finish, you just need to fill your cells either with text or with the value of a variable. To do that, click on a cell, select the type and fill the value (a text or a variable).

Cells with variables will always display the last value of the variable and it will be updated in real time as soon as a new value arrives.

.. image:: _static/dashboard/widget_table.png

Color Options 
=============
You are able to define colors for the cell where a variable is displayed. By default, the background is transparent (white). If you use metadata when posting a variable, you are able to define the background color of that specific cell. For example, by adding metadata to this POST in JSON below, the cell that shows the variable 'temperature' will change its color to 'green'. 

.. code-block:: javascript

    {
        "variable" : "temperature",
        "value": 71,
        "unit"  :"F",
        "metadata": {"color":"green"}
    }
  
As the color should be associated with the data of a variable, it is not possible to color cells that are selected as type 'Text'  (option available in each cell input used during the configuration).
Use the metadata color options from your Analysis to help your users to detect issues or alerts on a table more easily.
  
.. image:: _static/dashboard/widget_table_color.png
	:width: 50%
	:align: center

Dynamic Table
*************

Dynamic tables are tables that are populated dynamically as your data arrive while keeping the history of the previous data in each row. Its configuration is easy, just pick your :ref:`variables<widget-data>`, choose a time span and you are ready to go. Make sure that the data you want to display in the table is grouped using a :ref:`serie number<concepts-serie>`, otherwise the values will appear each one in its own rows, with all the other cells left in blank.

Each one of the variables you selected will become a column and the rows will contain the values, from the most recent to the oldest data. As soon as new values of the selected variables arrives, they are added to the table.

By default the column title will be the variable name, but you can change it by adding a label to your variables.

Advanced options
================

Under **advanced options** you will find some specific options:

**Maximum number of rows**: if the time span isn't enough, you can also filter the exact amount of data that will appear in your table using this option. We suggest to keep the number of rows as low as possible, as numbers above 20 can start to get the visualization of the browser very slow (caused by a combination of the browser technology, internet speed, and computer available memory).

**Only display rows with all values**: this option guarantees that only rows with values in all of its cells will be displayed.

**Display date and time**: if you check this options, a column named "Time" will be added to the table and will show the ``time`` of one of the values of that row. This "Time" comes from the original json field data (time stamp from the device).

.. _widget-form:

Form input
***********

The form input is a powerful widget among the others that Tago offers. It allows you to build powerful forms to collect inputs from users that are interacting with their application on the dashboard.

For this widget, select the :ref:`variables<widget-data>` that will hold the values sent through the form, each one of them will have its own field in the form so you can set a value. Every time you submit the form widget, the values set in each field will be created in the API using the variables of each field. They will also be grouped together through a :ref:`serie number<concepts-serie>`, so you can use them grouped in maps, dynamic tables, charts, etc.

There are a variety of field types that you can use:

Checkbox
	A traditional checkbox will appear and the value will be set as true (checked) or false (not checked).

Radio
	A traditional radio input will appear. Once selected you will be able to define its options with their labels and values. The value of the field will be the one of the selected option.

Text
	A typical text input will appear and the value will be anything that was typed into it.

Dropdown
	It displays a dropdown menu with options that you define. The value of the field will be the one of the selected option.

Hidden
	Unlike the others, this field type doesn't display anything on the form. It will be there as an invisible field and you won't be able to change its value unless you edit this widget.

Address
	It will display a text field integrated with Google Maps to look for an address. The value for this field will be the complete address selected and it will also have the location coordinates within it.

Device
	It will display a dropdown menu in which options will be your devices. The value of the field will be the id of the selected device.

Validation
	This field is the only one that doesn't represent a value to be sent with the form. The variable set to this field type expect to receive data (text) to show as a message above the form. Besides the text, you can also define the type of message that will appear. There are four types: *warning*, *info*, *danger* and *success*. You do this by sending a property ``type`` in the metadata [#metadata]_ object of your data.

.. rubric:: Notes

.. [#metadata] If you don't know about the metadata object, read our :ref:`API docs<ref_api_api>`

Advanced options
================

Under **advanced options** you will find some specific options:

**Display a "Clear" button to reset fields**: this option makes a "Reset" button in the end of the form. When clicked, all fields will return to its **default values**.

**Confirm before submit**: this option will make a confirmation window appear everytime you try to submit the form.

**Display a map to visualize address**: this option will add a map at the end of the form, and this map will display the last address submitted from the address field.

Control input
**************

Control input allows you to create a single widget to input multiple variables, and change only one individually. It has less options than Form Input, but is more easy to set.

You just select the variables you want to change, and after that, you select their Type and and Label. It's possible to select between two types:

.. image:: _static/dashboard/widget_controlinput.png
	:width: 50%
	:align: center

**Switch (true/false)**
The input will be a switch type. A simple button that changes the value of the variable to true or to false.

**Input (value)**
The input value allows you to entry with a value for the variable.

.. image:: _static/dashboard/widget_controlinput_example.png
	:width: 50%
	:align: center

Pie
***

Enter multiple variables and let the Pie widget automatically to create a pie and slice widgets for you. You can choose between a circle or a semi-circle, each one will present the data slightly different for you. See the examples below.

You need to be sure that all your variables contains values that are Number type. A text (string) value is not a valid input for the widget and will cause a empty output.

.. image:: _static/dashboard/widget_pie.png
	:width: 50%
	:align: center

Gauge
*****

Gauge contains a collection of metric widgets. You can choose among five types of Gauges that will present the last value of a variable in different formats. 

Angular
=======
Enter a variable to show it in a angular gauge meter.

Options
	**Minimum (main axis)**: Is the minimum value for the scale (limit inferior). 
	**Maximum (main axis)**: Is the maximum value for the scale (limit superior).


Advanced Options
	**Number Format (main axis):** Define how many decimal digits of precision will be display.
	**Unit (main axis):** Unit to be showed in the widget, like "F" for fahrenheit. If left empty, the original data from the json field defined for 'unit' will be showed here.

.. image:: _static/dashboard/widget_gauge_angular.png
	:width: 50%
	:align: center

Solid
=======
Enter a variable to show it in a solid gauge meter.

Options
	**Minimum (main axis)**: Is the minimum value for the scale (limit inferior). 
	**Maximum (main axis)**: Is the maximum value for the scale (limit superior).

Advanced Options
	**Number Format (main axis):** Define how many decimal digits of precision will be display.
	**Unit (main axis):** Unit to be showed in the widget, like "F" for fahrenheit. If left empty, the original data from the json field defined for 'unit' will be showed here.

.. image:: _static/dashboard/widget_gauge_solid.png
	:width: 50%
	:align: center

Clock
=====
Select a timezone to show an analogic clock. You can pass the mouse above the widget to see a popup of the time in a digital format.

.. image:: _static/dashboard/widget_gauge_clock.png
	:width: 50%
	:align: center

Dual Axes
=========

Not available yet.

VU Meter
========

Not available yet.

Image
*****

Image widget will give the capability for you to present customized images in your dashboard. You can use it to present the logo of your company or customer, or anything else that helps the user to better visualize your application. Image widget has two basic options: you can create a static image, or a dynamic image wich is based on the value of a variable. You can select between these two options when building your dashboard.

Static Image
============
You can enter an URL to show a specific image in your dashboard.

.. image:: _static/dashboard/widget_image.png
	:width: 50%
	:align: center

Dynamic Image
=============
You can select multiple conditions to show different images based on the value of the selected variable. Just input the conditions and the images to be showed in each case.

| It's possible to enter with only one variable for the conditions.
| Click on **'+'** to create a new condition for this variable.
| Select the condition and put a image on the URL box.

.. image:: _static/dashboard/widget_image_byvariable.png
	:width: 50%
	:align: center

Note
****

Note allows you to create a text to be viewed in your dashboard. It accepts a `markdown <http://simplemde.com/markdown-guide>`_ formated text, allowing you to use bold, italic and list tools. Although you could use the Note Widget to add images on your dashboard, we highly recommend that you use the Image Widget instead as it contains an auto resize image feature.

.. image:: _static/dashboard/widget_note.png
	:width: 50%
	:align: center

.. _dashboard_share_dashboards:

******************
Sharing dashboards
******************

A great feature from Tago platform is its native sharing capability for data and dashboards. And we know that sometimes a dashboard can become an entire feature that you want to share. There are two ways of sharing a dashboard with another user:

* :ref:`dashboard-share`
* :ref:`dashboard-clone`

.. _dashboard-share:

Share
*****

When you share your dashboard, others can only visualize it or input data as you defined. They will not be able to move, resize, or even edit any widget. They will have only visual access to the variables that you added on that specific dashboard, nothing else.  Also, they are not able to share those dashboards with anybody else.

To **share** a dashboard with someone, you must access that dashboard and then, through the **Dashboard options** menu, click on **Share**.

.. raw:: html

	 <video style="max-width: 100%;" preload="none" src="_static/dashboard/dashboard_share_1.mp4"   controls></video><br><br>

To complete the action, fill the email of whom you want to share your dashboard. Then optionally write him/her a message.

.. raw:: html

	 <video style="max-width: 100%;" preload="none" src="_static/dashboard/dashboard_share_2.mp4"   controls></video><br><br>

In that screen you can also visualize the list of people who already can access the dashboards that your shared. From there, you can also stop sharing your dashboard by clicking on the trash can icon. 

.. raw:: html

	 <video style="max-width: 100%;" preload="none" src="_static/dashboard/dashboard_share_3.mp4"   controls></video><br><br>

.. _dashboard-clone:

Clone
*****

When you create a clone of your dashboard, others will only receive the dashboard without having any access to your data. They are able to edit the dashboard and its widgets without impacting yours.

To **clone** a dashboard and send it to someone, you must access that dashboard and then, through the **Dashboard options** menu, click on **Share**.

.. raw:: html

	 <video style="max-width: 100%;" preload="none" src="_static/dashboard/dashboard_copy_1.mp4"   controls></video><br><br>

To complete the action, fill the email of whom you want to copy your dashboard to, optionally write him/her a message and then describe the type of devices that are needed for that dashboard. (we automatically gather the devices used by your dashboard and show you just what you need to describe)

.. raw:: html

	 <video style="max-width: 100%;" preload="none" src="_static/dashboard/dashboard_copy_2.mp4"   controls></video><br><br>

*******************
Renaming dashboards
*******************

