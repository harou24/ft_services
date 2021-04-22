#!/bin/sh

telegraf &
grafana-server --homepath=/grafana
