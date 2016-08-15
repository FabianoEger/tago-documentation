
.. _ref_analysis_analysis:

###########
Analysis V2
###########
The **analysis** is a powerful feature at Tago that experts and software developers can use to implement scripts to analyze and manipulate the data sent by the devices in real time.

Analysis is programmed using Node.js Tago’s SDK. You can get more instructions on how to write an analysis script in our `SDK documentation <http://sdk.js.tago.io/en/latest/>`_.

By using the Analysis, you have access to all your data, devices, and even the services provided by Tago. One example of service is the weather that provides realtime condition data about the current and forecast weather for different locations.

Also, if you combine Analysis with Actions you can execute that script whenever a predefined variable with value arrives at Tago.
For example, you can process your data and perform a math transformation for any variable. Also you can add new values in another data bucket, get data from there, or program actions that will send email, SMS, or data back to an specific device.
If you are new at Tago, take a look at this short video that will introduce you to Tago Analysis. You will understand how the pieces are put together, and what are the steps that you need to take to start scripting today.


There are three main steps that you need to take in order to create and run your scripts on analysis.

| 1. Setup 
| 2. Code your script
| 3. Upload
|

********************
Creating an Analysis
********************
Create your own analysis is easy. First, you need to click on Add Analysis in the upper left of the analysis main screen. Just write a name and a description, and you're ready to go!

.. image:: _static/analysis/analysis_new.png

.. _analysis_general_information:

1. Setup
********
It's possible to setup the analysis in many ways. For initial purposes, we will only set the analysis to run with an external script. It allows you to run the analysis direct from your machine, and do any changes you want in realtime. After downloading the example, you need get :ref:`Analysis-Token <ref_analysisv2_general>` from your analysis and set inside the index.js

| 1. **Open** the specific analysis;
| 2. Select to run **"external"**;
| 3. Copy the **Analysis-Token** - you will use it later in your code;
| 4. **Press "Show Examples"** and **Download** an example;
|   4-1. Check the description of the example on the **Readme.md** for instructions of how to use it;
| 5. **Press "Show Variables"** and set the **Environment Variables** if needed;
| 7. Replace the Analysis-Token in your script with that one copied at step 3.
|

.. image:: _static/analysisv2/analysis.gif

2. Code your script
*******************
Open the example with the editor of your preference, and make the changes that you need in the code as necessary. Currently, if you are wish to run your code at Tago, have in mind that Tago only supports Node.js and Python languages. However, you are free to use any language you want if your select to run the analysis in the 'external' server. It means that if you chose to program in another language, you won't be able to upload the script on Tago; you will need to run the code in your machine or another server instead.

To write your code using node.js language, follow these steps:

| 1. Inside the folder where you downloaded the example, install `npm install`;
| 1. Open the **index.js** that you downloaded from the example using your editor;
| 2. **Edit** or **create** the code as needed;
|

*Node.js and NPM*
=================
Node isn’t a program that you simply launch like Word or Photoshop: you won’t find it pinned to the taskbar or in your list of Apps. To use Node you must type command-line instructions, so you need to be comfortable with (or at least know how to start) a command-line tool like the Windows Command Prompt, PowerShell, Cygwin, Bash or the Git shell (which is installed along with Github for Windows).

Warning: You can use any version of Node.js to run analysis on your machine. But if you desire to upload the analysis to Tago to run it, the version restriction is 4.4.7

| **How to Install**
| Please, open `Node.js Linux Installation Guide <https://nodejs.org/en/download/package-manager/>`_ for instructions.
| 
| **Tago SDK Install**
| The Tago SDK for Node.js is essential to help you send instructions to Tago and run any of our examples.
| Run `npm install tago` in your command-line tool.
|

*Python*
========
We are still working on a SDK for Python. Check Other Languages if you need to program in Python before our official support.

*Other Languages*
=================
In the futuro, Tago will provide some SDK for other languages such as C# and C. If you still want to use them to communicate with Tago, you can check our :ref:`Api documentation <ref_api_api>` and send your own http requests.

