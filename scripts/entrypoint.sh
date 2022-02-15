#!/usr/bin/env bash
rundev () {
    yarn dev
}
rundev;tail -f /app/scripts/list.txt;