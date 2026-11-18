#!/usr/bin/env bash

networksetup -listpreferredwirelessnetworks en0 | sed -n '2s/^\t//p'
