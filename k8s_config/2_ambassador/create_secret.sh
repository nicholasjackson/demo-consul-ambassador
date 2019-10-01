#!/bin/bash

 kubectl create secret tls ambassador-certs --cert=origin.crt --key=origin.key
