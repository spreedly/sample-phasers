sample-phasers
==============

This is a sample application designed to demonstrate how to use the [Spreedly](https://spreedly.com) API to collect money for one-off purchases using credit cards. This method uses [web forms and transparent redirects](https://docs.spreedly.com/guides/adding-payment-methods/web-form/) to tokenize.

This is not the recommended method of tokenization, as having customer JS interacting with the payment information increases PCI scope over using [Spreedly's iFrame](https://docs.spreedly.com/guides/adding-payment-methods/iframe/).

It uses the [httparty](https://github.com/jnunemaker/httparty) gem.

