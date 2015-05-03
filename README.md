# Frontend Server for Meteor Up

This is the front end server used by Meteor Up infront of meteor apps. This is a the latest version of nginx bundled as a docker image. It is configured to run with every app deployed with Meteor Up. But, this is not a Load Balancer.

## For SSL Support

We use this for SSL support for Mup.

Here's how to run this:

~~~shell
docker run \
  --volume=/opt/<appname>/config/bundle.crt:/bundle.crt \
  --volume=/opt/<appname>/config/private.key:/private.key \
  --link=<appname>:backend \
  --publish=443:443 \
  meteorhacks:mup-frontend-server /start.sh
~~~

As you've noticed, we need to add two volumes for the `bundle.crt` and `private.key`.

**bundle.crt**

This is bundle containing all of your certficated including the provided CA certificates. To create this file you need to concatnate all ceritifcates starting from your domain certificate to top level CA certificates. Here's an example:

~~~shell
cat \
    bulletproofmeteor_com.crt \
    COMODORSADomainValidationSecureServerCA.crt \
    COMODORSAAddTrustCA.crt \
    AddTrustExternalCARoot.crt > bundle.crt
~~~

**private.key**

This is the private key you've used to generate the above certficate.

### Verfiy Configuration

You can verify SSL configuration like this:

~~~shell
docker run \
  --volume=/opt/<appname>/config/bundle.crt:/bundle.crt \
  --volume=/opt/<appname>/config/private.key:/private.key \
  meteorhacks:mup-frontend-server /verify.sh
~~~

### Why Nginx?

It's a question why we've choosen nginx for the SSL termination. We could've used something like `stud` of `bud`.

We need to get correct IP Address of the real connection. That's usable for some apps and for Sikka. Normally SSL terminators like `stud` and `bud` does not support it for support it partially.

## For Static File Caching

We've not implemented this yet!