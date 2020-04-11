#!/usr/bin/env python3
import os
import argparse
import webui

from custom_metadata import metadata_gen

metadata_gen.download_extra_metadata()

# handle command-line arguments
parser = argparse.ArgumentParser()
parser.add_argument('-a', '--addr', default='0.0.0.0',help='address to bind to [127.0.0.1]')
parser.add_argument('-p', '--port', default='8000', type=int, help='port to listen on [8080]')
args = parser.parse_args()

# change to webui's directory and import
if os.path.dirname(__file__) != "":
    os.chdir(os.path.dirname(__file__))

# set up webui and run in own http server
webui.bottle.debug(False)
webui.bottle.run(server='waitress', host=args.addr, port=args.port)



# vim: foldmethod=marker:filetype=python:textwidth=80:ts=4:et
