
.. _ref_analysis_analysis:

Analysis
********
The analysis is a powerful tool where developers and enthusiasts can automate processes , calculations and manipulate your data in real time.

**space for gif**

All code writed here is in javascript, node.js to be more exactly. You will have access to all data inside your buckets, all your devices and we provide some other librarys like lodash and async to improve your code.



Setting Up Analysis
===================

Widgets
-------

Internal Functions
===================
Our Analysis have a lot of functions to help you in order to manipulate buckets and devices, and some services you can use to send sms and get informations about your account. Is possible to configure and setup almost everything in tago through analysis.

lodash
-------
You can call lodash (**_**) as a native function in analysis, without need to set it up. Lodash is a powerful library to manipulate data and compare values, you can read more about how to use it in the follow documentation: https://lodash.com/docs

**Example:**

.. code-block:: javascript

  var my_array = [1,2,3];
  _.forEach(my_array, function(x){
    console.log(x);
  });

  //-> Will return 1, 2, 3 in each line respectively.

moment.js
-------
You can call Moment.js (**moment_tz**) as a native function in analysis whitout need to set it up. With Moment.js you will be able to do more complex calculations about time and date through analysis. You can read more about how to use it in the follow documentation: http://momentjs.com/docs/

**Example:**

.. code-block:: javascript

  moment_tz("12-25-1995", "MM-DD-YYYY");
  //-> Will return a date object

async
-------
You can call async as a native function in analysis whitout need to set it up. This Library allows you to organize your functions soo you can get all performance you need. You can read more about how to use it in the follow documentation: https://github.com/caolan/async

**Example:**

.. code-block:: javascript

  async.parallel([functions(...)], function(error, result){
    console.log(result);
  });
  //-> Force an asynchronous functions to wait for another in order to complet a task.

bucket
-------
Bucket is the most valuable function in all analysis. You will need to use it always when you want to get, insert, update or delete variables from your bucket. The first pass is to select your bucket by your ID. After that, you will be able to use a lot of child functions which will allow you to manipulate your data.

**Arguments**

*(String) You need to pass a bucket ID. Only one ID is possible.*

**Returns**

*(\*) Returns an object which you can use to do a CRUD.*

**Examples**

.. code-block:: javascript

  var my_bucket = bucket("15787a4s15s4d799as");
  my_bucket("variable").query("last_value").run(function(error, result) {
    console.log(result);
  });
  //-> The first line declares what bucket you will access by ID
  //-> The following line do a search for variable "variable" inside that bucket

.query
^^^^^^^

.value
^^^^^^^
Can pass a value to find in your bucket, and the API will return to you the location, date and other datas related to that value.

**Arguments**

*(String/Integer) You will need to pass a value.

**Returns**

*(Array) Return an Array with corresponding times which this value was inserted in bucket. You can use **.query("last_value")** to get the last one.

**Examples**

.. code-block:: javascript

  var my_bucket = bucket("15787a4s15s4d799as");
  my_bucket("color").value("blue").query("last_value").run(function(error, result) {
    console.log(result);
  });
  //->  [[{"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-25T19:01:22.000Z","serie":1448132464126,"location":{"type":"Point","coordinates":[-78.822224,35.7469741]},"value":"blue","id":"5650bf843644b39f35a8e108"}]

.qty
^^^^^^^
Limit the number of results that will come from a query in a array. The default value is 15.

**Arguments**

*(Integer) Number of querys to return.*

**Returns**

*(\*) Don't let the query exceed the limit previously determinated*

**Examples**

.. code-block:: javascript

  var my_bucket = bucket("15787a4s15s4d799as");
  my_bucket("color").qty(3).run(function(error, result) {
    console.log(result);
  });
  //->  [{"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-25T19:01:22.000Z","serie":1448132464126,"location":{"type":"Point","coordinates":[-78.822224,35.7469741]},"value":"blue","id":"5650bf843644b39f35a8e108"},
  //->  {"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-25T18:47:18.000Z","serie":1448131620070,"location":{"type":"Point","coordinates":[-78.761717,35.7722995]},"value":"red","id":"5650bc3758f890b23427c976"},
  //->  {"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-24T18:25:43.000Z","serie":1448130323366,"location":{"type":"Point","coordinates":[-78.7617483,35.772326]},"value":"blue","id":"5650b72658f890b23427c87b"}(...)]

.start_date
^^^^^^^
Don't let the query return any result before a date. You can combine this function with end_date to create a period. Can pass a lot of types of argument, like a moment.js, a Date, a string formated date or even a string date like "1 day", "2 years".

**Arguments**

*(String/Date) Pass a string date / moment.js Date.*

**Examples**

