#!/usr/bin/env bash

echo "Requires:"
echo "    sudo pip install jinja2 jinja2-cli"

jinja2 events-http.tf.j2 events-http.tf.json > ../events-http.tf

echo "TODO: output some stuff for 'local.tf'"

echo "Done"
