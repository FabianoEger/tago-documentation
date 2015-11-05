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

```json
{ 'value': 32, 'variable': 'fuel_level', 'unit': '%' }
```

Now, let’s send this variable using curl and httpie. We will need the device token created in the earlier step.

### curl

<img src="https://tago.io/assets/img/screenshot/sending_data_1.png" alt="" width="707" height="342.5">

### httpie

<img src="https://tago.io/assets/img/screenshot/sending_data_2.png" alt="" width="707" height="342.5">

It was very easy, right? We may even have an SDK for your language for simple plug-and-play. Check out our [Github page](https://github.com/tago-io).

This is an example using node.js. You can copy the code from our github page.

<img src="https://tago.io/assets/img/screenshot/sending_data_3.png" alt="" width="456.5" height="342.5">