.. code-block:: javascript

  var my_bucket = bucket("15787a4s15s4d799as");
  my_bucket("color").start_date("2 day").query("last_value").run(function(error, result) {
    console.log(result);
  });
  //->  [{"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-25T18:25:43.000Z","serie":1448130323366,"location":{"type":"Point","coordinates":[-78.7617483,35.772326]},"value":"blue","id":"5650b72658f890b23427c87b"},
  //->  {"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-25T17:01:45.000Z","serie":1448125287014,"location":{"type":"Point","coordinates":[-78.6379951,35.7788033]},"value":"yellow","id":"5650a37a58f890b23427c138"},
  //->  {"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-24T16:25:25.000Z","serie":1448123105311,"location":{"type":"Point","coordinates":[-78.8221858,35.7469293]},"value":"red","id":"56509af53644b39f35a8d54c"}]

.end_date
^^^^^^^
Don't let the query return any result after a date. You can combine this function with start_date to create a period. Can pass a lot of types of argument, like a moment.js, a Date, a string formated date or even a string date like "yesterday", "1 day", "2 years".

**Arguments**

*(String/Date) Pass a string date / moment.js Date.*

**Examples**

.. code-block:: javascript

  var my_bucket = bucket("15787a4s15s4d799as");
  my_bucket("color").start_date("2 day").query("last_value").run(function(error, result) {
    console.log(result);
  });
  //->  [{"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-24T18:25:43.000Z","serie":1448130323366,"location":{"type":"Point","coordinates":[-78.7617483,35.772326]},"value":"blue","id":"5650b72658f890b23427c87b"},
  //->  {"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-24T17:01:45.000Z","serie":1448125287014,"location":{"type":"Point","coordinates":[-78.6379951,35.7788033]},"value":"yellow","id":"5650a37a58f890b23427c138"},
  //->  {"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-23T16:25:25.000Z","serie":1448123105311,"location":{"type":"Point","coordinates":[-78.8221858,35.7469293]},"value":"red","id":"56509af53644b39f35a8d54c"}]

.run
^^^^^^^
Everytime you need to query any data from bucket, "run" is needed in order to work with the results. This functions is not useful when using insert or clear.

**Arguments**

*(Function): The function invoked per iteration.*

**Returns**

*(\*) An error and result of the iteration*

**Examples**

.. code-block:: javascript

  var my_bucket = bucket("15787a4s15s4d799as");
  my_bucket("color").run(function(error, result) {
    console.log(result);
  });
  //->  [{"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-24T19:01:22.000Z","serie":1448132464126,"location":{"type":"Point","coordinates":[-78.822224,35.7469741]},"value":"blue","id":"5650bf843644b39f35a8e108"},
  //->  {"variable":"color","origin":"54ab3ee59a56af7a067b7b89","time":"2015-11-24T18:47:18.000Z","serie":1448131620070,"location":{"type":"Point","coordinates":[-78.761717,35.7722995]},"value":"red","id":"5650bc3758f890b23427c976"}(...)]

.insert
^^^^^^^
Insert some data in your bucket. Different of the other functions of bucket, this function don't need "run" function to work.

**Arguments**

*(JSON): JSON with all possible datas to insert {"value"=}*

.. code-block:: javascript

  {"value": "red",
  "serie" :"1448132464126",
  "time"  :"2015-11-24T18:47:18.000Z",
  "unit"  :"",
  (...)}

*(String): A String with ID of the origin. Default is the script analysis ID.*
*(Function): The function invoked per iteration.*

**Returns**

*(\*) An error and result of the iteration*

**Examples**

.. code-block:: javascript

  var my_bucket    = bucket("15787a4s15s4d799as");
  var insert_model = {
    "value":"red"
  }
  var origin_id    = "54ab3ee59a56af7a067b7b89";

  my_bucket("color").insert(insert_model, origin_id, function(error, result) {
    console.log(result);
  });
  //->  {"message":"1 Data Added, 0 Errors","added":[{"data":{"bucket":"54ab3ee59a56af7a067b7b8a","variable":"color","created_at":"2015-11-24T01:03:30.754Z","updated_at":"2015-11-24T01:03:30.754Z","origin":"54ab3ee59a56af7a067b7b89","origin_type":"custom","time":"2015-11-24T01:03:30.754Z","value":"red","id":"5653b76296cbc40f16222c90"}}],"errors":[]}


service
-------

devices
^^^^^^^

Internal Variables
===================

scope
-------
Every time a action triggers a script, the variable **scope** will be generated. For example, if you do submit in a form, with a variable that have an action which will trigger any script, scope will receive a list with all values of that form. This allows you to manipulate in real time, and more easily, any new value wich are inserted in your bucket.

**Contents**

*(Array): Always an array with all variables inserted in that moment*

**Example:**

.. code-block:: javascript

  console.log(scope);
  //-> Will return a date object

##var##
-------