3. Upload
*********
As you can run your scripts on your machine, this step is only necessary if you want to let Tago handle the script for you.

When uploading a script, Tago will run it using Node version 4.4.7 LTS or Python 2.7. If you are using a more recent version, you should check for compatibility before upload it. 

*All available examples for download are compatible with Tago*

| 1. If your script have **dependencies**, get our `CLI <http://sdk.js.tago.io/en/latest/analysis.html#build>`_ and build to a single analysis;
| 2. **Press "Upload File"** on admin analysis;
| 3. Select the **.js file**;
| 4. Change to **run script from "Tago"**;
|

.. _ref_analysisv2_general:

*******************
General Information
*******************
When you get inside your analysis, you will come across some configurations that will help you to personalize your analysis. In the General Information area, you should define the *time interval* that your analysis will run continuously, and the *environment variables* that are essential to a successful modular script.

.. image:: _static/analysisv2/analysis_general.png

| 1. **Analysis Name**: set the analysis name;
| 2. **Time interval to run this script**: set the time period that your script will automatically run. If you want your script to be initiated by an event, select "never" and you can configure the :ref:`action <ref_actions_run_analysis>` to do it;
| 3. **Run this script from**: It's possible to select "Tago" to run script that you have uploaded to Tago, or select "External" to run script outside of tago servers, like your machine;
| 4. **Script language used for this script**: if you select "Tago" enviroment to run the script, it will need to set the code of the script. The availables are Python and Node. If you select external in the previous parameter, you don't need to set this one;
| 5. **Upload Script**: Upload a .js (node) file or .py (python) to Tago. You can only upload one file that will run when analysis is triggered. Uploading script can't be undone;
| 6. **Analysis Token**: Token of the Analysis. Needed to run the analysis in a external enviroment;
| 7. **Generate new Token**: Change the analysis token to a new one;
| 8. **More**: Will show "more about this script" table;
|   8-1. **ID**: the ID of this script. Note: Origin will automatically use this ID when none is declared;
|   8-2. **Registered at**: date when your analysis was created;
|   8-3. **Last runn**: last time the analysis was triggered;
|   8-4. **Last update**: last time the analysis was modified;
|   8-5. **Description**: set the analysis description;
| 9. **Show Variables**: Show the environment variables of the analysis;
| 10. **Show Console**: Show the console of the analysis;
| 11. **Show Examples**: Show a list of analysis examples. You can download them and use as you wish;
| 12. **Run Script**: will immediately run your script;
| 13. **Save**: Save any change made in the analysis information;
| 14. **Actived**: Turn on/off the current analysis;
| 15. **Delete**: Delete current analysis;
|

Environment Variables
*********************
Enviroment Variables is a very useful resource to send variables to the context of your analysis. You can, for example, put token of accounts and devices here, to be used later in the analysis when it runs. Analysis will get this variables by the parameter "environment" in the context object.

.. image:: _static/analysisv2/analysis_variables.png

| 1. **New Environment variable**: will add an environment variable. No need to delete, just leave blank if you don't need to use it
| 2. **Name**: the variable name.
| 3. **Value**: the value of the variable. It can be *integer* or *string*
|

Examples
********
Tago provide a list of analysis examples to help you understand better how to use our analyze service. There you can get great examples on how to get and insert records, send email and other things.

All examples come with a README.md file, with instructions to help you put the analysis to work. Remember to read them.

.. image:: _static/analysisv2/analysis_examples.png

| 1. **Name**: Name of the Example;
| 2. **Description**: Description of the Example;
| 3. **Download**: Download a ZIP of the selected example.;
|

Console
*******
Use the console to monitor the variables and status of your script. You can see any error or word generated by "console.log". It is also a very good debug tool.

.. image:: _static/analysis/analysis_console.png

| 1. **Run Script**: will immediately run your script;
| 2. **Console Screen**: Any error or response to a "context.log" will be show up here;
| 3. **Clear Console**: clear everything that are showed in your console screen;
| 4. **Auto-Clear**: clear the console every time the script runs;
|
