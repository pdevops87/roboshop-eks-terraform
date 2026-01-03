#!/bin/bash

echo "Hello World" >/opt/sample.txt
tail -f /dev/null   # keep the container alive
