It is easy to connect electronic devices, data sources, and even third party APPs to your account using Tago API (Application Programming Interface).

We have a comprehensive set of APIs that give you full control to manage your accounts, data, devices, dashboards, and scripts. For example, you can use the resources available in the Admin page to create, delete, or edit your accounts and dashboards; however, you can do all the same things directly using API.

We follow RESTful principles. Before checking the API documentation, there are some details you should know.

All responses from Tago API have a pattern, and you will always receive something like this:

```
{ status: ok||false, result: []||{}||''||0 }
```

**status**: it is always boolean. If your request is successful the response will be **true**, otherwise it will be **false**.

result: it has no type; it depends on the function you called. If its status is **false**, the result will show the type of the error.


## Security

Tago takes the necessary steps to protect your data in the database and also during the communication between our server and your devices.

All communication between the devices, your application, and Tago server is performed through Hypertext Transfer Protocol Secure (HTTPS) to avoid the man-in-the-middle and wiretapping attacks.

Although the communication can also be performed with HTTP, Tago doesn’t recommend it. By doing so will eliminate the security of authentication and encryption provided by SSL/TLS protocols part of HTTPS.

Secret tokens for account and devices are generated by Tago system and can be individually managed by the user. Different levels of access can be granted to different users or devices.

## Tokens

There are two type of tokens: `Account-Token` and `Device-Token`.

You are able to generate both tokens from Tago admin or directly using API. The type of token and its expiration can also be defined.

Using tokens is simple, just add them in the header of the request.