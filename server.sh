#!/bin/sh
wine /vu/client/vu.com -gamepath /vu/battlefield -activate -o_mail ${ORIGIN_EMAIL} -o_pass ${ORIGIN_PASSWORD}
wine /vu/client/vu.com -gamepath /vu/battlefield -serverInstancePath /vu/instance -listen 0.0.0.0:25200 -mHarmonyPort 0.0.0.0:7949 -server -dedicated ${EXTRA_ARGS}
